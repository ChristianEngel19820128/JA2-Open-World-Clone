Strict

SeedRnd MilliSecs()

Global wx=1600  '1280'1600'1920
Global wy=900   '720'900'1080
Global wd=0
Global wh=0

Graphics wx,wy,wd,wh,graphics_backbuffer

Global font:timagefont=LoadImageFont("font/ARIALUNI.TTF",14,BOLDFONT)
SetImageFont font


SetBlend alphablend



'HideMouse()




Include "jagged_main.bmx"

main_init()



Function do()

  main_do()

End Function





'hauptschleife

Print "GC-Memory: "+GCMemAlloced()

SetBlend alphablend

Global now:Int=MilliSecs()
Global ende:Byte=False
Global draw_t:Int=now

Global fps
Global fps_a
Global fps_t
Global fps_c
Global cycle

While ende=False

Cls

now=MilliSecs()

mouse_do()

do()

cycle=cycle+1


If MilliSecs()-draw_t>0 Then

SetColor 0,0,0
DrawRect wx-240,0,240,50
SetColor 255,255,255

  DrawText "cycle: "+(MilliSecs()-now),wx-120,10
  DrawText "steps: "+cycle,wx-240,10 
  cycle=0




  fps_c=fps_c+1
  fps=1000/(MilliSecs()-fps_t+1)
  fps_a=fps_a+fps


  DrawText "fps: "+(fps_a/fps_c)+" "+fps,wx-240,30
  DrawText "cycle: "+(MilliSecs()-fps_t),wx-120,30


  If fps_c>100 Then
   fps_a=fps_a/fps_c
   fps_c=1
  End If

  fps_t=MilliSecs()

  Flip(-1)
  draw_t=MilliSecs()

End If





If KeyHit(key_escape) Then ende=True
Wend

main_out()

Print "GC-Memory: "+GCMemAlloced()