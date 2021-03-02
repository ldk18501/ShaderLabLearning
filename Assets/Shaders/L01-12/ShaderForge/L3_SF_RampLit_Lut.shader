// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33348,y:32736,varname:node_3138,prsc:2|emission-4440-RGB;n:type:ShaderForge.SFN_Vector4Property,id:9131,x:32330,y:32604,ptovrint:False,ptlb:FakeLightDir,ptin:_FakeLightDir,varname:node_9131,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1,v2:1,v3:0,v4:0;n:type:ShaderForge.SFN_NormalVector,id:1878,x:32499,y:32770,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:77,x:32687,y:32702,varname:node_77,prsc:2,dt:0|A-2064-OUT,B-1878-OUT;n:type:ShaderForge.SFN_RemapRange,id:5185,x:32867,y:32702,varname:node_5185,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-77-OUT;n:type:ShaderForge.SFN_Normalize,id:2064,x:32499,y:32604,varname:node_2064,prsc:2|IN-9131-XYZ;n:type:ShaderForge.SFN_Color,id:2222,x:32719,y:32980,ptovrint:False,ptlb:ShadowCol1,ptin:_ShadowCol1,varname:node_2222,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:5948,x:32719,y:33160,ptovrint:False,ptlb:ShadowCol2,ptin:_ShadowCol2,varname:_ShadowCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4528302,c2:0.06528427,c3:0.04058383,c4:1;n:type:ShaderForge.SFN_Lerp,id:3875,x:32921,y:33086,varname:node_3875,prsc:2|A-2222-RGB,B-5948-RGB,T-990-OUT;n:type:ShaderForge.SFN_Slider,id:990,x:32388,y:33110,ptovrint:False,ptlb:SldCol,ptin:_SldCol,varname:node_990,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Max,id:7813,x:33116,y:32840,varname:node_7813,prsc:2|A-5185-OUT,B-3875-OUT;n:type:ShaderForge.SFN_LightVector,id:9774,x:32499,y:32469,varname:node_9774,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:4440,x:33346,y:32500,ptovrint:False,ptlb:RampTex,ptin:_RampTex,varname:node_4440,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e3597d9fab184a84f8d0d845bf751763,ntxv:0,isnm:False|UVIN-8789-OUT;n:type:ShaderForge.SFN_Append,id:8789,x:33151,y:32482,varname:node_8789,prsc:2|A-5185-OUT,B-5526-OUT;n:type:ShaderForge.SFN_Slider,id:5526,x:32797,y:32369,ptovrint:False,ptlb:node_5526,ptin:_node_5526,varname:node_5526,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Color,id:3546,x:33103,y:33299,ptovrint:False,ptlb:ShadowCol_copy,ptin:_ShadowCol_copy,varname:_ShadowCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:345,x:33167,y:33363,ptovrint:False,ptlb:ShadowCol_copy_copy,ptin:_ShadowCol_copy_copy,varname:_ShadowCol_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;proporder:9131-2222-5948-990-4440-5526;pass:END;sub:END;*/

Shader "Shader Forge/L3_SF_RampLit_Lut" {
    Properties {
        _FakeLightDir ("FakeLightDir", Vector) = (1,1,0,0)
        _ShadowCol1 ("ShadowCol1", Color) = (0,0,0,1)
        _ShadowCol2 ("ShadowCol2", Color) = (0.4528302,0.06528427,0.04058383,1)
        _SldCol ("SldCol", Range(0, 1)) = 0.5
        _RampTex ("RampTex", 2D) = "white" {}
        _node_5526 ("node_5526", Range(0, 1)) = 1
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
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _FakeLightDir)
                UNITY_DEFINE_INSTANCED_PROP( float, _node_5526)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float3 normalDir : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
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
                float4 _FakeLightDir_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FakeLightDir );
                float node_5185 = (dot(normalize(_FakeLightDir_var.rgb),i.normalDir)*0.5+0.5);
                float _node_5526_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_5526 );
                float2 node_8789 = float2(node_5185,_node_5526_var);
                float4 _RampTex_var = tex2D(_RampTex,TRANSFORM_TEX(node_8789, _RampTex));
                float3 emissive = _RampTex_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
