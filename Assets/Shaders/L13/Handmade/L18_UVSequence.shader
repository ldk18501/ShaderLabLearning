Shader "LDKCustom/Particles/L18_UVSequence"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
        _AnimTex ("RGB：序列帧贴图  A：透明通道", 2D) = "white" { }
        _Opacity ("不透明度", Range(0, 1)) = 0.5
        
        _AnimCol ("序列帧列数", Int) = 1
        _AnimRow ("序列帧行数", Int) = 1
        
        _AnimSpd ("帧速", Float) = 0
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType" = "TransparentCutout" "ForceNoShadowCasting" = "True" "IgnoreProjector" = "True" }
        Pass
        {
            Name "FORWARD_AB"
            Tags { "LightMode" = "ForwardBase" }
            Blend One OneMinusSrcAlpha
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
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
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float opacity = var_MainTex.a * _Opacity;
                return float4(var_MainTex.rgb * opacity, opacity);
            }
            ENDCG
            
        }
        
        Pass
        {
            Name "FORWARD_AD"
            Tags { "LightMode" = "ForwardBase" }
            Blend One One
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            
            uniform sampler2D _AnimTex; uniform float4 _AnimTex_ST;
            uniform float _Opacity;
            
            uniform float _AnimRow;
            uniform float _AnimCol;
            uniform float _AnimSpd;
            
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
                o.uv0 = v.uv0 * _AnimTex_ST.xy + _AnimTex_ST.zw;
                
                float seq = fmod(floor(_Time.x * _AnimSpd), _AnimRow * _AnimCol);
                float curRow = floor(seq / _AnimCol);
                float curCol = fmod(seq, _AnimCol);
                
                float stepU = 1 / _AnimCol;
                float stepV = 1 / _AnimRow;
                
                float2 initUV = o.uv0 * float2(stepU, stepV) + float2(0, stepV * (_AnimRow - 1));
                o.uv0 = initUV + float2(curCol * stepU, -curRow * stepV);
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                float4 var_AnimTex = tex2D(_AnimTex, i.uv0);
                float opacity = var_AnimTex.a * _Opacity;
                return float4(var_AnimTex.rgb * opacity, opacity);
            }
            ENDCG
            
        }
    }
}
