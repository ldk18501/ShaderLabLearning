Shader "LDKCustom/Particles/L18_UVPolarAnim"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
        [HDR] _Color ("RGB：颜色", Color) = (1, 1, 1, 1)
        _Opacity ("不透明度", Range(0, 1)) = 0.5
        
        _AnimSpd ("帧速", Float) = 0
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
            uniform float3 _Color;
            uniform float _Opacity;
            uniform float _AnimSpd;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float2 uv0: TEXCOORD0;
                float4 color: COLOR;
            };
            struct VertexOutput
            {
                float4 pos: SV_POSITION;
                float2 uv0: TEXCOORD0;
                float4 color: COLOR;
            };
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                o.color = v.color;
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                i.uv0 = i.uv0 - 0.5;
                float theta = atan2(i.uv0.y, i.uv0.x);
                float r = length(i.uv0) + frac(_Time.x * _AnimSpd);
                i.uv0 = float2(theta / 3.1415926 * 0.5 + 0.5, r);
                
                
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float opacity = (1 - var_MainTex.r) * _Opacity * i.color.r;
                return float4(var_MainTex.rgb * opacity * _Color.rgb, opacity);
            }
            ENDCG
            
        }
    }
}
