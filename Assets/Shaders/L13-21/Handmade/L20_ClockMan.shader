﻿Shader "LDKCustom/L20_ClockMan"
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
        
        [Header(Clock)]
        _HourRotRange ("时针角度", Range(0, 360)) = 0
        _MinRotRange ("分针角度", Range(0, 360)) = 0
        _SecRotRange ("秒针角度", Range(0, 360)) = 0
        _RotOffset ("旋转偏移", Range(-10, 10)) = 0
        
        [Header(Toggle)]//开关
        [ToggleOff] _EnvLitTog ("环境光开关", Int) = 1
        [ToggleOff] _SpecTog ("光反射开关", Int) = 1
        [ToggleOff] _EnvReflectTog ("环境反射开关", Int) = 1
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
            #include "../../Cginc/LDKCginc.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            
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
            //Clock
            uniform float _HourRotRange;
            uniform float _MinRotRange;
            uniform float _SecRotRange;
            uniform float _RotOffset;
            
            struct VertexInput
            {
                float4 vertex: POSITION;
                float4 normal: NORMAL;
                float4 tangent: TANGENT;
                float2 uv0: TEXCOORD0;
                float4 color: COLOR;
            };
            struct VertexOutput
            {
                float4 pos: SV_POSITION;
                float4 posWS: TEXCOORD0;
                float3 nDirWS: TEXCOORD1;
                float3 tDirWS: TEXCOORD2;
                float3 bDirWS: TEXCOORD3;
                float2 uv: TEXCOORD4;
                float4 color: COLOR;
                LIGHTING_COORDS(5, 6)
            };
            
            void ClockAnim(inout float3 vertex, inout float3 color, float angle, float offset, float mask)
            {
                vertex.y -= offset;
                float rad = radians(angle * mask);
                float sinVal = sin(rad);
                float cosVal = cos(rad);
                
                vertex.xy = float2(vertex.x * cosVal - vertex.y * sinVal, vertex.x * sinVal + vertex.y * cosVal);
                vertex.y += offset;
            }
            
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                ClockAnim(v.vertex.xyz, v.color.rgb, _HourRotRange, _RotOffset, v.color.r);
                ClockAnim(v.vertex.xyz, v.color.rgb, _MinRotRange, _RotOffset, v.color.g);
                ClockAnim(v.vertex.xyz, v.color.rgb, _SecRotRange, _RotOffset, v.color.b);
                
                o.pos = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.tDirWS = mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0));
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                o.uv = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;
                o.color = v.color;
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
                //采样
                float4 var_MainTex = tex2D(_MainTex, i.uv);
                float4 var_SpecTex = tex2D(_SpecTex, i.uv);
                float4 var_EmitTex = tex2D(_EmitTex, i.uv);
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
                float3 emission = _EmitIntensity * var_EmitTex.rgb;
                
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
                return fixed4(finalCol, 1.0);
            }
            ENDCG
            
        }
    }
    FallBack "Diffuse"
}
