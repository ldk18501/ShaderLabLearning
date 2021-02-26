Shader "LDKCustom/L8_LitSpecAOShadow"
{
    // 声明给材质面板的参数
    Properties
    {
        _BaseCol ("基本色", Color) = (0.5, 0.5, 0.5, 1)
        _LightCol ("光照颜色", Color) = (0.5, 0.5, 0.5, 1)
        _SpecCol ("高光颜色", Color) = (0.5, 0.5, 0.5, 1)
        _SpecPow ("高光次幂", Range(1, 100)) = 10
        
        _EnvRatio ("环境光强度", Range(0, 1)) = 0
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            
            uniform float3 _BaseCol;
            uniform float3 _LightCol;
            uniform float3 _SpecCol;
            uniform float _SpecPow;
            
            uniform float _EnvRatio;
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
                float4 pos: SV_POSITION;
                float2 uv: TEXCOORD0;
                float4 posWS: TEXCOORD1;
                float3 nDirWS: TEXCOORD2;
                LIGHTING_COORDS(3, 4)
            };
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                
                o.pos = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.uv = v.uv0;
                
                //UNITY提供的TRANSFER_XXX方法会使用到 v.vertex或o.pos来计算，所以输出结构中的参数名不能随意否则报错
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                //准备向量，遇到不会的可以去sf找答案
                
                //法线归一化效果更好
                float3 nDir = normalize(i.nDirWS);
                float3 lDir = _WorldSpaceLightPos0.xyz;
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3 rDir = reflect(lDir * - 1.0, nDir);
                
                //准备中间数据，如点积结果
                float lDotN = dot(lDir, nDir);
                float rDotV = dot(vDir, rDir);
                
                float top = max(i.nDirWS.g, 0.0);
                float bottom = max(-i.nDirWS.g, 0.0);
                float middle = 1.0 - top - bottom;
                
                //编写光照模型
                float3 spec = pow(max(0.0, rDotV), _SpecPow) * _SpecCol;
                float3 diffuse = max(0, lDotN);
                float shadow = LIGHT_ATTENUATION(i);
                float aoTex = tex2D(_AOTex, i.uv);
                float3 envCol = _EnvTopCol.rgb * top + _EnvMiddleCol.rgb * middle + _EnvBottomCol.rgb * bottom;
                
                float3 finalCol = (_BaseCol * diffuse + _SpecCol * spec) * _LightCol * shadow + _BaseCol.rgb * envCol * _EnvRatio * aoTex;
                //后处理
                
                //返回结果
                return fixed4(finalCol, 1.0);
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
