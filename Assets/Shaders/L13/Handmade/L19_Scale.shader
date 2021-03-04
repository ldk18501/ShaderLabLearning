Shader "LDKCustom/Particles/L19_Scale"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
        _Opacity ("透明度", Range(0, 1)) = 0.5
        
        _ScaleRange ("缩放范围", Range(0, 1)) = 0.2
        _ScaleSpd ("缩放速度", Range(0, 5)) = 1
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType" = "TransparentCutout" "ForceNoShadowCasting" = "True" "IgnoreProjector" = "True" }
        Pass
        {
            Name "FORWARD"
            Tags { "LightMode" = "ForwardBase" }
            Blend SrcAlpha OneMinusSrcAlpha
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Opacity;
            uniform float _ScaleRange;
            uniform float _ScaleSpd;
            
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
            
            #define PI 3.1415926
            void Scaling(inout float3 pos)
            {
                pos *= 1 + sin(frac(_ScaleSpd * _Time.y) * 2 * PI) * _ScaleRange;
            }
            
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                Scaling(v.vertex.xyz);
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float3 finalCol = var_MainTex.rgb;
                float opacity = var_MainTex.a * _Opacity;
                return float4(finalCol * opacity, opacity);
            }
            ENDCG
            
        }
    }
}
