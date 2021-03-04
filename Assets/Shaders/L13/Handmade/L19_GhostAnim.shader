Shader "LDKCustom/Particles/L19_GhostAnim"
{
    Properties
    {
        _MainTex ("RGB：贴图  A：透明通道", 2D) = "white" { }
        _Opacity ("透明度", Range(0, 1)) = 0.5
        
        _ScaleParams ("天使圈缩放 X:强度 Y:速度 Z:校正", vector) = (0.2, 1.0, 4.5, 0.0)
        _SwingXParams ("X轴扭动 X:强度 Y:速度 Z:波长", vector) = (1.0, 3.0, 1.0, 0.0)
        _SwingZParams ("Z轴扭动 X:强度 Y:速度 Z:波长", vector) = (1.0, 3.0, 1.0, 0.0)
        _SwingYParams ("Y轴起伏 X:强度 Y:速度 Z:滞后", vector) = (1.0, 3.0, 0.3, 0.0)
        _ShakeYParams ("Y轴摇头 X:强度 Y:速度 Z:滞后", vector) = (20.0, 3.0, 0.3, 0.0)
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
            uniform float _Opacity;
            uniform float4 _ScaleParams;
            uniform float3 _SwingXParams;
            uniform float3 _SwingZParams;
            uniform float3 _SwingYParams;
            uniform float3 _ShakeYParams;
            
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
            #define PI 3.1415926
            void AnimGhost(inout float3 pos, inout float3 color)
            {
                //用color.g做乘子，筛选出头顶绿色的光圈，其他地方顶点色绿通道为0（黑色），所以乘完不受影响
                float scaleDelta = sin(frac(_ScaleParams.y * _Time.y) * 2 * PI) * _ScaleParams.x * color.g;
                pos *= 1 + scaleDelta;
                pos.y -= scaleDelta * _ScaleParams.z;
                
                //排除红绿通道，留下的是头部，用来做旋转和升降
                pos.y += sin(frac(_Time.y * _SwingYParams.y - _SwingYParams.z * color.g) * 2 * PI) * _SwingYParams.x;
                float rotAngle = _ShakeYParams.x * sin(frac(_Time.y * _ShakeYParams.y - _ShakeYParams.z * color.g) * PI * 2) * (1 - color.r);
                float rad = radians(rotAngle);
                float sinVal = sin(rad);
                float cosVal = cos(rad);
                pos.xz = float2(pos.x * cosVal - pos.z * sinVal, pos.x * sinVal + pos.z * cosVal);
                
                //摆动
                float swingX = sin(frac(_Time.y * _SwingXParams.y + pos.y * _SwingXParams.z) * 2 * PI) * _SwingXParams.x;
                pos.x += swingX * color.r;
                float swingZ = sin(frac(_Time.y * _SwingZParams.y + pos.y * _SwingZParams.z) * 2 * PI) * _SwingZParams.x;
                pos.z += swingZ * color.r;
            }
            
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                AnimGhost(v.vertex.xyz, v.color.rgb);
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                o.color = v.color;
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
