# LearningShader

Shader勉強用<br>
意味不明なプログラム多し<br>
READMEには学習した備忘録を記載<br>

***

 ### 実装した機能
 
<ul>
  <li>
    テキストボックスのスクロール可能時の矢印等をふわふわ移動するシェーダー<br>
    UVスクロールにて実装。移動はSin関数によって上下させている。<br>
    移動方向、移動速度、移動幅を設定可能。<br>
    [[ SelectCommandIcon.shader ]]
  </li>
  <li>
     網掛け表示にして半透明にするシェーダー<br>
     vertexと表示レートとの剰余を計算して、x軸とy軸の値が等しい部分だけを表示するようにした。
     [[ Hatching.shader ]]
   </li>
</ul>
