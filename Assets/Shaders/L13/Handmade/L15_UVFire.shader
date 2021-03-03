Shader "LDKCustom/Particles/L15_UVFire"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
        _Opacity ("透明度", Range(0, 1)) = 0.5
        
        _NoiseTex ("RGB：噪音贴图", 2D) = "white" { }
        
        _Noise1Param ("噪音1：X缩放 Y强度 Z流速", Vector) = (1, 1, 0, 1)
        _Noise2Param ("噪音2：X缩放 Y强度 Z流速", Vector) = (1, 1, 0, 1)
        
        _Color1 ("外焰色", Color) = (1, 1, 1, 1)
        [HDR] _Color2 ("内焰色", Color) = (1, 1, 1, 1)
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
            uniform float _Opacity;
            uniform float4 _Noise1Param;
            uniform float4 _Noise2Param;
            uniform float3 _Color1;
            uniform float3 _Color2;
            
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
                
                o.uv1 = v.uv0 * _Noise1Param.x;
                o.uv1.y += frac(-_Time.x * _Noise1Param.z);
                
                o.uv2 = v.uv0 * _Noise2Param.x;
                o.uv2.y += frac(-_Time.x * _Noise2Param.z);
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                float4 var_MaskTex = tex2D(_MainTex, i.uv0);
                float4 var_NoiseTex1 = tex2D(_NoiseTex, i.uv1);
                float4 var_NoiseTex2 = tex2D(_NoiseTex, i.uv2);
                float noise = var_NoiseTex1.r * _Noise1Param.y * var_NoiseTex2.g * _Noise2Param.y;
                
                float2 warpUV = i.uv0 + noise * var_MaskTex.b;
                
                float4 var_MainTex = tex2D(_MainTex, warpUV);
                float3 finalCol = var_MainTex.r * _Color1.rgb + var_MainTex.g * _Color2.rgb;
                float opacity = (var_MainTex.r + var_MainTex.g) * _Opacity;
                return float4(finalCol, opacity);
            }
            ENDCG
            
        }
    }
}
