Shader "LDKCustom/Particles/L14_UVAnim"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
        _FlowSpdMain ("贴图流速", Range(-10, 10)) = 1
        _Opacity ("透明度", Range(0, 1)) = 0.5
        
        _WarpTex ("RGB：扭曲法线贴图", 2D) = "white" { }
        _WarpIntensity ("扭曲强度", Range(0, 5)) = 1
        _NoiseTex ("RGB：噪音贴图", 2D) = "white" { }
        _NoiseIntensity ("噪音强度", Range(0, 5)) = 1
        _FlowSpdNoise ("噪音流速", Range(-10, 10)) = 1
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType" = "TransparentCutout" "ForceNoShadowCasting" = "True" "IgnoreProjector" = "True" }
        Pass
        {
            Name "FORWARD"
            Tags { "LightMode" = "ForwardBase" }
            Blend One OneMinusSrcAlpha
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NoiseTex; uniform float4 _NoiseTex_ST;
            uniform sampler2D _WarpTex; uniform float4 _WarpTex_ST;
            uniform float _Opacity;
            uniform float _WarpIntensity;
            uniform float _NoiseIntensity;
            uniform float _FlowSpdMain;
            uniform float _FlowSpdNoise;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float2 uv0: TEXCOORD0;
            };
            struct VertexOutput
            {
                float4 pos: SV_POSITION;
                float2 uv0: TEXCOORD0;
                float2 uv1: TEXCOORD1;
                float2 uv2: TEXCOORD2;
            };
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                o.uv1 = v.uv0 * _WarpTex_ST.xy + _WarpTex_ST.zw;
                o.uv1.y += frac(-_Time.x * _FlowSpdNoise);
                o.uv2 = v.uv0 * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
                o.uv2.y += frac(-_Time.x * _FlowSpdNoise);
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                float4 var_WarpTex = tex2D(_WarpTex, i.uv1);
                float2 uvBias = (var_WarpTex.rg - 0.5) * _WarpIntensity;
                float4 var_MainTex = tex2D(_MainTex, i.uv0 + uvBias + float2(0, frac(-_Time.x * _FlowSpdMain)));
                float4 var_NoiseTex = tex2D(_NoiseTex, i.uv2 + uvBias);
                
                float noiseWarp = lerp(1.0, var_WarpTex.b * 2, _NoiseIntensity);
                float noise = lerp(1.0, var_NoiseTex.b * 2, _NoiseIntensity);
                //noise图中有负值，如果直接使用，计算结果会有反色
                noise = max(0.0, noise);
                float opacityWarp = var_MainTex.a * _Opacity * noiseWarp;
                float opacityNoise = var_MainTex.a * _Opacity * noise;
                
                float3 warpCol = var_MainTex.rgb * opacityWarp;
                float3 noiseCol = var_MainTex.rgb * opacityNoise;
                
                //输出结果为src.rgb * _BlendModeSrc op dst.rgb * _BlendModeDst
                return float4(max(warpCol, noiseCol), max(opacityWarp, opacityNoise));
            }
            ENDCG
            
        }
    }
}
