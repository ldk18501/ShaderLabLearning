// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33472,y:32745,varname:node_3138,prsc:2|emission-1032-OUT;n:type:ShaderForge.SFN_LightVector,id:9737,x:32373,y:33103,varname:node_9737,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:7225,x:32373,y:33257,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:6228,x:32596,y:33176,varname:node_6228,prsc:2,dt:0|A-9737-OUT,B-7225-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:7195,x:32308,y:32519,varname:node_7195,prsc:2;n:type:ShaderForge.SFN_Dot,id:82,x:32492,y:32604,varname:node_82,prsc:2,dt:0|A-7195-OUT,B-6797-OUT;n:type:ShaderForge.SFN_LightVector,id:6797,x:32308,y:32653,varname:node_6797,prsc:2;n:type:ShaderForge.SFN_Power,id:9047,x:32856,y:32578,varname:node_9047,prsc:2|VAL-9167-OUT,EXP-8405-OUT;n:type:ShaderForge.SFN_Slider,id:8405,x:32478,y:32802,ptovrint:False,ptlb:SpecularPow,ptin:_SpecularPow,varname:node_8405,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:10,max:90;n:type:ShaderForge.SFN_Max,id:9167,x:32681,y:32578,varname:node_9167,prsc:2|A-4323-OUT,B-82-OUT;n:type:ShaderForge.SFN_Vector1,id:4323,x:32492,y:32531,varname:node_4323,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:2510,x:32828,y:32778,ptovrint:False,ptlb:SpecularCol,ptin:_SpecularCol,varname:node_2510,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4103774,c2:0.4833084,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:726,x:33052,y:32727,varname:node_726,prsc:2|A-9047-OUT,B-2510-RGB;n:type:ShaderForge.SFN_Multiply,id:764,x:32981,y:33105,varname:node_764,prsc:2|A-8703-RGB,B-5374-OUT;n:type:ShaderForge.SFN_Color,id:8703,x:32780,y:33006,ptovrint:False,ptlb:MainCol,ptin:_MainCol,varname:node_8703,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5557119,c2:1,c3:0.3537736,c4:1;n:type:ShaderForge.SFN_Clamp01,id:5374,x:32780,y:33176,varname:node_5374,prsc:2|IN-6228-OUT;n:type:ShaderForge.SFN_Add,id:1032,x:33285,y:32863,varname:node_1032,prsc:2|A-726-OUT,B-764-OUT;proporder:8405-2510-8703;pass:END;sub:END;*/

Shader "Shader Forge/L6_SF_LitSpecular" {
    Properties {
        _SpecularPow ("SpecularPow", Range(1, 90)) = 10
        _SpecularCol ("SpecularCol", Color) = (0.4103774,0.4833084,1,1)
        _MainCol ("MainCol", Color) = (0.5557119,1,0.3537736,1)
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpecularCol)
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
                float _SpecularPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPow );
                float4 _SpecularCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularCol );
                float4 _MainCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainCol );
                float3 emissive = ((pow(max(0.0,dot(viewReflectDirection,lightDirection)),_SpecularPow_var)*_SpecularCol_var.rgb)+(_MainCol_var.rgb*saturate(dot(lightDirection,i.normalDir))));
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpecularCol)
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
