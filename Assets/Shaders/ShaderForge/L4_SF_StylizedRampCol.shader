// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34122,y:33182,varname:node_3138,prsc:2|emission-4283-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:33335,y:32875,ptovrint:False,ptlb:LightCol,ptin:_LightCol,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_LightVector,id:63,x:32154,y:32986,varname:node_63,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9102,x:32154,y:33134,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:2057,x:32334,y:33062,varname:node_2057,prsc:2,dt:0|A-63-OUT,B-9102-OUT;n:type:ShaderForge.SFN_Color,id:1625,x:32169,y:32646,ptovrint:False,ptlb:CustomCol,ptin:_CustomCol,varname:node_1625,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.890244,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:9914,x:32012,y:32832,ptovrint:False,ptlb:SldCol,ptin:_SldCol,varname:node_9914,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Multiply,id:469,x:32382,y:32700,varname:node_469,prsc:2|A-1625-RGB,B-9914-OUT;n:type:ShaderForge.SFN_Step,id:6896,x:32635,y:33245,cmnt:RGB三个通道经过step得到得结果不同经过混合在彩色下有分层效果,varname:node_6896,prsc:2|A-469-OUT,B-2057-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4225,x:32574,y:32734,varname:node_4225,prsc:2,cc1:2,cc2:-1,cc3:-1,cc4:-1|IN-469-OUT;n:type:ShaderForge.SFN_Color,id:5171,x:33714,y:32252,ptovrint:False,ptlb:DarkCol,ptin:_DarkCol,varname:node_5171,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.990566,c2:0.9675971,c3:0.7522694,c4:1;n:type:ShaderForge.SFN_Min,id:4999,x:32747,y:32432,varname:node_4999,prsc:2|A-3442-OUT,B-7971-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3442,x:32574,y:32432,varname:node_3442,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-469-OUT;n:type:ShaderForge.SFN_ComponentMask,id:7971,x:32574,y:32581,varname:node_7971,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-469-OUT;n:type:ShaderForge.SFN_Min,id:6237,x:32921,y:32432,varname:node_6237,prsc:2|A-4999-OUT,B-4225-OUT;n:type:ShaderForge.SFN_Max,id:3481,x:32764,y:32734,varname:node_3481,prsc:2|A-3442-OUT,B-7971-OUT;n:type:ShaderForge.SFN_Max,id:8773,x:32925,y:32734,varname:node_8773,prsc:2|A-3481-OUT,B-4225-OUT;n:type:ShaderForge.SFN_Multiply,id:7726,x:33550,y:32432,varname:node_7726,prsc:2|A-5171-RGB,B-6623-OUT;n:type:ShaderForge.SFN_Multiply,id:5101,x:33335,y:32717,varname:node_5101,prsc:2|A-7241-RGB,B-8525-OUT;n:type:ShaderForge.SFN_Step,id:7416,x:33110,y:32432,varname:node_7416,prsc:2|A-6237-OUT,B-2057-OUT;n:type:ShaderForge.SFN_Step,id:8525,x:33106,y:32734,cmnt:高光部分遮罩,varname:node_8525,prsc:2|A-8773-OUT,B-2057-OUT;n:type:ShaderForge.SFN_OneMinus,id:1517,x:33106,y:32925,cmnt:低光部分遮罩,varname:node_1517,prsc:2|IN-8525-OUT;n:type:ShaderForge.SFN_Add,id:6209,x:33615,y:33064,varname:node_6209,prsc:2|A-5101-OUT,B-2258-OUT;n:type:ShaderForge.SFN_Multiply,id:2258,x:33106,y:33078,varname:node_2258,prsc:2|A-1517-OUT,B-6896-OUT;n:type:ShaderForge.SFN_OneMinus,id:6623,x:33303,y:32432,cmnt:阴影遮罩,varname:node_6623,prsc:2|IN-7416-OUT;n:type:ShaderForge.SFN_Add,id:5372,x:33772,y:32913,varname:node_5372,prsc:2|A-7726-OUT,B-6209-OUT;n:type:ShaderForge.SFN_ScreenPos,id:1347,x:32413,y:33535,varname:node_1347,prsc:2,sctp:1;n:type:ShaderForge.SFN_Tex2d,id:2097,x:32934,y:33617,ptovrint:False,ptlb:MaskTex,ptin:_MaskTex,varname:node_2097,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2f0173cbf9cf59448bd2955f46d92c84,ntxv:0,isnm:False|UVIN-5537-OUT;n:type:ShaderForge.SFN_Multiply,id:5537,x:32643,y:33659,varname:node_5537,prsc:2|A-1347-UVOUT,B-9046-OUT;n:type:ShaderForge.SFN_Depth,id:9046,x:32413,y:33717,varname:node_9046,prsc:2;n:type:ShaderForge.SFN_Step,id:2672,x:33246,y:33636,varname:node_2672,prsc:2|A-2097-RGB,B-1290-OUT;n:type:ShaderForge.SFN_Slider,id:1290,x:32895,y:33828,ptovrint:False,ptlb:MaskStrength,ptin:_MaskStrength,varname:node_1290,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Color,id:9804,x:33158,y:33946,ptovrint:False,ptlb:MaskCol,ptin:_MaskCol,varname:node_9804,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0.7681522,c4:1;n:type:ShaderForge.SFN_Lerp,id:3535,x:33622,y:33571,varname:node_3535,prsc:2|A-1517-OUT,B-3937-OUT,T-1517-OUT;n:type:ShaderForge.SFN_Add,id:4283,x:33873,y:33448,varname:node_4283,prsc:2|A-5372-OUT,B-3535-OUT;n:type:ShaderForge.SFN_Multiply,id:3937,x:33381,y:33822,varname:node_3937,prsc:2|A-2672-OUT,B-9804-RGB;proporder:5171-7241-1625-9914-2097-1290-9804;pass:END;sub:END;*/

Shader "Shader Forge/L4_SF_StylizedRampCol" {
    Properties {
        _DarkCol ("DarkCol", Color) = (0.990566,0.9675971,0.7522694,1)
        _LightCol ("LightCol", Color) = (0.07843138,0.3921569,0.7843137,1)
        _CustomCol ("CustomCol", Color) = (0,0.890244,1,1)
        _SldCol ("SldCol", Range(0, 1)) = 0.5
        _MaskTex ("MaskTex", 2D) = "white" {}
        _MaskStrength ("MaskStrength", Range(0, 1)) = 0.5
        _MaskCol ("MaskCol", Color) = (1,0,0.7681522,1)
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
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _CustomCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SldCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DarkCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskStrength)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MaskCol)
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
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 _DarkCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DarkCol );
                float4 _CustomCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CustomCol );
                float _SldCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SldCol );
                float3 node_469 = (_CustomCol_var.rgb*_SldCol_var);
                float node_3442 = node_469.r;
                float node_7971 = node_469.g;
                float node_4225 = node_469.b;
                float node_2057 = dot(lightDirection,i.normalDir);
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol );
                float node_8525 = step(max(max(node_3442,node_7971),node_4225),node_2057); // 高光部分遮罩
                float node_1517 = (1.0 - node_8525); // 低光部分遮罩
                float2 node_5537 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*partZ);
                float4 _MaskTex_var = tex2D(_MaskTex,TRANSFORM_TEX(node_5537, _MaskTex));
                float _MaskStrength_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MaskStrength );
                float4 _MaskCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MaskCol );
                float3 emissive = (((_DarkCol_var.rgb*(1.0 - step(min(min(node_3442,node_7971),node_4225),node_2057)))+((_LightCol_var.rgb*node_8525)+(node_1517*step(node_469,node_2057))))+lerp(float3(node_1517,node_1517,node_1517),(step(_MaskTex_var.rgb,_MaskStrength_var)*_MaskCol_var.rgb),node_1517));
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
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _CustomCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SldCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DarkCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskStrength)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MaskCol)
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
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
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
