// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33650,y:32995,varname:node_3138,prsc:2|emission-8541-OUT,olwid-1629-OUT,olcol-8524-RGB;n:type:ShaderForge.SFN_Dot,id:1581,x:32362,y:32668,varname:node_1581,prsc:2,dt:0|A-3566-OUT,B-7041-OUT;n:type:ShaderForge.SFN_NormalVector,id:7041,x:32174,y:32742,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:3566,x:32174,y:32568,varname:node_3566,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:1629,x:32674,y:33651,ptovrint:False,ptlb:OutlineWidth,ptin:_OutlineWidth,varname:node_1629,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.015;n:type:ShaderForge.SFN_Color,id:8524,x:32674,y:33746,ptovrint:False,ptlb:OutlineCol,ptin:_OutlineCol,varname:node_8524,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.08490568,c2:0.07809721,c3:0.07809721,c4:1;n:type:ShaderForge.SFN_Depth,id:8050,x:32144,y:33428,cmnt:离相机距离越远越大,varname:node_8050,prsc:2;n:type:ShaderForge.SFN_ScreenPos,id:1111,x:32144,y:33233,cmnt:屏幕UV,varname:node_1111,prsc:2,sctp:1;n:type:ShaderForge.SFN_Multiply,id:8098,x:32335,y:33323,varname:node_8098,prsc:2|A-1111-UVOUT,B-8050-OUT;n:type:ShaderForge.SFN_Tex2d,id:4775,x:32526,y:33323,ptovrint:False,ptlb:SampleTex,ptin:_SampleTex,cmnt:排线输出单通道和多通道没区别,varname:node_4775,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9edd52b1652527542b79a97935fdbd68,ntxv:0,isnm:False|UVIN-8098-OUT;n:type:ShaderForge.SFN_Step,id:68,x:32740,y:33182,varname:node_68,prsc:2|A-4775-R,B-1581-OUT;n:type:ShaderForge.SFN_Lerp,id:2511,x:33209,y:32589,varname:node_2511,prsc:2|A-9900-RGB,B-9033-RGB,T-68-OUT;n:type:ShaderForge.SFN_Color,id:9033,x:32913,y:32363,ptovrint:False,ptlb:LightCol,ptin:_LightCol,varname:node_9033,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6462264,c2:0.9577883,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:9900,x:32913,y:32581,ptovrint:False,ptlb:DarkCol,ptin:_DarkCol,varname:_LightCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1145425,c2:0.5338362,c3:0.735849,c4:1;n:type:ShaderForge.SFN_Vector1,id:7805,x:32899,y:33346,varname:node_7805,prsc:2,v1:-1;n:type:ShaderForge.SFN_Vector1,id:8273,x:32915,y:33417,varname:node_8273,prsc:2,v1:1;n:type:ShaderForge.SFN_Color,id:7341,x:32362,y:32461,ptovrint:False,ptlb:MainCol,ptin:_MainCol,varname:node_7341,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:7030,x:32597,y:32552,varname:node_7030,prsc:2|A-1581-OUT,B-7341-RGB;n:type:ShaderForge.SFN_Add,id:9295,x:33105,y:33059,varname:node_9295,prsc:2|A-2511-OUT,B-7030-OUT;n:type:ShaderForge.SFN_Clamp,id:1820,x:33259,y:33176,varname:node_1820,prsc:2|IN-9295-OUT,MIN-7805-OUT,MAX-8273-OUT;n:type:ShaderForge.SFN_Multiply,id:8541,x:33448,y:33059,varname:node_8541,prsc:2|A-1820-OUT,B-4153-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:4153,x:33448,y:32832,varname:node_4153,prsc:2;proporder:1629-8524-4775-9033-9900-7341;pass:END;sub:END;*/

Shader "Shader Forge/L2_SF_RampLit_UVDepth" {
    Properties {
        _OutlineWidth ("OutlineWidth", Float ) = 0.015
        _OutlineCol ("OutlineCol", Color) = (0.08490568,0.07809721,0.07809721,1)
        _SampleTex ("SampleTex", 2D) = "white" {}
        _LightCol ("LightCol", Color) = (0.6462264,0.9577883,1,1)
        _DarkCol ("DarkCol", Color) = (0.1145425,0.5338362,0.735849,1)
        _MainCol ("MainCol", Color) = (0.5,0.5,0.5,1)
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
            uniform sampler2D _SampleTex; uniform float4 _SampleTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DarkCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainCol)
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
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _DarkCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DarkCol );
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol );
                float2 node_8098 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*partZ);
                float4 _SampleTex_var = tex2D(_SampleTex,TRANSFORM_TEX(node_8098, _SampleTex)); // 排线输出单通道和多通道没区别
                float node_1581 = dot(lightDirection,i.normalDir);
                float4 _MainCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainCol );
                float3 emissive = (clamp((lerp(_DarkCol_var.rgb,_LightCol_var.rgb,step(_SampleTex_var.r,node_1581))+(node_1581*_MainCol_var.rgb)),(-1.0),1.0)*attenuation);
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
            uniform sampler2D _SampleTex; uniform float4 _SampleTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DarkCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainCol)
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
