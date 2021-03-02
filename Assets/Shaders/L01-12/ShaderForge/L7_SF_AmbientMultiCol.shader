// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33556,y:32611,varname:node_3138,prsc:2|emission-2470-OUT;n:type:ShaderForge.SFN_NormalVector,id:6185,x:32037,y:32694,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:5945,x:32205,y:32694,varname:node_5945,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-6185-OUT;n:type:ShaderForge.SFN_Color,id:1813,x:32235,y:32225,ptovrint:False,ptlb:EnvTopCol,ptin:_EnvTopCol,varname:node_1813,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:4006,x:32235,y:32409,varname:node_4006,prsc:2|A-1813-RGB,B-515-OUT;n:type:ShaderForge.SFN_Subtract,id:8029,x:32953,y:32694,cmnt:中间遮罩,varname:node_8029,prsc:2|A-6554-OUT,B-3864-OUT;n:type:ShaderForge.SFN_Vector1,id:6554,x:32764,y:32667,varname:node_6554,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:3423,x:32390,y:32936,varname:node_3423,prsc:2|A-5945-OUT,B-1900-OUT;n:type:ShaderForge.SFN_Vector1,id:1900,x:32175,y:32957,varname:node_1900,prsc:2,v1:-1;n:type:ShaderForge.SFN_Add,id:3864,x:32774,y:32831,varname:node_3864,prsc:2|A-515-OUT,B-6932-OUT;n:type:ShaderForge.SFN_Max,id:515,x:32573,y:32729,cmnt:顶部遮罩,varname:node_515,prsc:2|A-5945-OUT,B-4102-OUT;n:type:ShaderForge.SFN_Vector1,id:4102,x:32175,y:32884,varname:node_4102,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:6932,x:32573,y:32898,cmnt:底部遮罩,varname:node_6932,prsc:2|A-4102-OUT,B-3423-OUT;n:type:ShaderForge.SFN_Add,id:4460,x:33164,y:32500,varname:node_4460,prsc:2|A-4006-OUT,B-1836-OUT,C-3038-OUT;n:type:ShaderForge.SFN_Color,id:5988,x:32583,y:32105,ptovrint:False,ptlb:EnvBottomCol,ptin:_EnvBottomCol,varname:_EnvTopCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:1366,x:32927,y:32166,ptovrint:False,ptlb:EnvMiddleCol,ptin:_EnvMiddleCol,varname:_EnvTopCol_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.754717,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:1836,x:32583,y:32288,varname:node_1836,prsc:2|A-5988-RGB,B-6932-OUT;n:type:ShaderForge.SFN_Multiply,id:3038,x:32927,y:32323,varname:node_3038,prsc:2|A-1366-RGB,B-8029-OUT;n:type:ShaderForge.SFN_Tex2d,id:3079,x:33182,y:32785,ptovrint:False,ptlb:AOTex,ptin:_AOTex,varname:node_3079,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2470,x:33378,y:32699,varname:node_2470,prsc:2|A-4460-OUT,B-3079-RGB;proporder:1813-5988-1366-3079;pass:END;sub:END;*/

Shader "Shader Forge/L7_SF_AmbientMultiCol" {
    Properties {
        _EnvTopCol ("EnvTopCol", Color) = (1,1,1,1)
        _EnvBottomCol ("EnvBottomCol", Color) = (1,1,1,1)
        _EnvMiddleCol ("EnvMiddleCol", Color) = (0.754717,0,0,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _AOTex; uniform float4 _AOTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvTopCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvBottomCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvMiddleCol)
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
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _EnvTopCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvTopCol );
                float node_5945 = i.normalDir.g;
                float node_4102 = 0.0;
                float node_515 = max(node_5945,node_4102); // 顶部遮罩
                float4 _EnvBottomCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvBottomCol );
                float node_6932 = max(node_4102,(node_5945*(-1.0))); // 底部遮罩
                float4 _EnvMiddleCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvMiddleCol );
                float4 _AOTex_var = tex2D(_AOTex,TRANSFORM_TEX(i.uv0, _AOTex));
                float3 emissive = (((_EnvTopCol_var.rgb*node_515)+(_EnvBottomCol_var.rgb*node_6932)+(_EnvMiddleCol_var.rgb*(1.0-(node_515+node_6932))))*_AOTex_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
