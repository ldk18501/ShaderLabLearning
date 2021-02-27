Shader "LDKCustom/L10_OldSchoolPro1"
{
    Properties
    {
        _MainTex ("贴图", 2D) = "white" { }
        _BaseCol ("基础色", Color) = (1.0, 1.0, 1.0, 1.0)
        _NormalMap ("法线贴图", 2D) = "bump" { }
        
        [ToggleOff] _SpecTog ("高光开关", Int) = 1
        _SpecCol ("高光颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        _SpecPow ("高光次幂", Range(1, 100)) = 10
        
        [ToggleOff] _EnvLitTog ("环境光开关", Int) = 1
        _EnvRatio ("环境光强度", Range(0, 1)) = 0
        _AOTex ("环境光贴图", 2D) = "white" { }
        _EnvTopCol ("顶部颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        _EnvMiddleCol ("中部颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        _EnvBottomCol ("底部颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        
        [ToggleOff] _EnvReflectTog ("环境反射开关", Int) = 1
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            
            #pragma shader_feature _SPECTOG_OFF
            #pragma shader_feature _ENVLITTOG_OFF
            #pragma shader_feature _ENVREFLECTTOG_OFF
            
            uniform sampler2D _MainTex;
            uniform float3 _BaseCol;
            uniform float3 _SpecCol;
            uniform float _SpecPow;
            
            uniform float _EnvRatio;
            uniform sampler2D _AOTex;
            uniform float3 _EnvTopCol;
            uniform float3 _EnvMiddleCol;
            uniform float3 _EnvBottomCol;
            
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
                LIGHTING_COORDS(5, 6)
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
                
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                //准备向量，遇到不会的可以去sf找答案
                float3 nDirTS = UnpackNormal(tex2D(_NormalMap, i.uv));
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS.rgb, TBN));
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float3 vRDirWS = reflect(vDirWS * - 1.0, nDirWS);
                float4 nDirVS = mul(UNITY_MATRIX_V, float4(nDirWS, 0.0));
                
                //准备中间数据，如点积结果
                float lDotN = dot(lDir, nDirWS);
                float vrDotL = dot(lDir, vRDirWS);
                float fresnel = pow(1 - dot(vDirWS, nDirWS), _FresnelPow);
                float ao = tex2D(_AOTex, i.uv);
                float3 emissive = tex2D(_MainTex, i.uv);
                float2 matcapUV = nDirVS.rg * 0.5 + 0.5;
                float3 matcap = tex2D(_MatCap, matcapUV);
                
                float top = max(0.0, nDirWS.g);
                float bottom = max(0.0, -nDirWS.g);
                float middle = 1.0 - top - bottom;
                //后处理
                
                //返回结果
                float3 lambert = lDotN * _LightColor0.rgb;
                float3 phong = pow(max(0.0, vrDotL), _SpecPow) * _SpecCol;
                float shadow = LIGHT_ATTENUATION(i);
                float3 envDiffuse = _BaseCol * (_EnvTopCol * top + _EnvMiddleCol * middle + _EnvBottomCol * bottom) * ao * _EnvRatio;
                float3 envReflect = matcap * fresnel * ao * _ReflectIntensity;
                float3 finalCol = emissive.rgb * _BaseCol * shadow * lambert;
                
                #if !defined(_SPECTOG_OFF)
                    finalCol += phong;
                #endif
                
                #if !defined(_ENVLITTOG_OFF)
                    finalCol += envDiffuse;
                #endif
                
                #if !defined(_ENVREFLECTTOG_OFF)
                    finalCol += envReflect;
                #endif
                
                return fixed4(finalCol, 1.0);
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
