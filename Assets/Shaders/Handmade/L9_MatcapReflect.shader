Shader "LDKCustom/L9_MatcapReflect"
{
    Properties
    {
        _NormalMap ("法线贴图", 2D) = "bump" { }
        _MatCap ("MatCap采样图", 2D) = "white" { }
        _FresnelPow ("菲涅尔次幂", range(0.0, 10.0)) = 1.0
        _ReflectIntensity ("反射强度", range(1.0, 2.0)) = 1.0
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
            uniform sampler2D _MatCap;
            uniform float _FresnelPow;
            uniform float _ReflectIntensity;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float3 normal: NORMAL;
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
                o.tDirWS = mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0));
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                o.uv = v.uv0;
                
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                //准备向量，遇到不会的可以去sf找答案
                float3 nDirTS = UnpackNormal(tex2D(_NormalMap, i.uv));
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS.rgb, TBN));
                float4 nDirVS = mul(UNITY_MATRIX_V, float4(nDirWS.xyz, 0.0));
                
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                
                //准备中间数据，如点积结果
                float2 matcapUV = nDirVS.rg * 0.5 + 0.5;
                float3 matcap = tex2D(_MatCap, matcapUV);
                float fresnel = pow(1 - dot(vDirWS, nDirWS), _FresnelPow);
                //后处理
                
                //返回结果
                float3 finalCol = matcap * fresnel * _ReflectIntensity;
                return fixed4(finalCol, 1.0);
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
