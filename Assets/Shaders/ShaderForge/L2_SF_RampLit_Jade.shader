// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33243,y:33088,varname:node_3138,prsc:2|emission-7523-OUT,olwid-1629-OUT,olcol-8524-RGB;n:type:ShaderForge.SFN_Dot,id:1581,x:32277,y:32132,varname:node_1581,prsc:2,dt:0|A-3566-OUT,B-7041-OUT;n:type:ShaderForge.SFN_NormalVector,id:7041,x:32081,y:32165,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:3566,x:32081,y:32003,varname:node_3566,prsc:2;n:type:ShaderForge.SFN_Append,id:3795,x:32794,y:32314,cmnt:R通道接收的是半兰伯特0-1的值,varname:node_3795,prsc:2|A-4412-OUT,B-4187-OUT;n:type:ShaderForge.SFN_Tex2d,id:1469,x:33068,y:32314,ptovrint:False,ptlb:RampTex,ptin:_RampTex,cmnt:由Append而来的二维向量构成UV,varname:node_1469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6ee10a7a508155547b184dd72e091fd5,ntxv:2,isnm:False|UVIN-3795-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1629,x:32915,y:33536,ptovrint:False,ptlb:OutlineWidth,ptin:_OutlineWidth,varname:node_1629,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.015;n:type:ShaderForge.SFN_Color,id:8524,x:32915,y:33631,ptovrint:False,ptlb:OutlineCol,ptin:_OutlineCol,varname:node_8524,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.08490568,c2:0.07809721,c3:0.07809721,c4:1;n:type:ShaderForge.SFN_Multiply,id:8704,x:32460,y:32142,varname:node_8704,prsc:2|A-7678-OUT,B-1581-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7678,x:32364,y:32065,ptovrint:False,ptlb:val_mul,ptin:_val_mul,varname:node_7678,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_ValueProperty,id:7940,x:32537,y:32065,ptovrint:False,ptlb:val_add,ptin:_val_add,varname:node_7940,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Add,id:9365,x:32626,y:32142,varname:node_9365,prsc:2|A-7940-OUT,B-8704-OUT;n:type:ShaderForge.SFN_NormalVector,id:2789,x:31857,y:33004,prsc:2,pt:False;n:type:ShaderForge.SFN_Vector4Property,id:1160,x:31857,y:32639,ptovrint:False,ptlb:HighLightOffset1,ptin:_HighLightOffset1,cmnt:高光偏移1,varname:node_1160,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Add,id:9197,x:32074,y:32639,varname:node_9197,prsc:2|A-1160-XYZ,B-9927-OUT;n:type:ShaderForge.SFN_LightVector,id:9927,x:31857,y:32821,varname:node_9927,prsc:2;n:type:ShaderForge.SFN_Dot,id:8245,x:32509,y:32639,varname:node_8245,prsc:2,dt:0|A-5686-OUT,B-2789-OUT;n:type:ShaderForge.SFN_Normalize,id:5686,x:32275,y:32639,varname:node_5686,prsc:2|IN-9197-OUT;n:type:ShaderForge.SFN_Slider,id:2649,x:32412,y:32867,ptovrint:False,ptlb:HighLightRange1,ptin:_HighLightRange1,varname:node_2649,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9,max:1;n:type:ShaderForge.SFN_Fresnel,id:3209,x:32742,y:33037,cmnt:根据切线角度算边缘发光,varname:node_3209,prsc:2|EXP-2437-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2437,x:32558,y:33058,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:node_2437,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Color,id:9405,x:32624,y:33236,ptovrint:False,ptlb:FresnelCol,ptin:_FresnelCol,varname:node_9405,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7695341,c2:1,c3:0.495283,c4:1;n:type:ShaderForge.SFN_Multiply,id:8804,x:32956,y:33037,varname:node_8804,prsc:2|A-3209-OUT,B-9405-RGB;n:type:ShaderForge.SFN_Lerp,id:8132,x:33238,y:32598,varname:node_8132,prsc:2|A-1469-RGB,B-5516-RGB,T-1352-OUT;n:type:ShaderForge.SFN_Color,id:5516,x:32997,y:32522,ptovrint:False,ptlb:HighLightCol,ptin:_HighLightCol,varname:node_5516,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9524183,c2:0.9528302,c3:0.7775454,c4:1;n:type:ShaderForge.SFN_Blend,id:7523,x:33189,y:32848,varname:node_7523,prsc:2,blmd:6,clmp:True|SRC-8132-OUT,DST-8804-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:9871,x:32741,y:31991,varname:node_9871,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4412,x:32794,y:32142,cmnt:算上投影,varname:node_4412,prsc:2|A-9871-OUT,B-9365-OUT;n:type:ShaderForge.SFN_Vector1,id:4187,x:32572,y:32348,varname:node_4187,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Step,id:1352,x:32777,y:32642,varname:node_1352,prsc:2|A-2649-OUT,B-8245-OUT;proporder:1469-1629-8524-7678-7940-1160-2649-2437-9405-5516;pass:END;sub:END;*/

Shader "Shader Forge/L2_SF_RampLit_Jade" {
    Properties {
        _RampTex ("RampTex", 2D) = "black" {}
        _OutlineWidth ("OutlineWidth", Float ) = 0.015
        _OutlineCol ("OutlineCol", Color) = (0.08490568,0.07809721,0.07809721,1)
        _val_mul ("val_mul", Float ) = 0.5
        _val_add ("val_add", Float ) = 0.5
        _HighLightOffset1 ("HighLightOffset1", Vector) = (0,0,0,0)
        _HighLightRange1 ("HighLightRange1", Range(0, 1)) = 0.9
        _Fresnel ("Fresnel", Float ) = 3
        _FresnelCol ("FresnelCol", Color) = (0.7695341,1,0.495283,1)
        _HighLightCol ("HighLightCol", Color) = (0.9524183,0.9528302,0.7775454,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _OutlineWidth)
                UNITY_DEFINE_INSTANCED_PROP( float4, _OutlineCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                float _OutlineWidth_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OutlineWidth );
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_OutlineWidth_var,1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 _OutlineCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OutlineCol );
                return fixed4(_OutlineCol_var.rgb,0);
            }
            ENDCG
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
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _val_mul)
                UNITY_DEFINE_INSTANCED_PROP( float, _val_add)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighLightOffset1)
                UNITY_DEFINE_INSTANCED_PROP( float, _HighLightRange1)
                UNITY_DEFINE_INSTANCED_PROP( float, _Fresnel)
                UNITY_DEFINE_INSTANCED_PROP( float4, _FresnelCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighLightCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float _val_add_var = UNITY_ACCESS_INSTANCED_PROP( Props, _val_add );
                float _val_mul_var = UNITY_ACCESS_INSTANCED_PROP( Props, _val_mul );
                float2 node_3795 = float2((attenuation*(_val_add_var+(_val_mul_var*dot(lightDirection,i.normalDir)))),0.5); // R通道接收的是半兰伯特0-1的值
                float4 _RampTex_var = tex2D(_RampTex,TRANSFORM_TEX(node_3795, _RampTex)); // 由Append而来的二维向量构成UV
                float4 _HighLightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighLightCol );
                float _HighLightRange1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighLightRange1 );
                float4 _HighLightOffset1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighLightOffset1 ); // 高光偏移1
                float _Fresnel_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Fresnel );
                float4 _FresnelCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelCol );
                float3 emissive = saturate((1.0-(1.0-lerp(_RampTex_var.rgb,_HighLightCol_var.rgb,step(_HighLightRange1_var,dot(normalize((_HighLightOffset1_var.rgb+lightDirection)),i.normalDir))))*(1.0-(pow(1.0-max(0,dot(normalDirection, viewDirection)),_Fresnel_var)*_FresnelCol_var.rgb))));
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
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _val_mul)
                UNITY_DEFINE_INSTANCED_PROP( float, _val_add)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighLightOffset1)
                UNITY_DEFINE_INSTANCED_PROP( float, _HighLightRange1)
                UNITY_DEFINE_INSTANCED_PROP( float, _Fresnel)
                UNITY_DEFINE_INSTANCED_PROP( float4, _FresnelCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighLightCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
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
