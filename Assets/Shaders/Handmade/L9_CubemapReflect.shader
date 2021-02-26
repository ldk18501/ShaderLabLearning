Shader "LDKCustom/L9_CubeMapReflect"
{
    Properties
    {
        _NormalMap ("法线贴图", 2D) = "bump" { }
        _CubeMap ("CubeMap采样图", Cube) = "white" { }
        // 最大值需要和图片的mipmap层数对应
        _MipIntensity ("CubeMapMip强度", range(0.0, 7.0)) = 1.0
        _FresnelPow ("菲涅尔次幂", range(0.0, 10.0)) = 1.0
        _ReflectIntensity ("反射强度", range(1.0, 2.0)) = 1.0
        _AOTex ("AO图", 2D) = "white" { }
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
            uniform samplerCUBE _CubeMap;
            uniform float _MipIntensity;
            uniform float _FresnelPow;
            uniform float _ReflectIntensity;
            uniform sampler2D _AOTex;
            
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
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                
                float3 vRDirWS = reflect(vDirWS * - 1.0, nDirWS);
                
                
                
                //准备中间数据，如点积结果
                float3 cubeMap = texCUBElod(_CubeMap, float4(vRDirWS.xyz, _MipIntensity));
                float fresnel = pow(1 - dot(vDirWS, nDirWS), _FresnelPow);
                float ambient = tex2D(_AOTex, i.uv);
                //后处理
                
                //返回结果
                float3 finalCol = cubeMap * fresnel * ambient * _ReflectIntensity;
                return fixed4(finalCol, 1.0);
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
