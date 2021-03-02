// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33321,y:32863,varname:node_3138,prsc:2|emission-4928-OUT;n:type:ShaderForge.SFN_ViewVector,id:8038,x:32031,y:32581,varname:node_8038,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8115,x:32250,y:32627,varname:node_8115,prsc:2|A-8038-OUT,B-190-OUT;n:type:ShaderForge.SFN_Vector1,id:190,x:32031,y:32717,varname:node_190,prsc:2,v1:-1;n:type:ShaderForge.SFN_Tex2d,id:4984,x:31778,y:32857,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_4984,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f2db422f013c37b4e9d26b6605513ab8,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:484,x:31987,y:32857,varname:node_484,prsc:2,tffrom:2,tfto:0|IN-4984-RGB;n:type:ShaderForge.SFN_Reflect,id:6741,x:32452,y:32627,varname:node_6741,prsc:2|A-8115-OUT,B-484-XYZ;n:type:ShaderForge.SFN_Cubemap,id:7619,x:32659,y:32627,ptovrint:False,ptlb:CubeMap,ptin:_CubeMap,varname:node_7619,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:d51cd34544212c54fad1d1ed41ff1d59,pvfc:0|DIR-6741-OUT,MIP-5759-OUT;n:type:ShaderForge.SFN_Dot,id:1496,x:32277,y:33032,varname:node_1496,prsc:2,dt:0|A-8038-OUT,B-484-XYZ;n:type:ShaderForge.SFN_OneMinus,id:5241,x:32508,y:33016,varname:node_5241,prsc:2|IN-1496-OUT;n:type:ShaderForge.SFN_Power,id:1870,x:32726,y:32998,varname:node_1870,prsc:2|VAL-5241-OUT,EXP-7278-OUT;n:type:ShaderForge.SFN_Slider,id:7278,x:32444,y:33183,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_7278,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:2,max:10;n:type:ShaderForge.SFN_Slider,id:5759,x:32337,y:32802,ptovrint:False,ptlb:MipIntensity,ptin:_MipIntensity,varname:node_5759,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:7;n:type:ShaderForge.SFN_Multiply,id:7794,x:32954,y:32854,varname:node_7794,prsc:2|A-7619-RGB,B-9389-OUT;n:type:ShaderForge.SFN_Slider,id:9389,x:32537,y:32910,ptovrint:False,ptlb:ReflectIntensity,ptin:_ReflectIntensity,varname:node_9389,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:2;n:type:ShaderForge.SFN_Multiply,id:4928,x:33119,y:32962,varname:node_4928,prsc:2|A-7794-OUT,B-1870-OUT;proporder:4984-7619-7278-5759-9389;pass:END;sub:END;*/

Shader "Shader Forge/L9_SF_CubeMap" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _CubeMap ("CubeMap", Cube) = "_Skybox" {}
        _FresnelPow ("FresnelPow", Range(1, 10)) = 2
        _MipIntensity ("MipIntensity", Range(0, 7)) = 0
        _ReflectIntensity ("ReflectIntensity", Range(1, 2)) = 1
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
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform samplerCUBE _CubeMap;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _MipIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _ReflectIntensity)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 node_484 = mul( _NormalMap_var.rgb, tangentTransform ).xyz;
                float _MipIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MipIntensity );
                float _ReflectIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ReflectIntensity );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float3 emissive = ((texCUBElod(_CubeMap,float4(reflect((viewDirection*(-1.0)),node_484.rgb),_MipIntensity_var)).rgb*_ReflectIntensity_var)*pow((1.0 - dot(viewDirection,node_484.rgb)),_FresnelPow_var));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
