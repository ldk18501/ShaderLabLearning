Shader "LDKCustom/Particles/L17_ScreenWarp"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
        _Opacity ("不透明度", Range(0, 1)) = 0.5
        
        
        _WarpXIntensity ("扭曲X强度", Range(-10, 10)) = 0
        _WarpYIntensity ("扭曲Y强度", Range(-10, 10)) = 0
        _WarpMidVal ("扭曲中值", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType" = "TransparentCutout" "ForceNoShadowCasting" = "True" "IgnoreProjector" = "True" }
        GrabPass
        {
            "_BGTex"
        }
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
            uniform float _Opacity;
            uniform sampler2D _BGTex;
            uniform float _WarpXIntensity;
            uniform float _WarpYIntensity;
            uniform float _WarpMidVal;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float2 uv0: TEXCOORD0;
            };
            struct VertexOutput
            {
                float4 pos: SV_POSITION;
                float2 uv0: TEXCOORD0;
                float4 grabPos: TEXCOORD1;
            };
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                o.grabPos = ComputeGrabScreenPos(o.pos);
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                i.grabPos.xy += float2((var_MainTex.g - _WarpMidVal) * _WarpXIntensity, (var_MainTex.b - _WarpMidVal) * _WarpYIntensity) * _Opacity;
                float4 var_BGTex = tex2Dproj(_BGTex, i.grabPos);
                
                float opacity = var_MainTex.a * _Opacity;
                return float4(var_MainTex.rgb * var_BGTex.rgb * opacity, opacity);
            }
            ENDCG
            
        }
    }
}
