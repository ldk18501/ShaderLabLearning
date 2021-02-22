Shader "LDKCustom/L5_Specular"
{
    // 声明给材质面板的参数
    Properties
    {
        _MainCol ("颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        _SpecularCol ("高光颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        _SpecularPow ("高光强度", Range(1, 30)) = 3
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
            
            uniform float3 _MainCol;
            uniform float3 _SpecularCol;
            uniform float _SpecularPow;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float3 normal: NORMAL;
            };
            struct VertexOutput
            {
                float4 posCS: SV_POSITION;
                float4 posWS: TEXCOORD0;
                float3 nDirWS: TEXCOORD1;
            };
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                //准备向量，遇到不会的可以去sf找答案
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3 lDir = _WorldSpaceLightPos0.xyz;
                //float3 hDir = normalize(vDir + lDir);
                float3 rDir = reflect(lDir * - 1.0, i.nDirWS);
                
                //准备中间数据，如点积结果
                float lDotN = dot(lDir, i.nDirWS);
                
                //blinn-phong
                //float hDotN = dot(hDir, i.nDirWS);
                //phong
                float rDotV = dot(vDir, rDir);
                
                //编写光照模型
                float lambert = max(0.0, lDotN);
                float fixSpecular = pow(max(0.0, rDotV), _SpecularPow);
                //为了避免部分机型bug，三维*一维的时候，三维写前面
                float3 finalCol = _MainCol.rgb * lambert + _SpecularCol.rgb * fixSpecular;
                
                //后处理
                
                //返回结果
                return fixed4(finalCol.rgb, 1.0);
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
