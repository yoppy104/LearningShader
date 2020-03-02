# LearningShader

Shader勉強用<br>
意味不明なプログラム多し<br>
READMEには学習した備忘録を記載<br>

***

 ### 実装した機能
 
* <b>テキストボックスのスクロール可能時の矢印等をふわふわ移動するシェーダー</b><br>
    UVスクロールにて実装。移動はSin関数によって上下させている。<br>
    移動方向、移動速度、移動幅を設定可能。<br>
   [ <i>SelectCommandIcon.shader</i> ]

* <b>網掛け表示にして半透明にするシェーダー</b><br>
     vertexと表示レートとの剰余を計算して、x軸とy軸の値が等しい部分だけを表示するようにした。<br>
   [ <i>Hatching.shader</i> ]
   
* <b>色ずれを発生させるシェ―ダー</b><br>
     RGBごとに表示するvertexをずらすことで色ずれのような表示を実現した。<br>
   [ <i>ColorShift.shader</i> ]

* <b>色調強化のシェーダー</b><br>
     RGBの最大値をさらに増加させて、最小値をさらに減少させるようにして色味を変化させるシェーダーを作成した。<br>
   [ <i>PowerUp.shader</i> ]

* <b>テクスチャをノイズ画像に従ってブレンドするシェーダー</b><br>
     よくあるLerpを使用したテクスチャブレンド<br>
   [ <i>SnowGradation.shader</i> ]
