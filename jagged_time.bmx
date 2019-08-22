
'zeitsystem


Global time_x=wx-200
Global time_y=wy-100

Global timestemp:Long

Global time_t:Int
Global time_s:Short=5000
Global time_mod:Byte=1
Global time_color_r:Byte
Global time_color_g:Byte
Global time_color_b:Byte

Global minuten:Byte
Global stunden:Byte=6

Global daymin:Short=60*Stunden+minuten

Global wtag:Byte=7
Global wtag_n:String[7]
Global tag:Byte=6
Global monday:Byte=0
Global mond:Byte=2
Global monat:Byte=8
Global monat_n:String[12]
Global jahreszeit:Byte
Global jahreszeit_n:String[4]
Global jahr:Short=2017

wtag_n[0]="Montag"
wtag_n[1]="Dienstag"
wtag_n[2]="Mittwoch"
wtag_n[3]="Donnerstag"
wtag_n[4]="Freitag"
wtag_n[5]="Samstag"
wtag_n[6]="Sonntag"

monat_n[0]="Januar"
monat_n[1]="Februar"
monat_n[2]="März"
monat_n[3]="April"
monat_n[4]="Mai"
monat_n[5]="Juni"
monat_n[6]="Juli"
monat_n[7]="August"
monat_n[8]="September"
monat_n[9]="Oktober"
monat_n[10]="November"
monat_n[11]="Dezember"

jahreszeit_n[0]="Frühling"
jahreszeit_n[1]="Sommer"
jahreszeit_n[2]="Herbst"
jahreszeit_n[3]="Winter"


Global img_mond:TImage[4]
img_mond[0]=LoadImage("gfx/time/neumond.png",0)
img_mond[1]=LoadImage("gfx/time/zunehmendermond.png",0)
img_mond[2]=LoadImage("gfx/time/vollmond.png",0)
img_mond[3]=LoadImage("gfx/time/abnehmendermond.png",0)




Function time_do()

  If time_mod>0 Then

  If now-time_t>(time_s/time_mod) Then

    time_t=now

    timestemp:+1

    minuten:+1
    daymin:+1

    monday:+1

    If daymin=1440 Then
      daymin=0
    End If

    If monday>8 And stunden=12 And minuten=0 Then
      monday=0
      mond=mond+1
      If mond=4 Then
        mond=0
      End If
    End If

    If minuten=60 Then
      minuten=0
      stunden=stunden+1

      If stunden=24 Then
        stunden=0
        tag=tag+1
        wtag=wtag+1
        If wtag=8 Then
          wtag=1
        End If

        If tag=21 Then
          jahreszeit=Ceil(monat/4)
        End If

        If tag=31 Then
          tag=1
          monat=monat+1
          If monat=12 Then
             monat=1
             jahr=jahr+1
          End If
        End If
      End If
    End If


  End If

End If


Local m=2
Local e=1.05
Local x=Abs(daymin-720)
Local y=m*x^e
Local my=m*720^e

Local mondc

Select mond
  Case 0 mondc=0
  Case 1 mondc=50
  Case 2 mondc=100
  Case 3 mondc=50
End Select

    time_color_r=255-255*y/(my)
    time_color_g=255-255*y/(my)
    time_color_b=255-(255-mondc)*y/(my)

    If time_color_r<55 Then time_color_r=55
    If time_color_g<55 Then time_color_g=55
    If time_color_b<55 Then time_color_b=55


    SetClsColor(255-255*y/(my),255-255*y/(my),255-(255-mondc)*y/(my))




End Function








Function time_draw_short(x,y,r=255,g=255,b=255)

SetColor r,g,b

DrawRect x,y,180,40

SetColor 0,0,0

Local s:String
Local s1:String
Local s2:String

If stunden<10 Then s1="0"
If minuten<10 Then s2="0"
s=s1+stunden+":"+s2+minuten

DrawText s,x+90-15,y+10-TextHeight(s)/2

If tag<10 Then s1="0"
If monat<10 Then s2="0"
s=wtag_n[wtag-1]+" "+s1+tag+" "+monat_n[monat-1]+" "+jahr

DrawText s,x+90-TextWidth(s)/2,y+30-TextHeight(s)/2

End Function






Function time_draw()

SetColor 255,255,255

DrawRect time_x,time_y,200,100

SetColor 0,0,0

DrawText timestemp,time_x+20,time_y+10

Local s:String
Local s1:String
Local s2:String

If stunden<10 Then s1="0"
If minuten<10 Then s2="0"
s=s1+stunden+":"+s2+minuten
DrawText s,time_x+20,time_y+30

If tag<10 Then s1="0"
If monat<10 Then s2="0"
s=s1+tag+"."+s2+monat+"."+jahr
DrawText s,time_x+20,time_y+50

DrawText wtag_n[wtag-1]+" "+monat_n[monat-1]+" "+time_color_r+"-"+time_color_g+"-"+time_color_b,time_x+40,time_y+70

SetColor 255,255,255

DrawImage img_mond[mond],time_x+20,time_y+70


End Function
