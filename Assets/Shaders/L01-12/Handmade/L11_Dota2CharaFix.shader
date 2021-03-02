Shader "LDKCustom/L11_Dota2CharaFix"
{
    Properties
    {
        [Header(Texture)]//贴图
        _MainTex ("RGB:基础颜色", 2D) = "white" { }
        _TintTex ("RGB:颜色遮罩", 2D) = "white" { }
        _NormalMap ("RGB:法线贴图", 2D) = "bump" { }
        _DiffRampTex ("RGB:漫反射映射", 2D) = "black" { }
        _MetalTex ("RGB:金属遮罩", 2D) = "gray" { }
        _SpecTex ("RGB:高光遮罩", 2D) = "gray" { }
        _SpecPowTex ("RGB:高光次幂", 2D) = "gray" { }
        _RimTex ("RGB:边缘高光遮罩", 2D) = "black" { }
        _FresnelColTex ("RGB:菲涅尔颜色", 2D) = "black" { }
        _FresnelRimTex ("RGB:菲涅尔边缘", 2D) = "black" { }
        _FresnelSpecTex ("RGB:菲涅尔高光", 2D) = "black" { }
        _CubeMap ("RGB:CubeMap采样图", Cube) = "_Skybox" { }
        _EmitTex ("RGB:自发光遮罩", 2D) = "black" { }
        _AlphaTex ("RGBA:透明通道", 2D) = "white" { }
        
        [Header(Diffuse)]//漫反射
        _BaseCol ("基础色", Color) = (1, 1, 1, 1)
        _EnvRatio ("环境光强度", Range(0, 1)) = 0
        _EnvTopCol ("顶部颜色", Color) = (0, 0, 0, 0)
        _EnvMiddleCol ("中部颜色", Color) = (0, 0, 0, 0)
        _EnvBottomCol ("底部颜色", Color) = (0, 0, 0, 0)
        
        [Header(Specular)]//反射光
        _SpecExpVal ("高光经验值", Range(0, 1)) = 0.3
        _SpecPow ("高光次幂", Range(1, 100)) = 20
        _MipIntensity ("环境反射Mip强度", Range(0, 7)) = 0
        _ReflectIntensity ("反射强度", Range(1, 10)) = 1
        
        [Header(Rim)]//轮廓光
        [HDR] _RimCol ("轮廓光照", Color) = (1, 1, 1, 1)
        
        [Header(Emission)]//自发光
        [HDR] _EmitCol ("自发光颜色", Color) = (0, 0, 0, 1)
        
        [Header(Toggle)]//开关
        [ToggleOff] _SpecTog ("高光开关", Int) = 1
        [ToggleOff] _EnvDiffTog ("环境光开关", Int) = 1
        [ToggleOff] _EnvReflectTog ("环境反射开关", Int) = 1
        
        [HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        Pass
        {
            Name "FORWARD"
            Tags { "LightMode" = "ForwardBase" }
            Cull Off
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "../Cginc/LDKCginc.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            
            //Toggles
            #pragma shader_feature _SPECTOG_OFF
            #pragma shader_feature _ENVDIFFTOG_OFF
            #pragma shader_feature _ENVREFLECTTOG_OFF
            
            //Texture
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _TintTex;
            uniform sampler2D _NormalMap;
            uniform sampler2D _DiffRampTex;
            uniform sampler2D _MetalTex;
            uniform sampler2D _SpecTex;
            uniform sampler2D _SpecPowTex;
            uniform sampler2D _RimTex;
            uniform sampler2D _FresnelColTex;
            uniform sampler2D _FresnelSpecTex;
            uniform sampler2D _FresnelRimTex;
            uniform samplerCUBE _CubeMap;
            uniform sampler2D _EmitTex;
            uniform sampler2D _AlphaTex;
            //Diffuse
            uniform float3 _BaseCol;
            uniform float _EnvRatio;
            uniform float3 _EnvTopCol;
            uniform float3 _EnvMiddleCol;
            uniform float3 _EnvBottomCol;
            //Specular
            uniform float _SpecExpVal;
            uniform float _SpecPow;
            uniform float _MipIntensity;
            uniform float _ReflectIntensity;
            //Rim
            uniform float3 _RimCol;
            //Emission
            uniform float3 _EmitCol;
            
            //AlphaCutout
            uniform float _Cutoff;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float4 normal: NORMAL;
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
                o.uv = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i): COLOR
            {
                //准备向量
                float3 nDirTS = UnpackNormal(tex2D(_NormalMap, i.uv));
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS.rgb, TBN));
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float3 vRDirWS = reflect(vDirWS * - 1.0, nDirWS);
                //向量点积
                float lDotN = dot(lDir, nDirWS);
                float vRDotL = dot(lDir, vRDirWS);
                float vDotN = dot(vDirWS, nDirWS);
                
                //采样，采样是很费的操作，正式项目应该合并不需要的通道，减少采样次数
                float3 var_MainTex = tex2D(_MainTex, i.uv);
                float3 var_TintTex = tex2D(_TintTex, i.uv);
                float4 var_DiffRampTex = tex2D(_DiffRampTex, float2(saturate(lDotN * 0.5 + 0.5), 0.1));
                float3 var_MetalTex = tex2D(_MetalTex, i.uv);
                float3 var_SpecTex = tex2D(_SpecTex, i.uv);
                float3 var_SpecPowTex = tex2D(_SpecPowTex, i.uv);
                float3 var_RimTex = tex2D(_RimTex, i.uv);
                float3 var_EmitTex = tex2D(_EmitTex, i.uv);
                float3 var_FresnelColTex = tex2D(_FresnelColTex, float2(vDotN, 0));
                float3 var_FresnelSpecTex = tex2D(_FresnelSpecTex, float2(vDotN, 0));
                float3 var_FresnelRimTex = tex2D(_FresnelRimTex, float2(vDotN, 0));
                float3 var_AlphaTex = tex2D(_AlphaTex, i.uv);
                //lerp的含义：用高光贴图来判断一个像素是属于光滑部位还是粗糙部位，越光滑的值越趋近于1（白色），对应的mip值为0的反射越光滑（不mip），否则趋近于指定的强度
                float4 var_CubeMap = texCUBElod(_CubeMap, float4(vRDirWS, lerp(_MipIntensity, 0, var_SpecPowTex.r)));
                //计算光照模型
                //类pbr的写法，通过遮罩来区别金属度和表面粗糙程度
                //tintmask:处理镜面反射，metalmask:处理漫反射，主光源处理投影，环境光处理AO，diffuseCol可以理解为Diffuse贴图，specCol高光贴图
                //漫反射颜色：金属遮罩值越低，越趋近于物体原色，否则变暗处理
                float3 diffuseCol = lerp(var_MainTex.rgb, float3(0, 0, 0), var_MetalTex.r);
                //高光颜色图：由lerp（maintex.rgb, float3(经验值),tintmask)获得的一个色值，tint越黑的地方越趋近于原色，越白的地方越趋近于经验值，相当于让高光部分颜色更浓，再乘以高光遮罩贴图，将高光颜色保留，非高光部分趋近于黑色
                float3 specCol = lerp(var_MainTex.rgb, float3(_SpecExpVal, _SpecExpVal, _SpecExpVal), var_TintTex.r);
                //菲涅尔现象特性：非金属菲涅尔现象越明显，金属几乎没有菲涅尔现象
                float fresnelCol = lerp(var_FresnelColTex.r, 0, var_MetalTex.r);
                float fresnelSpec = lerp(var_FresnelSpecTex.r, 0, var_MetalTex.r);
                float fresnelRim = lerp(var_FresnelRimTex.r, 0, var_MetalTex.r);
                
                //lambert
                float3 lambert = var_DiffRampTex.a == 0 ? saturate(lDotN): var_DiffRampTex.rgb;
                float shadow = LIGHT_ATTENUATION(i);
                //phong
                //同理，高光也需要用lerp制造光滑和粗糙表面的差异性
                float specPow = lerp(1, _SpecPow, var_SpecPowTex.r);
                float3 phong = pow(saturate(vRDotL), specPow);
                
                //主光漫反射
                float3 finalCol = diffuseCol * _BaseCol * lambert;
                //主光镜面反射
                float3 spec = saturate(max(phong, fresnelSpec)) * specCol * _BaseCol;
                //环境光漫反射
                float3 envDiffuse = diffuseCol * _BaseCol * TriColAmbient(nDirWS, _EnvTopCol, _EnvMiddleCol, _EnvBottomCol) * _EnvRatio;
                //环境光镜面反射
                float3 cubemapReflect = var_CubeMap.rgb * max(fresnelSpec, var_MetalTex.r) * _ReflectIntensity * var_SpecTex.rgb;
                float3 envReflect = cubemapReflect * specCol;
                
                //轮廓光
                float3 rimCol = var_RimTex.rgb * fresnelRim * saturate(nDirWS.g) * _RimCol.rgb;
                //自发光
                float3 emission = _EmitCol * var_EmitTex.rgb * diffuseCol;
                
                
                #if !defined(_SPECTOG_OFF)
                    finalCol += spec;
                #endif
                //有高光也需要乘投影，否则会导致阴影部分高光突兀
                finalCol *= _LightColor0.rgb * shadow;
                
                #if !defined(_ENVLITTOG_OFF)
                    finalCol += envDiffuse;
                #endif
                
                #if !defined(_ENVREFLECTTOG_OFF)
                    finalCol += envReflect;
                    finalCol = saturate(max(rimCol, finalCol));
                #endif
                
                finalCol += emission;
                
                clip(var_AlphaTex.r - _Cutoff);
                return fixed4(finalCol, 1.0);
            }
            ENDCG
            
        }
        
        
        // Pass to render object as a shadow caster
        Pass
        {
            Name "Caster"
            Tags { "LightMode" = "ShadowCaster" }
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 2.0
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_instancing // allow instanced shadow pass for most of the shaders
            #include "UnityCG.cginc"
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float4 normal: NORMAL;
                float4 tangent: TANGENT;
                float2 uv0: TEXCOORD0;
            };
            
            struct VertexOutput
            {
                V2F_SHADOW_CASTER;
                float2 uv: TEXCOORD1;
                UNITY_VERTEX_OUTPUT_STEREO
            };
            
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
                o.uv = v.uv0;
                return o;
            }
            
            uniform fixed _Cutoff;
            uniform sampler2D _AlphaTex;
            
            float4 frag(VertexOutput i): SV_Target
            {
                fixed4 texcol = tex2D(_AlphaTex, i.uv);
                clip(texcol.r - _Cutoff);
                
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
