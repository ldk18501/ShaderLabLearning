// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34296,y:32850,varname:node_3138,prsc:2|emission-284-OUT;n:type:ShaderForge.SFN_LightVector,id:4588,x:32225,y:32489,varname:node_4588,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9495,x:32225,y:32644,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:3852,x:32463,y:32533,varname:node_3852,prsc:2,dt:0|A-4588-OUT,B-9495-OUT;n:type:ShaderForge.SFN_Clamp01,id:8576,x:32654,y:32533,varname:node_8576,prsc:2|IN-3852-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:6438,x:32225,y:32821,varname:node_6438,prsc:2;n:type:ShaderForge.SFN_Dot,id:1656,x:32493,y:32791,varname:node_1656,prsc:2,dt:0|A-4588-OUT,B-6438-OUT;n:type:ShaderForge.SFN_Clamp01,id:1801,x:32657,y:32791,varname:node_1801,prsc:2|IN-1656-OUT;n:type:ShaderForge.SFN_Power,id:7940,x:33102,y:32746,varname:node_7940,prsc:2|VAL-8513-OUT,EXP-363-OUT;n:type:ShaderForge.SFN_Slider,id:363,x:32754,y:32709,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_363,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:10,max:100;n:type:ShaderForge.SFN_Add,id:536,x:33414,y:32557,varname:node_536,prsc:2|A-9790-OUT,B-7940-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:2050,x:33060,y:32886,varname:node_2050,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7016,x:33385,y:32800,varname:node_7016,prsc:2|A-536-OUT,B-2050-OUT;n:type:ShaderForge.SFN_Multiply,id:8428,x:32860,y:32512,varname:node_8428,prsc:2|A-4237-RGB,B-8576-OUT;n:type:ShaderForge.SFN_Color,id:4237,x:32693,y:32366,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_4237,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:8513,x:32862,y:32791,varname:node_8513,prsc:2|A-1801-OUT,B-5090-RGB;n:type:ShaderForge.SFN_Color,id:5090,x:32678,y:33002,ptovrint:False,ptlb:SpecCol,ptin:_SpecCol,varname:node_5090,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ComponentMask,id:2530,x:32420,y:33240,varname:node_2530,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-9495-OUT;n:type:ShaderForge.SFN_Vector1,id:7000,x:32420,y:33433,varname:node_7000,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:138,x:32809,y:33240,varname:node_138,prsc:2|A-2530-OUT,B-7000-OUT;n:type:ShaderForge.SFN_Multiply,id:7855,x:32633,y:33554,varname:node_7855,prsc:2|A-2530-OUT,B-1065-OUT;n:type:ShaderForge.SFN_Vector1,id:1065,x:32420,y:33513,varname:node_1065,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:6737,x:32809,y:33420,varname:node_6737,prsc:2|A-7000-OUT,B-7855-OUT;n:type:ShaderForge.SFN_Add,id:8257,x:33091,y:33364,varname:node_8257,prsc:2|A-138-OUT,B-6737-OUT;n:type:ShaderForge.SFN_Multiply,id:3049,x:33087,y:33697,varname:node_3049,prsc:2|A-138-OUT,B-8775-RGB;n:type:ShaderForge.SFN_Color,id:8775,x:32633,y:33790,ptovrint:False,ptlb:EnvTopCol,ptin:_EnvTopCol,varname:node_8775,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:1555,x:32633,y:33984,ptovrint:False,ptlb:EnvMiddleCol,ptin:_EnvMiddleCol,varname:_EnvTopCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:6104,x:32633,y:34175,ptovrint:False,ptlb:EnvBottomCol,ptin:_EnvBottomCol,varname:_EnvMiddleCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3682,x:33087,y:33902,varname:node_3682,prsc:2|A-3187-OUT,B-1555-RGB;n:type:ShaderForge.SFN_Multiply,id:509,x:33087,y:34089,varname:node_509,prsc:2|A-6737-OUT,B-6104-RGB;n:type:ShaderForge.SFN_Vector1,id:6383,x:32420,y:33588,varname:node_6383,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:3187,x:33289,y:33364,varname:node_3187,prsc:2|A-6383-OUT,B-8257-OUT;n:type:ShaderForge.SFN_Add,id:7460,x:33630,y:33625,varname:node_7460,prsc:2|A-3049-OUT,B-3682-OUT,C-509-OUT;n:type:ShaderForge.SFN_Tex2d,id:3143,x:33570,y:33273,ptovrint:False,ptlb:AOTex,ptin:_AOTex,varname:node_3143,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8144,x:33795,y:33351,varname:node_8144,prsc:2|A-3143-RGB,B-1427-OUT;n:type:ShaderForge.SFN_Add,id:284,x:34027,y:33142,varname:node_284,prsc:2|A-7016-OUT,B-8144-OUT;n:type:ShaderForge.SFN_Multiply,id:1427,x:33954,y:33575,varname:node_1427,prsc:2|A-7460-OUT,B-8298-OUT;n:type:ShaderForge.SFN_Slider,id:8298,x:33551,y:33818,ptovrint:False,ptlb:EnvRatio,ptin:_EnvRatio,varname:node_8298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:9790,x:33202,y:32339,varname:node_9790,prsc:2|A-671-RGB,B-8428-OUT;n:type:ShaderForge.SFN_Color,id:671,x:32996,y:32236,ptovrint:False,ptlb:LightCol,ptin:_LightCol,varname:node_671,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:4237-671-5090-363-8298-8775-1555-6104-3143;pass:END;sub:END;*/

Shader "Shader Forge/L7_SF_LitSpecAOShadow" {
    Properties {
        _BaseCol ("BaseCol", Color) = (0.5,0.5,0.5,1)
        _LightCol ("LightCol", Color) = (0.5,0.5,0.5,1)
        _SpecCol ("SpecCol", Color) = (0.5,0.5,0.5,1)
        _SpecPow ("SpecPow", Range(1, 100)) = 10
        _EnvRatio ("EnvRatio", Range(0, 1)) = 0
        _EnvTopCol ("EnvTopCol", Color) = (0.5,0.5,0.5,1)
        _EnvMiddleCol ("EnvMiddleCol", Color) = (0.5,0.5,0.5,1)
        _EnvBottomCol ("EnvBottomCol", Color) = (0.5,0.5,0.5,1)
        _AOTex ("AOTex", 2D) = "white" {}
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpecCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvTopCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvMiddleCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvBottomCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRatio)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
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
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol );
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float4 _SpecCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecCol );
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _AOTex_var = tex2D(_AOTex,TRANSFORM_TEX(i.uv0, _AOTex));
                float node_2530 = i.normalDir.g;
                float node_7000 = 0.0;
                float node_138 = max(node_2530,node_7000);
                float4 _EnvTopCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvTopCol );
                float node_6737 = max(node_7000,(node_2530*(-1.0)));
                float4 _EnvMiddleCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvMiddleCol );
                float4 _EnvBottomCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvBottomCol );
                float _EnvRatio_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvRatio );
                float3 emissive = ((((_LightCol_var.rgb*(_BaseCol_var.rgb*saturate(dot(lightDirection,i.normalDir))))+pow((saturate(dot(lightDirection,viewReflectDirection))*_SpecCol_var.rgb),_SpecPow_var))*attenuation)+(_AOTex_var.rgb*(((node_138*_EnvTopCol_var.rgb)+((1.0-(node_138+node_6737))*_EnvMiddleCol_var.rgb)+(node_6737*_EnvBottomCol_var.rgb))*_EnvRatio_var)));
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpecCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvTopCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvMiddleCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvBottomCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRatio)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
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
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
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
