
Strict

SeedRnd MilliSecs()

Global wx=1920
Global wy=1080
Global wd=0
Global wh=0

Graphics wx,wy,wd,wh,graphics_backbuffer

SetBlend alphablend

Include "jagged_animations.bmx"



Global scx=120
Global scy=120



Function createtile(anim,pos)

      Local i
      Local x
      Local y

      Local pix0:TPixmap=CreatePixmap(scx,scy,PF_RGBA8888)
      Local pix1:TPixmap=CreatePixmap(scx,scy,PF_RGBA8888)
      Local pix2:TPixmap=CreatePixmap(scx,scy,PF_RGBA8888)
      Local pix3:TPixmap=CreatePixmap(scx,scy,PF_RGBA8888)
      Local pix4:TPixmap=CreatePixmap(scx,scy,PF_RGBA8888)
      Local pix5:TPixmap=CreatePixmap(scx,scy,PF_RGBA8888)
      Local pix6:TPixmap=CreatePixmap(scx,scy,PF_RGBA8888)

      Local argb


 'DrawRect 0,0,scx,scy


  For i=0 To img_count_merc[male,anim]-1

    DrawImage(img_merc[male,anim,body,pos,i],scx/2+off_x_merc[male,anim,pos,i]+i*scx,scy/2+off_y_merc[male,anim,pos,i])


    pix0=GrabPixmap(scx*i,0,scx,scy)

    For x=0 To scx-1
    For y=0 To scy-1

      argb=ReadPixel(pix0,x,y)

      'hair
      If (argb Shr 16 & $FF) > 100 And (argb Shr 8 & $FF) = 0 And (argb & $FF) < 50 Then
        WritePixel(pix1,x,y,argb)
      Else
        WritePixel(pix1,x,y,0)
      End If

      'shirt
      If (argb Shr 16 & $FF) = 0 And (argb Shr 8 & $FF) = 0 And (argb & $FF) > 0 Then
        WritePixel(pix2,x,y,argb)
      Else
        WritePixel(pix2,x,y,0)
      End If

      'skin
      If ((argb Shr 16 & $FF) > 0 And (argb Shr 8 & $FF) = 0 And (argb & $FF) > 0) And Not ((argb Shr 16 & $FF) > 100 And (argb Shr 8 & $FF) = 0 And (argb & $FF) < 50) Then
        WritePixel(pix3,x,y,argb)
      Else
        WritePixel(pix3,x,y,0)
      End If

      'pants
      If (argb Shr 16 & $FF) = 0 And (argb Shr 8 & $FF) > 0 And (argb & $FF) = 0 Then
        WritePixel(pix4,x,y,argb)
      Else
        WritePixel(pix4,x,y,0)
      End If

      'equip
      If (argb Shr 16 & $FF) > 0 And (argb Shr 8 & $FF) > 0 And (argb & $FF) > 0 Then
        WritePixel(pix5,x,y,argb)
      Else
        WritePixel(pix5,x,y,0)
      End If

      'misc
      If ((argb Shr 16 & $FF) = 0 And (argb Shr 8 & $FF) = 255 And (argb & $FF) = 255) Or ((argb Shr 16 & $FF) = 128 And (argb Shr 8 & $FF) = 128 And (argb & $FF) = 128) Then
        WritePixel(pix6,x,y,argb)
      Else
        WritePixel(pix6,x,y,0)
      End If

    Next
    Next

    DrawPixmap(pix1,i*scx,scy)
    DrawPixmap(pix2,i*scx,scy*2)
    DrawPixmap(pix3,i*scx,scy*3)
    DrawPixmap(pix4,i*scx,scy*4)
    DrawPixmap(pix5,i*scx,scy*5)
    DrawPixmap(pix6,i*scx,scy*6)

  Next




End Function


Function savetile()
  'Local pix:TPixmap=CreatePixmap(wx,wy,PF_RGBA8888)

  'pix=GrabPixmap(0,0,scx*frames,scy*6)
  'pix=MaskPixmap(pix,0,0,0)
  'SavePixmapPNG(pix,"gfx/m_merc/body/"+male+"_"+anim+"_"+pos+".png")
End Function











Function do()

  'For Local i=0 To anim_max-1
  '  For Local k=0 To 7
  '    createtile(i,k)
  '  Next
  'Next

End Function








Global font:timagefont=LoadImageFont("font/arial.ttf",12)
SetImageFont font

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

'''''''''''''''''''''''''''''''''''''''''''''''''''''''



do()




'''''''''''''''''''''''''''''''''''''''''''''''''''''''

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
