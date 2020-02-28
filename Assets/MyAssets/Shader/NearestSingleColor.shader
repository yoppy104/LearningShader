/********************************************
<summary> RGBでもっとも強い数値を持つものの単色として表現する
*********************************************/

Shader "Unlit/NearestSingleColor"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

			fixed4 Singlize(fixed4 col) {
				fixed4 o = fixed4(0, 0, 0, 1);
				if (col.r >= col.g && col.r >= col.b) {
					o.r = 1;
				}
				if (col.g >= col.r && col.g >= col.b) {
					o.g = 1;
				}
				if (col.b >= col.r && col.b >= col.g) {
					o.b = 1;
				}

				return o;
			}

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv);
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);

				fixed4 single_col = Singlize(col);

				clip(single_col.a - 0.9);

                return single_col;
            }
            ENDCG
        }
    }
}
