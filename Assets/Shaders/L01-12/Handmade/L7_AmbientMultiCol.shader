Shader "LDKCustom/L7_AmbientMultiCol"
{
    // 声明给材质面板的参数
    Properties
    {
        _AOTex ("环境光贴图", 2D) = "white" { }
        _EnvTopCol ("顶部颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        _EnvMiddleCol ("中部颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        _EnvBottomCol ("底部颜色", Color) = (1.0, 1.0, 1.0, 1.0)
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        Pass
        {
            Name "FORWARD"
            Tags { "LightMode" = "ForwardBase" }
            
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            
            uniform sampler2D _AOTex;
            uniform float3 _EnvTopCol;
            uniform float3 _EnvMiddleCol;
            uniform float3 _EnvBottomCol;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float3 normal: NORMAL;
                float2 uv0: TEXCOORD0;
            };
            struct VertexOutput
            {
                float4 posCS: SV_POSITION;
                float3 nDirWS: TEXCOORD0;
                float2 uv: TEXCOORD1;
            };
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.uv = v.uv0;
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                //准备向量，遇到不会的可以去sf找答案
                
                //准备中间数据，如点积结果
                float top = max(i.nDirWS.g, 0.0);
                float bottom = max(-i.nDirWS.g, 0.0);
                float middle = 1.0 - top - bottom;
                
                //编写光照模型
                float3 finalCol = _EnvTopCol.rgb * top + _EnvMiddleCol.rgb * middle + _EnvBottomCol.rgb * bottom;
                float aoTex = tex2D(_AOTex, i.uv);
                
                //后处理
                
                //返回结果
                return fixed4(finalCol.rgb * aoTex, 1.0);
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
