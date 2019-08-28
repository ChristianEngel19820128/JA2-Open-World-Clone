
Global ch_ambient:TChannel
ch_ambient=AllocChannel()

Global ch_wind:TChannel
ch_wind=AllocChannel()
SetChannelVolume(ch_wind,1)

Global wind=0
Global wind_align=0
Global wind_t
Global wind_s=100



Global ch_rain:TChannel
ch_rain=AllocChannel()
SetChannelVolume(ch_rain,0.8)

Global img_rain:TImage=LoadImage("gfx/world/weather/rain.png",0)

Const rain_max=150



Global gewitter=0

Global rain=0

Global rain_c=0
Global rain_t
Global rain_s=25

Global rain_t1
Global rain_s1=50

Global rain_x_max=wx/128+1
Global rain_y_max=wy/128+2

Global rain_y[rain_y_max]
Global rain_z[rain_y_max]

Global rain_y_off_x[rain_y_max]
Global rain_z_off_x[rain_y_max]

Function rain_start()

  rain=1

  For Local k=0 To rain_y_max-1
    rain_y[k]=k*128
    rain_z[k]=k*128
  Next

  PlaySound(snd_rain0,ch_rain)

End Function


Function rain_stop()
  rain=0
  StopChannel(ch_rain)
End Function



Function rain_draw()

  If rain>0 Then

    If MilliSecs()>rain_t+rain_s Then
      rain_t=MilliSecs()
      For Local k=0 To rain_y_max-1
        rain_y[k]:+9
        If rain_y[k]>(rain_y_max-1)*128 Then
           rain_y[k]=-128
           rain_y_off_x[k]=Rand(0,128)
        End If
      Next
    End If

    If MilliSecs()>rain_t1+rain_s1 Then
      rain_t1=MilliSecs()
      For Local k=0 To rain_y_max-1
        rain_z[k]:+9
        If rain_z[k]>(rain_y_max-1)*128 Then
           rain_z[k]=-128
           rain_z_off_x[k]=Rand(0,128)
        End If
      Next
    End If


SetBlend shadeblend
    For Local k=0 To rain_y_max-1
      For Local i=0 To rain_x_max-1
        DrawImage img_rain,i*128-rain_y_off_x[k],rain_y[k]
        DrawImage img_rain,i*128-rain_z_off_x[k],rain_z[k]
      Next
    Next
SetBlend alphablend

  End If

End Function





Const wet_max=7


Global wetter_t
Global wetter_s=50

Global wetter_time
Global wetter_speed=5

Global wetter_x=wx-150
Global wetter_y=wy-160




Global temperatur
Global temperatur_max

Global temp_c

Function wetter_do()


  If timestemp>wetter_time+wetter_speed Then
    wetter_time=timestemp
    wetter_change()

    If stunden<12 Then
      temperatur:+Rand(0,1)
    End If
    If stunden>=12 Then
      temperatur:-Rand(0,1)
    End If

    If monat<8 And monat>3 Then
      temperatur:+Rand(0,1)
    End If
    If monat>8 Or monat<3 Then
      temperatur:-Rand(0,1)
    End If

    If temperatur>temperatur_max Then
      temperatur_max=temperatur
    End If

    temp_c=temperatur*temperatur_max/45

  End If


End Function


Function wetter_change()

  If gewitter=0 Then
    If Rand(0,100)<13 Then
      gewitter=1
    End If
  Else
    If Rand(0,100)<13 Then
      gewitter=0
    End If
  End If


  If rain=0 Then
    If Rand(0,100)<9 Then
      rain_start()
    End If
  Else
    If Rand(0,100)<15 Then
      gewitter=0
    End If
    If Rand(0,100)<9 Then
      rain_stop()
    End If
  End If

  If Rand(0,100)<25 Then
    StopChannel(ch_wind)
    wind:+Rand(-1,1)
    wind_align:+Rand(-1,1)
    If wind_align>7 Then wind_align=0
    If wind_align<0 Then wind_align=7
    If wind<0 Then wind=0
    If wind>1 Then wind=1
    If wind>0 Then wind_play()
  End If

End Function




Function wind_play()

        Select wind
          'Case 1 PlaySound(snd_wind2,ch_wind)
          'Case 2 PlaySound(snd_wind1,ch_wind)
          Case 1 PlaySound(snd_wind_123,ch_wind)
          'Case 2 PlaySound(snd_wind_1234,ch_wind)

          'Case 2 PlaySound(snd_wind3,ch_wind)
          'Case 3 PlaySound(snd_wind12,ch_wind)
          'Case 4 PlaySound(snd_wind11,ch_wind)
          'Case 5 PlaySound(snd_wind5,ch_wind)
          'Case 6 PlaySound(snd_wind6,ch_wind)
          'Case 7 PlaySound(snd_sturm1,ch_wind)
          'Case 8 PlaySound(snd_sturm3,ch_wind)
          'Case 9 PlaySound(snd_sturm2,ch_wind)
       End Select
  
End Function





Function wetter_draw()

SetColor 255,255,255
DrawRect wetter_x,wetter_y,150,60
SetColor 0,0,0
DrawText temperatur+"/"+temperatur_max+" "+temp_c+"°C ",wetter_x+10,wetter_y+10
DrawText wind+" "+wind_align+" "+rain+" "+gewitter,wetter_x+10,wetter_y+30
SetColor 255,255,255
End Function









Global ambient_t
Global ambient_s=5000


Function ambient_play()


  If MilliSecs()>ambient_t+ambient_s Then
  ambient_t=MilliSecs()


  If rain=0 And wind<4 Then
  If stunden<4 Or stunden>21 Then

    If Rand(0,100)<5 Then
      Select Rand(0,5)
        Case 0 PlaySound(snd_owl1,ch_ambient)
        Case 1 PlaySound(snd_owl2,ch_ambient)
        Case 2 PlaySound(snd_owl3,ch_ambient)
        Case 3 PlaySound(snd_nightbird1,ch_ambient)
        Case 4 PlaySound(snd_nightbird3,ch_ambient)
        Case 5 PlaySound(snd_tf1,ch_ambient)

      End Select
    End If

    If Rand(0,100)<35 Then PlaySound(snd_cricket,ch_ambient)
    If Rand(0,100)<15 Then PlaySound(snd_cricket1,ch_ambient)
    If Rand(0,100)<5 Then PlaySound(snd_cricket2,ch_ambient)

  Else

    If Rand(0,100)<5 Then
      Select Rand(0,9)
        Case 0 PlaySound(snd_crow2,ch_ambient)
        Case 1 PlaySound(snd_crow3,ch_ambient)
        Case 2 PlaySound(snd_crow_fly,ch_ambient)
        Case 0 PlaySound(snd_tf2,ch_ambient)
        Case 1 PlaySound(snd_tf3,ch_ambient)
        Case 2 PlaySound(snd_tf4,ch_ambient)
        Case 3 PlaySound(snd_tf6,ch_ambient)
        Case 4 PlaySound(snd_tf7,ch_ambient)
        Case 5 PlaySound(snd_tf8,ch_ambient)
        Case 6 PlaySound(snd_jungle1,ch_ambient)
        Case 7 PlaySound(snd_jungle2,ch_ambient)
        Case 8 PlaySound(snd_jungle3,ch_ambient)
        Case 9 PlaySound(snd_jungle4,ch_ambient)

      End Select
    End If

  End If
  End If


     If gewitter>0 Then
       If Rand(0,100)<15 Then
            Select Rand(0,3)
              Case 0 PlaySound(snd_thunder1,ch_ambient)
              Case 1 PlaySound(snd_thunder2,ch_ambient)
              Case 2 PlaySound(snd_thunder3,ch_ambient)
              Case 3 PlaySound(snd_thunder4,ch_ambient)
            End Select
        End If
      End If



  End If


End Function