// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33213,y:32707,varname:node_3138,prsc:2|emission-9354-OUT;n:type:ShaderForge.SFN_NormalVector,id:7695,x:31831,y:33006,prsc:2,pt:False;n:type:ShaderForge.SFN_ViewReflectionVector,id:8635,x:31831,y:32649,varname:node_8635,prsc:2;n:type:ShaderForge.SFN_LightVector,id:600,x:31831,y:32787,varname:node_600,prsc:2;n:type:ShaderForge.SFN_Dot,id:2664,x:32026,y:32698,varname:node_2664,prsc:2,dt:0|A-8635-OUT,B-600-OUT;n:type:ShaderForge.SFN_Clamp01,id:3384,x:32197,y:32698,varname:node_3384,prsc:2|IN-2664-OUT;n:type:ShaderForge.SFN_Fresnel,id:7167,x:32642,y:33598,varname:node_7167,prsc:2|EXP-7656-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7656,x:32514,y:33764,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_7656,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Blend,id:9586,x:32975,y:32862,varname:node_9586,prsc:2,blmd:6,clmp:False|SRC-4749-OUT,DST-7167-OUT;n:type:ShaderForge.SFN_Slider,id:8831,x:32074,y:32599,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_8831,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:10,max:90;n:type:ShaderForge.SFN_Power,id:4873,x:32416,y:32698,varname:node_4873,prsc:2|VAL-3384-OUT,EXP-8831-OUT;n:type:ShaderForge.SFN_Dot,id:7703,x:32029,y:33050,varname:node_7703,prsc:2,dt:0|A-600-OUT,B-7695-OUT;n:type:ShaderForge.SFN_Color,id:6557,x:32130,y:33284,ptovrint:False,ptlb:LerpCol1,ptin:_LerpCol1,varname:node_6557,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:3307,x:32410,y:32885,ptovrint:False,ptlb:LerpCol2,ptin:_LerpCol2,varname:_LerpCol2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6391805,c2:1,c3:0.5613208,c4:1;n:type:ShaderForge.SFN_Multiply,id:5041,x:32410,y:33050,varname:node_5041,prsc:2|A-8436-OUT,B-3307-RGB;n:type:ShaderForge.SFN_Clamp01,id:8436,x:32206,y:33050,varname:node_8436,prsc:2|IN-7703-OUT;n:type:ShaderForge.SFN_Add,id:4749,x:32798,y:32768,varname:node_4749,prsc:2|A-4873-OUT,B-5041-OUT;n:type:ShaderForge.SFN_Lerp,id:9354,x:32701,y:33093,varname:node_9354,prsc:2|A-1137-OUT,B-4749-OUT,T-9317-OUT;n:type:ShaderForge.SFN_Tex2d,id:8068,x:32130,y:33522,ptovrint:False,ptlb:MaskTex,ptin:_MaskTex,varname:node_8068,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1137,x:32428,y:33233,varname:node_1137,prsc:2|A-8436-OUT,B-6557-RGB;n:type:ShaderForge.SFN_Step,id:9317,x:32354,y:33522,varname:node_9317,prsc:2|A-8068-RGB,B-2866-OUT;n:type:ShaderForge.SFN_Slider,id:2866,x:31987,y:33722,ptovrint:False,ptlb:MaskRange,ptin:_MaskRange,varname:node_2866,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:7656-8831-3307-6557-8068-2866;pass:END;sub:END;*/

Shader "Shader Forge/L6_SF_LerpSpec" {
    Properties {
        _FresnelPow ("FresnelPow", Float ) = 3
        _SpecPow ("SpecPow", Range(1, 90)) = 10
        _LerpCol2 ("LerpCol2", Color) = (0.6391805,1,0.5613208,1)
        _LerpCol1 ("LerpCol1", Color) = (0.5,0.5,0.5,1)
        _MaskTex ("MaskTex", 2D) = "white" {}
        _MaskRange ("MaskRange", Range(0, 1)) = 1
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _MaskTex; uniform float4 _MaskTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LerpCol1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LerpCol2)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskRange)
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
////// Emissive:
                float node_8436 = saturate(dot(lightDirection,i.normalDir));
                float4 _LerpCol1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LerpCol1 );
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _LerpCol2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LerpCol2 );
                float3 node_4749 = (pow(saturate(dot(viewReflectDirection,lightDirection)),_SpecPow_var)+(node_8436*_LerpCol2_var.rgb));
                float4 _MaskTex_var = tex2D(_MaskTex,TRANSFORM_TEX(i.uv0, _MaskTex));
                float _MaskRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MaskRange );
                float3 emissive = lerp((node_8436*_LerpCol1_var.rgb),node_4749,step(_MaskTex_var.rgb,_MaskRange_var));
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _MaskTex; uniform float4 _MaskTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LerpCol1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LerpCol2)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskRange)
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
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
