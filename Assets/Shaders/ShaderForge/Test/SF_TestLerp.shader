// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:0,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33064,y:32672,varname:node_3138,prsc:2|emission-9531-OUT,alpha-8655-OUT;n:type:ShaderForge.SFN_Tex2d,id:6189,x:32459,y:32643,ptovrint:False,ptlb:FirstTex,ptin:_FirstTex,varname:node_6189,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6ee10a7a508155547b184dd72e091fd5,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6682,x:32446,y:32992,ptovrint:False,ptlb:SecondTex,ptin:_SecondTex,varname:_FirstTex_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4f6212f398f26bb479b2cf77f48ecbd0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:9531,x:32804,y:32816,varname:node_9531,prsc:2|A-6189-RGB,B-6682-RGB,T-3778-OUT;n:type:ShaderForge.SFN_Slider,id:3778,x:32344,y:32840,ptovrint:False,ptlb:SldLerp,ptin:_SldLerp,varname:node_3778,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:8655,x:32804,y:32996,varname:node_8655,prsc:2|A-6189-A,B-6682-A,T-3778-OUT;proporder:6189-6682-3778;pass:END;sub:END;*/

Shader "Shader Forge/SF_TestLerp" {
    Properties {
        _FirstTex ("FirstTex", 2D) = "white" {}
        _SecondTex ("SecondTex", 2D) = "white" {}
        _SldLerp ("SldLerp", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _FirstTex; uniform float4 _FirstTex_ST;
            uniform sampler2D _SecondTex; uniform float4 _SecondTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SldLerp)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
////// Lighting:
////// Emissive:
                float4 _FirstTex_var = tex2D(_FirstTex,TRANSFORM_TEX(i.uv0, _FirstTex));
                float4 _SecondTex_var = tex2D(_SecondTex,TRANSFORM_TEX(i.uv0, _SecondTex));
                float _SldLerp_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SldLerp );
                float3 node_9531 = lerp(_FirstTex_var.rgb,_SecondTex_var.rgb,_SldLerp_var);
                float3 emissive = node_9531;
                float3 finalColor = emissive;
                return fixed4(finalColor,lerp(_FirstTex_var.a,_SecondTex_var.a,_SldLerp_var));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
