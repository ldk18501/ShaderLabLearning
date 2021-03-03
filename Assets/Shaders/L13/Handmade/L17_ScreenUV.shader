Shader "LDKCustom/Particles/L17_ScreenUV"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
        _Opacity ("透明度", Range(0, 1)) = 0.5
        _ScreenTex ("RGB：贴图", 2D) = "white" { }
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
            uniform sampler2D _ScreenTex; uniform float4 _ScreenTex_ST;
            uniform float _Opacity;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float2 uv0: TEXCOORD0;
            };
            struct VertexOutput
            {
                float4 pos: SV_POSITION;
                float2 uv0: TEXCOORD0;
                float2 screenUV: TEXCOORD1;
            };
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                float3 posVS = UnityObjectToViewPos(v.vertex);
                float posDepth = UnityObjectToViewPos(float3(0, 0, 0)).z;
                o.screenUV = posVS.xy;
                //消除畸变
                o.screenUV /= posVS.z;
                o.screenUV *= posDepth;
                //tile&一点offset小动画
                o.screenUV = o.screenUV * _ScreenTex_ST.xy + frac(_Time.x * _ScreenTex_ST.zw);
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                float4 var_ScreenTex = tex2D(_ScreenTex, i.screenUV);
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float3 finalCol = var_MainTex.rgb;
                float opacity = var_MainTex.a * _Opacity * var_ScreenTex.r;
                return float4(finalCol * opacity, opacity);
            }
            ENDCG
            
        }
    }
}
