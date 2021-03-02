// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34607,y:33068,varname:node_3138,prsc:2|emission-284-OUT;n:type:ShaderForge.SFN_LightVector,id:4588,x:32197,y:32344,varname:node_4588,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9495,x:32197,y:32499,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:3852,x:32435,y:32388,varname:node_3852,prsc:2,dt:0|A-4588-OUT,B-9495-OUT;n:type:ShaderForge.SFN_Clamp01,id:8576,x:32726,y:32687,varname:node_8576,prsc:2|IN-7901-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:6438,x:32197,y:32976,varname:node_6438,prsc:2;n:type:ShaderForge.SFN_Dot,id:1656,x:32465,y:32946,varname:node_1656,prsc:2,dt:0|A-4588-OUT,B-6438-OUT;n:type:ShaderForge.SFN_Clamp01,id:1801,x:32629,y:32946,varname:node_1801,prsc:2|IN-1656-OUT;n:type:ShaderForge.SFN_Power,id:7940,x:33074,y:32901,varname:node_7940,prsc:2|VAL-8513-OUT,EXP-363-OUT;n:type:ShaderForge.SFN_Slider,id:363,x:32726,y:32864,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_363,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:10,max:100;n:type:ShaderForge.SFN_Add,id:536,x:33312,y:32801,varname:node_536,prsc:2|A-5795-OUT,B-7940-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:2050,x:34120,y:32478,varname:node_2050,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7016,x:34353,y:32705,varname:node_7016,prsc:2|A-9790-OUT,B-2050-OUT;n:type:ShaderForge.SFN_Multiply,id:8513,x:32834,y:32946,varname:node_8513,prsc:2|A-1801-OUT,B-5090-RGB;n:type:ShaderForge.SFN_Color,id:5090,x:32637,y:33124,ptovrint:False,ptlb:SpecCol,ptin:_SpecCol,varname:node_5090,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ComponentMask,id:2530,x:32403,y:33482,varname:node_2530,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-9495-OUT;n:type:ShaderForge.SFN_Vector1,id:7000,x:32403,y:33675,varname:node_7000,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:138,x:32792,y:33482,varname:node_138,prsc:2|A-2530-OUT,B-7000-OUT;n:type:ShaderForge.SFN_Multiply,id:7855,x:32616,y:33796,varname:node_7855,prsc:2|A-2530-OUT,B-1065-OUT;n:type:ShaderForge.SFN_Vector1,id:1065,x:32403,y:33755,varname:node_1065,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:6737,x:32792,y:33662,varname:node_6737,prsc:2|A-7000-OUT,B-7855-OUT;n:type:ShaderForge.SFN_Add,id:8257,x:33074,y:33606,varname:node_8257,prsc:2|A-138-OUT,B-6737-OUT;n:type:ShaderForge.SFN_Multiply,id:3049,x:33070,y:33939,varname:node_3049,prsc:2|A-138-OUT,B-8775-RGB;n:type:ShaderForge.SFN_Color,id:8775,x:32616,y:34032,ptovrint:False,ptlb:EnvTopCol,ptin:_EnvTopCol,varname:node_8775,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:1555,x:32616,y:34226,ptovrint:False,ptlb:EnvMiddleCol,ptin:_EnvMiddleCol,varname:_EnvTopCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:6104,x:32616,y:34417,ptovrint:False,ptlb:EnvBottomCol,ptin:_EnvBottomCol,varname:_EnvMiddleCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3682,x:33070,y:34144,varname:node_3682,prsc:2|A-3187-OUT,B-1555-RGB;n:type:ShaderForge.SFN_Multiply,id:509,x:33070,y:34331,varname:node_509,prsc:2|A-6737-OUT,B-6104-RGB;n:type:ShaderForge.SFN_Vector1,id:6383,x:32403,y:33830,varname:node_6383,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:3187,x:33272,y:33606,varname:node_3187,prsc:2|A-6383-OUT,B-8257-OUT;n:type:ShaderForge.SFN_Add,id:7460,x:33613,y:33867,varname:node_7460,prsc:2|A-3049-OUT,B-3682-OUT,C-509-OUT;n:type:ShaderForge.SFN_Tex2d,id:3143,x:33553,y:33515,ptovrint:False,ptlb:AOTex,ptin:_AOTex,varname:node_3143,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8144,x:33778,y:33593,varname:node_8144,prsc:2|A-3143-RGB,B-1427-OUT;n:type:ShaderForge.SFN_Add,id:284,x:34316,y:33153,varname:node_284,prsc:2|A-7016-OUT,B-8144-OUT;n:type:ShaderForge.SFN_Multiply,id:1427,x:33937,y:33817,varname:node_1427,prsc:2|A-7460-OUT,B-8298-OUT;n:type:ShaderForge.SFN_Slider,id:8298,x:33534,y:34060,ptovrint:False,ptlb:EnvRatio,ptin:_EnvRatio,varname:node_8298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:9790,x:33729,y:32291,varname:node_9790,prsc:2|A-7976-RGB,B-5160-OUT;n:type:ShaderForge.SFN_Color,id:671,x:32852,y:32542,ptovrint:False,ptlb:MaskCol,ptin:_MaskCol,varname:node_671,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:5160,x:33727,y:33198,varname:node_5160,prsc:2|A-7110-RGB,B-536-OUT,T-7083-OUT;n:type:ShaderForge.SFN_Tex2d,id:7943,x:33066,y:33254,ptovrint:False,ptlb:SpecMask,ptin:_SpecMask,varname:node_7943,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:7083,x:33414,y:33254,varname:node_7083,prsc:2|A-7943-RGB,B-1797-OUT;n:type:ShaderForge.SFN_Slider,id:1797,x:33173,y:33424,ptovrint:False,ptlb:MaskRatio,ptin:_MaskRatio,varname:node_1797,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.54,max:1;n:type:ShaderForge.SFN_Tex2d,id:7110,x:33074,y:32357,ptovrint:False,ptlb:RampTex,ptin:_RampTex,varname:node_7110,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6ee10a7a508155547b184dd72e091fd5,ntxv:0,isnm:False|UVIN-3240-OUT;n:type:ShaderForge.SFN_Append,id:3240,x:32866,y:32388,varname:node_3240,prsc:2|A-1782-OUT,B-511-OUT;n:type:ShaderForge.SFN_Vector1,id:511,x:32642,y:32294,varname:node_511,prsc:2,v1:0.54;n:type:ShaderForge.SFN_LightColor,id:7976,x:33456,y:32138,varname:node_7976,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:1782,x:32642,y:32388,varname:node_1782,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-3852-OUT;n:type:ShaderForge.SFN_Multiply,id:5795,x:33110,y:32668,varname:node_5795,prsc:2|A-671-RGB,B-375-OUT;n:type:ShaderForge.SFN_ScreenPos,id:3774,x:31316,y:33230,varname:node_3774,prsc:2,sctp:0;n:type:ShaderForge.SFN_Depth,id:3913,x:31316,y:33410,varname:node_3913,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5324,x:31512,y:33343,varname:node_5324,prsc:2|A-3774-UVOUT,B-3913-OUT;n:type:ShaderForge.SFN_Tex2d,id:3680,x:31774,y:33343,ptovrint:False,ptlb:SampleTex,ptin:_SampleTex,varname:node_3680,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9edd52b1652527542b79a97935fdbd68,ntxv:0,isnm:False|UVIN-5324-OUT;n:type:ShaderForge.SFN_Step,id:7901,x:32540,y:32687,varname:node_7901,prsc:2|A-3680-RGB,B-3852-OUT;n:type:ShaderForge.SFN_Lerp,id:375,x:32924,y:32687,varname:node_375,prsc:2|A-9686-RGB,B-6979-RGB,T-8576-OUT;n:type:ShaderForge.SFN_Color,id:9686,x:31801,y:32717,ptovrint:False,ptlb:SampleCol1,ptin:_SampleCol1,varname:node_9686,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:6979,x:31993,y:32717,ptovrint:False,ptlb:SampleCol2,ptin:_SampleCol2,varname:_SampleCol2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:671-5090-363-8298-8775-1555-6104-3143-7943-1797-7110-3680-9686-6979;pass:END;sub:END;*/

Shader "Shader Forge/L8_SF_StylizedLit" {
    Properties {
        _MaskCol ("MaskCol", Color) = (0.5,0.5,0.5,1)
        _SpecCol ("SpecCol", Color) = (0.5,0.5,0.5,1)
        _SpecPow ("SpecPow", Range(1, 100)) = 10
        _EnvRatio ("EnvRatio", Range(0, 1)) = 0
        _EnvTopCol ("EnvTopCol", Color) = (0.5,0.5,0.5,1)
        _EnvMiddleCol ("EnvMiddleCol", Color) = (0.5,0.5,0.5,1)
        _EnvBottomCol ("EnvBottomCol", Color) = (0.5,0.5,0.5,1)
        _AOTex ("AOTex", 2D) = "white" {}
        _SpecMask ("SpecMask", 2D) = "white" {}
        _MaskRatio ("MaskRatio", Range(0, 1)) = 0.54
        _RampTex ("RampTex", 2D) = "white" {}
        _SampleTex ("SampleTex", 2D) = "white" {}
        _SampleCol1 ("SampleCol1", Color) = (0.5,0.5,0.5,1)
        _SampleCol2 ("SampleCol2", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _AOTex; uniform float4 _AOTex_ST;
            uniform sampler2D _SpecMask; uniform float4 _SpecMask_ST;
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            uniform sampler2D _SampleTex; uniform float4 _SampleTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpecCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvTopCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvMiddleCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvBottomCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRatio)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MaskCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskRatio)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SampleCol1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SampleCol2)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 projPos : TEXCOORD3;
                LIGHTING_COORDS(4,5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float node_3852 = dot(lightDirection,i.normalDir);
                float2 node_3240 = float2((node_3852*0.5+0.5),0.54);
                float4 _RampTex_var = tex2D(_RampTex,TRANSFORM_TEX(node_3240, _RampTex));
                float4 _MaskCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MaskCol );
                float4 _SampleCol1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SampleCol1 );
                float4 _SampleCol2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SampleCol2 );
                float2 node_5324 = ((sceneUVs * 2 - 1).rg*partZ);
                float4 _SampleTex_var = tex2D(_SampleTex,TRANSFORM_TEX(node_5324, _SampleTex));
                float4 _SpecCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecCol );
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _SpecMask_var = tex2D(_SpecMask,TRANSFORM_TEX(i.uv0, _SpecMask));
                float _MaskRatio_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MaskRatio );
                float4 _AOTex_var = tex2D(_AOTex,TRANSFORM_TEX(i.uv0, _AOTex));
                float node_2530 = i.normalDir.g;
                float node_7000 = 0.0;
                float node_138 = max(node_2530,node_7000);
                float4 _EnvTopCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvTopCol );
                float node_6737 = max(node_7000,(node_2530*(-1.0)));
                float4 _EnvMiddleCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvMiddleCol );
                float4 _EnvBottomCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvBottomCol );
                float _EnvRatio_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvRatio );
                float3 emissive = (((_LightColor0.rgb*lerp(_RampTex_var.rgb,((_MaskCol_var.rgb*lerp(_SampleCol1_var.rgb,_SampleCol2_var.rgb,saturate(step(_SampleTex_var.rgb,node_3852))))+pow((saturate(dot(lightDirection,viewReflectDirection))*_SpecCol_var.rgb),_SpecPow_var)),step(_SpecMask_var.rgb,_MaskRatio_var)))*attenuation)+(_AOTex_var.rgb*(((node_138*_EnvTopCol_var.rgb)+((1.0-(node_138+node_6737))*_EnvMiddleCol_var.rgb)+(node_6737*_EnvBottomCol_var.rgb))*_EnvRatio_var)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _AOTex; uniform float4 _AOTex_ST;
            uniform sampler2D _SpecMask; uniform float4 _SpecMask_ST;
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            uniform sampler2D _SampleTex; uniform float4 _SampleTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpecCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvTopCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvMiddleCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvBottomCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRatio)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MaskCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskRatio)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SampleCol1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SampleCol2)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 projPos : TEXCOORD3;
                LIGHTING_COORDS(4,5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
