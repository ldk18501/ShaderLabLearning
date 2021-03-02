﻿Shader "LDKCustom/Particles/L13_AlphaBlend"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
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
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                half4 var_MainTex = tex2D(_MainTex, i.uv0);
                return var_MainTex;
            }
            ENDCG
            
        }
    }
}
