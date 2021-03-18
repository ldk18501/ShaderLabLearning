Shader "LDKCustom/LDK_Dissolve"
{
    Properties
    {
        _MainTex ("RGB：贴图", 2D) = "white" { }
        _NoiseTex ("RGB：噪音贴图", 2D) = "white" { }
        [HDR] _DissolveCol ("顶部颜色", Color) = (0, 0, 0, 1)
        _DissolveThickness ("溶解边缘厚度", range(0.0, 0.1)) = 0.05
        _DissolveInt ("溶解程度", range(0.0, 1.0)) = 0.0
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType" = "Transparent" }
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
            
            uniform sampler2D _MainTex;
            uniform sampler2D _NoiseTex; uniform float4 _NoiseTex_ST;
            uniform float4 _DissolveCol;
            uniform float _DissolveThickness;
            uniform float _DissolveInt;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float2 uv0: TEXCOORD0;
            };
            struct VertexOutput
            {
                float4 pos: SV_POSITION;
                float2 uv0: TEXCOORD0;
            };
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv0;
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float4 var_NoiseTex = tex2D(_NoiseTex, i.uv0 * _NoiseTex_ST.xy + _NoiseTex_ST.zw);
                
                float noise = clamp(var_NoiseTex.r, 0.0, 0.9);
                float dissolve = step(_DissolveInt, noise);
                float dissolveLate = step(_DissolveInt - _DissolveThickness, noise);
                float3 dissolveDelta = (dissolveLate - dissolve) * _DissolveCol;
                
                float3 finalRGB = var_MainTex.rgb * dissolve + dissolveDelta;
                return float4(finalRGB, dissolveLate);
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
