Shader "LDKCustom/L21_Cyberpunk"
{
    Properties
    {
        [Header(Texture)]//贴图
        _MainTex ("RGB:基础颜色 A:环境遮罩", 2D) = "white" { }
        _NormalMap ("RGB:法线贴图", 2D) = "bump" { }
        _SpecTex ("RGB:高光颜色 A:高光次幂", 2D) = "gray" { }
        _EmitTex ("RGB:自发光遮罩", 2D) = "black" { }
        _CubeMap ("RGB:CubeMap采样图", Cube) = "_Skybox" { }
        
        [Header(Diffuse)]//漫反射
        _BaseCol ("基础色", Color) = (1, 1, 1, 1)
        _EnvRatio ("环境光强度", Range(0, 1)) = 0
        _EnvTopCol ("顶部颜色", Color) = (0, 0, 0, 0)
        _EnvMiddleCol ("中部颜色", Color) = (0, 0, 0, 0)
        _EnvBottomCol ("底部颜色", Color) = (0, 0, 0, 0)
        
        [Header(Specular)]//反射光
        _SpecPow ("高光次幂", Range(1, 100)) = 20
        _MipIntensity ("环境反射Mip强度", Range(0, 7)) = 0
        _FresnelPow ("菲涅尔次幂", Range(0, 10)) = 2
        _ReflectIntensity ("反射强度", Range(1, 2)) = 1
        
        [Header(Emission)]//自发光
        _EmitIntensity ("自发光强度", Range(1, 10)) = 1
        
        [Header(Cyberpunk)]//赛博朋克
        _CyberEffMap01 ("RGB:特效纹理1", 2D) = "gray" { }
        _CyberEffMap02 ("RGB:特效纹理2", 2D) = "gray" { }
        [HDR] _CyberEffCol ("特效颜色", Color) = (1, 1, 1, 1)
        _CyberWaveLen ("波长", Float) = 1
        _CyberWaveSpd ("波速", Float) = 1
        _CyberMixInten ("混乱度", Float) = 1
        _CyberDispInten ("消散强度", Float) = 1
        
        [Header(Toggle)]//开关
        [ToggleOff] _EnvLitTog ("环境光开关", Int) = 1
        [ToggleOff] _SpecTog ("光反射开关", Int) = 1
        [ToggleOff] _EnvReflectTog ("环境反射开关", Int) = 1
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType" = "Transparent" }
        Pass
        {
            Name "FORWARD"
            Tags { "LightMode" = "ForwardBase" }
            Blend One OneMinusSrcAlpha
            
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "../../Cginc/LDKCginc.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #define PI 3.1415926
            
            
            //Toggles
            #pragma shader_feature _SPECTOG_OFF
            #pragma shader_feature _ENVLITTOG_OFF
            #pragma shader_feature _ENVREFLECTTOG_OFF
            
            //Texture
            uniform sampler2D _MainTex;
            uniform float4 _MainTex_ST;
            uniform sampler2D _NormalMap;
            uniform sampler2D _SpecTex;
            uniform sampler2D _EmitTex;
            uniform samplerCUBE _CubeMap;
            //Diffuse
            uniform float3 _BaseCol;
            uniform float _EnvRatio;
            uniform float3 _EnvTopCol;
            uniform float3 _EnvMiddleCol;
            uniform float3 _EnvBottomCol;
            //Specular
            uniform float _SpecPow;
            uniform float _MipIntensity;
            uniform float _FresnelPow;
            uniform float _ReflectIntensity;
            //Emission
            uniform float _EmitIntensity;
            //Cyber
            uniform sampler2D _CyberEffMap01;
            uniform sampler2D _CyberEffMap02;
            uniform float4 _CyberEffCol;
            uniform float  _CyberWaveLen;
            uniform float _CyberWaveSpd;
            uniform float  _CyberMixInten;
            uniform float  _CyberDispInten;
            
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float4 normal: NORMAL;
                float4 tangent: TANGENT;
                float2 uv0: TEXCOORD0;
                float2 uv1: TEXCOORD1;
            };
            struct VertexOutput
            {
                float4 pos: SV_POSITION;
                float4 posWS: TEXCOORD0;
                float3 nDirWS: TEXCOORD1;
                float3 tDirWS: TEXCOORD2;
                float3 bDirWS: TEXCOORD3;
                float2 uv0: TEXCOORD4;
                float2 uv1: TEXCOORD5;
                float4 effMask: TEXCOORD6;
                LIGHTING_COORDS(7, 8)
            };
            
            
            float4 CyberAnim(inout float3 vertex, float noise, float mask, float3 normal)
            {
                //正弦波，也可以用abs(frac(vertex.y)- 0.5)*2得到一个线性的锯齿波
                float baseMask = sin(vertex.y * _CyberWaveLen + _Time.y * _CyberWaveSpd) * 0.5 + 0.5; //0~1
                baseMask = min(1.0, baseMask * 2); //0~1
                //用noise扰动波
                baseMask += (saturate(noise) - 0.5) * _CyberMixInten; // 0 - 0.5 * inten ~ 1 + 0.5 * inten
                //用smoothstep将
                float4 effMask = float4(baseMask, baseMask, baseMask, 1);
                effMask.x = smoothstep(0.0, 0.9, baseMask); //红通道渐变范围最大
                effMask.y = smoothstep(0.2, 0.7, baseMask); //绿通道渐变范围适中
                effMask.z = smoothstep(0.4, 0.5, baseMask); //蓝通道几乎无渐变
                vertex.xz += normal.xz * (1 - effMask.y) * _CyberDispInten;
                return effMask;
            }
            
            VertexOutput vert(VertexInput v)
            {
                float noise = tex2Dlod(_CyberEffMap02, float4(v.uv1, 0, 0)).r;
                VertexOutput o = (VertexOutput)0;
                o.effMask = CyberAnim(v.vertex.xyz, noise, 0, v.normal.xyz);
                o.pos = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.tDirWS = mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0));
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                o.uv1 = v.uv1 * _MainTex_ST.xy + _MainTex_ST.zw;
                
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                //准备向量
                float3 nDirTS = UnpackNormal(tex2D(_NormalMap, i.uv0));
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS.rgb, TBN));
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float3 vRDirWS = reflect(vDirWS * - 1.0, nDirWS);
                
                //向量点积
                float lDotN = dot(lDir, nDirWS);
                float vRDotL = dot(lDir, vRDirWS);
                float vDotN = dot(vDirWS, nDirWS);
                //采样
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float4 var_SpecTex = tex2D(_SpecTex, i.uv0);
                float4 var_EmitTex = tex2D(_EmitTex, i.uv0);
                //lerp的含义：用高光贴图来判断一个像素是属于光滑部位还是粗糙部位，越光滑的值越趋近于1（白色），对应的mip值为0的反射越光滑（不mip），否则趋近于指定的强度
                float4 var_CubeMap = texCUBElod(_CubeMap, float4(vRDirWS, lerp(_MipIntensity, 0, var_SpecTex.a)));
                //计算光照模型
                //光源漫反射
                float3 lambert = saturate(lDotN);
                float shadow = LIGHT_ATTENUATION(i);
                //光源镜面反射
                //同理，高光也需要用lerp制造光滑和粗糙表面的差异性
                float specPow = lerp(1, _SpecPow, var_SpecTex.a);
                float3 phong = pow(saturate(vRDotL), specPow);
                //环境漫反射
                float occlusion = var_MainTex.a;
                float3 envDiffuse = var_MainTex.rgb * _BaseCol * TriColAmbient(nDirWS, _EnvTopCol, _EnvMiddleCol, _EnvBottomCol) * occlusion * _EnvRatio;
                //环境镜面反射
                float fresnel = pow(1 - saturate(vDotN), _FresnelPow);
                float3 envReflect = var_CubeMap.rgb * fresnel * occlusion * _ReflectIntensity;
                //自发光
                float3 emission = (sin(frac(_Time.y) * 2 * PI) + 1) * _EmitIntensity * var_EmitTex.rgb;
                
                //特效部分
                float4 var_EffMap = tex2D(_CyberEffMap01, i.uv1);
                //模型分片遮罩
                float meshMask = var_EffMap.x;
                //随机飞散面片遮罩
                float faceRandomMask = var_EffMap.y;
                //柔和过渡明暗遮罩
                float faceSlopeMask = var_EffMap.z;
                
                //带来随机性
                float midOpacity = saturate(floor(min(faceRandomMask, 0.999) + i.effMask.y));
                //带来缩放鳞片效果
                float bigOpacity = saturate(floor(min(faceSlopeMask, 0.999) + i.effMask.z));
                float opacity = min(midOpacity, bigOpacity);
                
                float meshEmitInt = (i.effMask.z - i.effMask.x) * meshMask;
                meshEmitInt = meshEmitInt * meshEmitInt;
                emission += _CyberEffCol * meshEmitInt;
                
                //混合结果
                float3 finalCol = var_MainTex.rgb * _BaseCol * lambert;
                #if !defined(_SPECTOG_OFF)
                    finalCol += phong * var_SpecTex.rgb;
                #endif
                //有高光也需要乘投影，否则会导致阴影部分高光突兀
                finalCol *= _LightColor0.rgb * shadow;
                
                #if !defined(_ENVLITTOG_OFF)
                    finalCol += envDiffuse;
                #endif
                
                #if !defined(_ENVREFLECTTOG_OFF)
                    finalCol += envReflect;
                #endif
                
                finalCol += emission;
                
                return fixed4(finalCol * opacity, opacity);
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
