Shader "LDKCustom/Particles/L19_Rotate"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
        _Opacity ("透明度", Range(0, 1)) = 0.5
        
        _RotRange ("旋转范围", Range(-180, 180)) = 0
        _RotSpd ("旋转速度", Range(0, 5)) = 1
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
            uniform float _RotRange;
            uniform float _RotSpd;
            
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
            void Rotate(inout float3 pos)
            {
                float rotAngle = _RotRange * sin(frac(_Time.y * _RotSpd) * PI * 2);
                float rad = radians(rotAngle);
                float sinVal = sin(rad);
                float cosVal = cos(rad);
                
                pos.xz = float2(pos.x * cosVal - pos.z * sinVal, pos.x * sinVal + pos.z * cosVal);
            }
            
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                Rotate(v.vertex.xyz);
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
