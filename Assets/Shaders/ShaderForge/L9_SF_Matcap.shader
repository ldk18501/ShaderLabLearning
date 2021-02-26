// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33630,y:32885,varname:node_3138,prsc:2|emission-7210-OUT;n:type:ShaderForge.SFN_Tex2d,id:5048,x:32260,y:32844,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_5048,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:7435,x:32459,y:32921,varname:node_7435,prsc:2,tffrom:2,tfto:0|IN-5048-RGB;n:type:ShaderForge.SFN_Transform,id:6416,x:32459,y:32742,varname:node_6416,prsc:2,tffrom:2,tfto:3|IN-5048-RGB;n:type:ShaderForge.SFN_RemapRange,id:2658,x:32679,y:32742,varname:node_2658,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-6416-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:4794,x:32854,y:32726,varname:node_4794,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2658-OUT;n:type:ShaderForge.SFN_Tex2d,id:480,x:33054,y:32726,ptovrint:False,ptlb:MatcapTex,ptin:_MatcapTex,varname:node_480,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c256b26dec5020a4d94e41d7158236ad,ntxv:0,isnm:False|UVIN-4794-OUT;n:type:ShaderForge.SFN_Dot,id:4164,x:32648,y:33033,varname:node_4164,prsc:2,dt:0|A-7435-XYZ,B-1889-OUT;n:type:ShaderForge.SFN_ViewVector,id:1889,x:32459,y:33108,varname:node_1889,prsc:2;n:type:ShaderForge.SFN_OneMinus,id:5447,x:32822,y:33033,varname:node_5447,prsc:2|IN-4164-OUT;n:type:ShaderForge.SFN_Power,id:484,x:33000,y:33033,varname:node_484,prsc:2|VAL-5447-OUT,EXP-1961-OUT;n:type:ShaderForge.SFN_Slider,id:1961,x:32708,y:33301,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_1961,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Slider,id:6802,x:32897,y:32922,ptovrint:False,ptlb:ReflectIntensity,ptin:_ReflectIntensity,varname:node_6802,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:2;n:type:ShaderForge.SFN_Multiply,id:2608,x:33317,y:32778,varname:node_2608,prsc:2|A-480-RGB,B-6802-OUT;n:type:ShaderForge.SFN_Multiply,id:7210,x:33443,y:32998,varname:node_7210,prsc:2|A-2608-OUT,B-484-OUT;proporder:5048-480-1961-6802;pass:END;sub:END;*/

Shader "Shader Forge/L9_SF_Matcap" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _MatcapTex ("MatcapTex", 2D) = "white" {}
        _FresnelPow ("FresnelPow", Range(0, 10)) = 1
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
            uniform sampler2D _MatcapTex; uniform float4 _MatcapTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
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
                float2 node_4794 = (mul( UNITY_MATRIX_V, float4(mul( _NormalMap_var.rgb, tangentTransform ),0) ).xyz.rgb*0.5+0.5).rg;
                float4 _MatcapTex_var = tex2D(_MatcapTex,TRANSFORM_TEX(node_4794, _MatcapTex));
                float _ReflectIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ReflectIntensity );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float node_484 = pow((1.0 - dot(mul( _NormalMap_var.rgb, tangentTransform ).xyz.rgb,viewDirection)),_FresnelPow_var);
                float3 emissive = ((_MatcapTex_var.rgb*_ReflectIntensity_var)*node_484);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
