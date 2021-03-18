// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33656,y:32850,varname:node_3138,prsc:2|emission-4061-OUT,alpha-6922-OUT;n:type:ShaderForge.SFN_Slider,id:6735,x:32240,y:32509,ptovrint:False,ptlb:DissolveInt,ptin:_DissolveInt,varname:node_6735,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Step,id:3470,x:32884,y:32708,varname:node_3470,prsc:2|A-6735-OUT,B-8077-OUT;n:type:ShaderForge.SFN_Tex2d,id:5660,x:32274,y:32977,ptovrint:False,ptlb:NoiseTex,ptin:_NoiseTex,varname:node_5660,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:4327,x:32870,y:32976,varname:node_4327,prsc:2|A-7682-OUT,B-8077-OUT;n:type:ShaderForge.SFN_Tex2d,id:4439,x:32884,y:32492,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4439,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:576edceba22ca8d4397777c805781981,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4144,x:33152,y:32587,varname:node_4144,prsc:2|A-4439-RGB,B-3470-OUT;n:type:ShaderForge.SFN_Subtract,id:5430,x:33052,y:33130,varname:node_5430,prsc:2|A-4327-OUT,B-3470-OUT;n:type:ShaderForge.SFN_Color,id:9143,x:32779,y:33304,ptovrint:False,ptlb:DissolveCol,ptin:_DissolveCol,varname:node_9143,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.3573008,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:338,x:33121,y:33325,varname:node_338,prsc:2|A-5430-OUT,B-9143-RGB;n:type:ShaderForge.SFN_Add,id:4061,x:33360,y:32811,varname:node_4061,prsc:2|A-4144-OUT,B-338-OUT;n:type:ShaderForge.SFN_Add,id:6922,x:33360,y:32962,varname:node_6922,prsc:2|A-3470-OUT,B-5430-OUT;n:type:ShaderForge.SFN_Slider,id:108,x:32195,y:32780,ptovrint:False,ptlb:DissolveThickness,ptin:_DissolveThickness,varname:node_108,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.1;n:type:ShaderForge.SFN_Subtract,id:7682,x:32647,y:32735,varname:node_7682,prsc:2|A-6735-OUT,B-108-OUT;n:type:ShaderForge.SFN_ComponentMask,id:5007,x:32446,y:32976,varname:node_5007,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-5660-RGB;n:type:ShaderForge.SFN_ConstantClamp,id:8077,x:32647,y:32976,varname:node_8077,prsc:2,min:0,max:0.9|IN-5007-OUT;proporder:5660-4439-9143-6735-108;pass:END;sub:END;*/

Shader "Shader Forge/SF_Dissolve" {
    Properties {
        _NoiseTex ("NoiseTex", 2D) = "white" {}
        _MainTex ("MainTex", 2D) = "white" {}
        _DissolveCol ("DissolveCol", Color) = (0,0.3573008,1,1)
        _DissolveInt ("DissolveInt", Range(0, 1)) = 1
        _DissolveThickness ("DissolveThickness", Range(0, 0.1)) = 0
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
            uniform sampler2D _NoiseTex; uniform float4 _NoiseTex_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _DissolveInt)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DissolveCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _DissolveThickness)
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
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float _DissolveInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DissolveInt );
                float4 _NoiseTex_var = tex2D(_NoiseTex,TRANSFORM_TEX(i.uv0, _NoiseTex));
                float node_8077 = clamp(_NoiseTex_var.rgb.r,0,0.9);
                float node_3470 = step(_DissolveInt_var,node_8077);
                float _DissolveThickness_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DissolveThickness );
                float node_5430 = (step((_DissolveInt_var-_DissolveThickness_var),node_8077)-node_3470);
                float4 _DissolveCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DissolveCol );
                float3 emissive = ((_MainTex_var.rgb*node_3470)+(node_5430*_DissolveCol_var.rgb));
                float3 finalColor = emissive;
                return fixed4(finalColor,(node_3470+node_5430));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
