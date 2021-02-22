// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33070,y:32747,varname:node_3138,prsc:2|emission-1250-OUT;n:type:ShaderForge.SFN_LightVector,id:913,x:31721,y:32734,varname:node_913,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:7465,x:31721,y:32597,varname:node_7465,prsc:2;n:type:ShaderForge.SFN_Dot,id:800,x:31910,y:32670,varname:node_800,prsc:2,dt:0|A-7465-OUT,B-913-OUT;n:type:ShaderForge.SFN_RemapRange,id:1326,x:32082,y:32670,varname:node_1326,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-800-OUT;n:type:ShaderForge.SFN_Tex2d,id:2418,x:32431,y:32724,ptovrint:False,ptlb:RampTex,ptin:_RampTex,varname:node_2418,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:696c599c882f78b4493881d727638186,ntxv:0,isnm:False|UVIN-1764-OUT;n:type:ShaderForge.SFN_Slider,id:184,x:31910,y:32876,ptovrint:False,ptlb:SldV,ptin:_SldV,varname:node_184,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Append,id:1764,x:32263,y:32724,varname:node_1764,prsc:2|A-1326-OUT,B-184-OUT;n:type:ShaderForge.SFN_Add,id:1250,x:32876,y:33085,varname:node_1250,prsc:2|A-5883-OUT,B-2987-OUT;n:type:ShaderForge.SFN_Clamp01,id:2930,x:32066,y:33032,varname:node_2930,prsc:2|IN-800-OUT;n:type:ShaderForge.SFN_Power,id:2987,x:32309,y:33148,varname:node_2987,prsc:2|VAL-2930-OUT,EXP-1960-OUT;n:type:ShaderForge.SFN_Slider,id:1960,x:31937,y:33295,ptovrint:False,ptlb:SpecularPow,ptin:_SpecularPow,varname:node_1960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:90;n:type:ShaderForge.SFN_Multiply,id:5883,x:32800,y:32728,varname:node_5883,prsc:2|A-9987-OUT,B-2418-RGB;n:type:ShaderForge.SFN_Slider,id:9987,x:32525,y:32593,ptovrint:False,ptlb:EnvRelectRate,ptin:_EnvRelectRate,varname:node_9987,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:2418-184-1960-9987;pass:END;sub:END;*/

Shader "Shader Forge/L6_SF_FakeEnvReflect" {
    Properties {
        _RampTex ("RampTex", 2D) = "white" {}
        _SldV ("SldV", Range(0, 1)) = 0
        _SpecularPow ("SpecularPow", Range(1, 90)) = 1
        _EnvRelectRate ("EnvRelectRate", Range(0, 1)) = 1
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
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SldV)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRelectRate)
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float _EnvRelectRate_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvRelectRate );
                float node_800 = dot(viewReflectDirection,lightDirection);
                float _SldV_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SldV );
                float2 node_1764 = float2((node_800*0.5+0.5),_SldV_var);
                float4 _RampTex_var = tex2D(_RampTex,TRANSFORM_TEX(node_1764, _RampTex));
                float _SpecularPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPow );
                float3 emissive = ((_EnvRelectRate_var*_RampTex_var.rgb)+pow(saturate(node_800),_SpecularPow_var));
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
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SldV)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRelectRate)
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
