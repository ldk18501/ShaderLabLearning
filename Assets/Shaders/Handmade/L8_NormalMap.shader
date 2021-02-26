Shader "LDKCustom/L8_NormalMap"
{
    Properties
    {
        _NormalMap ("法线贴图", 2D) = "bump" { }
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
            
            uniform sampler2D _NormalMap;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float3 normal: NORMAL;
                //tan是四维
                float4 tangent: TANGENT;
                float2 uv0: TEXCOORD0;
            };
            struct VertexOutput
            {
                float4 pos: SV_POSITION;
                float4 posWS: TEXCOORD0;
                float3 nDirWS: TEXCOORD1;
                float3 tDirWS: TEXCOORD2;
                float3 bDirWS: TEXCOORD3;
                float2 uv: TEXCOORD4;
            };
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                o.uv = v.uv0;
                
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                //准备向量，遇到不会的可以去sf找答案
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float3 nDirTS = UnpackNormal(tex2D(_NormalMap, i.uv));
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                //准备中间数据，如点积结果
                float3 nDirWS = normalize(mul(nDirTS, TBN));
                float lDotN = dot(lDir, nDirWS);
                
                float lambert = max(0.0, lDotN);
                //后处理
                
                //返回结果
                return fixed4(lambert, lambert, lambert, 1.0);
            }
            ENDCG
            
        }
    }
    Fallback "Diffuse"
}
