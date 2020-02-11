Shader "Unlit/SelectCommandIcon"
{
    Properties
    {
        _MainTex   ("Texture", 2D) = "white" {}
		_Speed     ("Speed", float) = 1
		_Range	   ("Range", float) = 0.5
		_MoveRateX ("MoveRateX", float) = 0.5
		_MoveRateY ("MoveRateY", float) = 0.5
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
			float _Speed;		//移動速度
			float _Range;		//移動幅
			float _MoveRateX;	//左右方向への移動量
			float _MoveRateY;	//上下方向への移動量

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

			fixed4 frag(v2f i) : SV_Target
			{
				//描画UVの計算
				float2 uv = i.uv;
				uv.x += _MoveRateX * _Range * sin(_Time.y * _Speed);
				uv.y += _MoveRateY * _Range * sin(_Time.y * _Speed);

                // sample the texture
                fixed4 col = tex2D(_MainTex, uv);
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }
    }
}
