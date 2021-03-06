
Global img_laptop:TImage=LoadImage("gfx/laptop/laptop.png")
MidHandleImage(img_laptop)

Global img_logo:TImage=LoadImage("gfx/laptop/logo.png")
MidHandleImage(img_logo)



Global img_ordner:TImage=LoadImage("gfx/laptop/ordner.png")
MidHandleImage(img_ordner)


Global laptop_first_run=1
Global laptop_user_player_init=0
Global laptop_user_player_index

Global laptop_user_page=0
Global laptop_user_page_max=4

Global laptop_inputfield=0

Global laptop_user_extra_cash=0
Global laptop_user_extra_cash_mult=100
Global laptop_user_points_left=0
Global laptop_user_points_min=250
Global laptop_user_points_mid=500
Global laptop_user_points_max=1000
Global laptop_user_points_max_abs=1000
Global laptop_user_points_lvl_max=100



Global laptop_start
Global laptop_start_t
Global laptop_start_s=10
Global laptop_load

Global laptop_window=0

Global laptop_ordner_dx=80
Global laptop_ordner_dy=80


Global laptop_ordner_x
Global laptop_ordner_y



Global laptop_ordner:String[8,7]
Global laptop_ordner_s:String[8,7]

  laptop_ordner[0,0]=1
  laptop_ordner_s[0,0]="Dokumente"

  laptop_ordner[1,0]=1
  laptop_ordner_s[1,0]="Fotos"

  laptop_ordner[2,0]=1
  laptop_ordner_s[2,0]="FKK"

  laptop_ordner[0,1]=1
  laptop_ordner_s[0,1]="Geburtstag"


Global img_window_s:TImage=LoadImage("gfx/laptop/window_s.png")
MidHandleImage(img_window_s)

Global img_window_l:TImage=LoadImage("gfx/laptop/window_l.png")


Global img_button:TImage=LoadImage("gfx/laptop/button.png")
Global img_button_mid:TImage=LoadImage("gfx/laptop/button_mid.png")
Global img_button_small:TImage=LoadImage("gfx/laptop/button_small.png")
Global img_button_mini:TImage=LoadImage("gfx/laptop/button_mini.png")


Global img_pause:TImage=LoadImage("gfx/laptop/pause.png")
Global img_play:TImage=LoadImage("gfx/laptop/play.png")
Global img_fast:TImage=LoadImage("gfx/laptop/fast.png")

Global img_button_cb:TImage=LoadImage("gfx/laptop/button_cb.png")
Global img_button_cbchecked:TImage=LoadImage("gfx/laptop/button_cbchecked.png")

Global img_input:TImage=LoadImage("gfx/laptop/input.png")

Global img_button_left:TImage=LoadImage("gfx/laptop/button_left.png")
Global img_button_right:TImage=LoadImage("gfx/laptop/button_right.png")
Global img_button_left_dbl:TImage=LoadImage("gfx/laptop/button_left_dbl.png")
Global img_button_right_dbl:TImage=LoadImage("gfx/laptop/button_right_dbl.png")

Global img_button_dice:TImage=LoadImage("gfx/laptop/button_wuerfel.png")

Global laptop_x1=wx/2-440
Global laptop_y1=wy/2-320


Const buttons_max=9

Global button_vx=3

Global laptop_menu
Global laptop_on=1


Const c_m_main=0
Const c_m_gps=1
Const c_m_truppverwaltung=2

Const c_m_off=100

Function laptop_get_start()

	time_mod=0
	laptop_on=1
	laptop_load=0
	laptop_menu=c_m_main

End Function





Function laptop_data_save()


End Function




Function laptop_data_load()


End Function






Function laptop_user_get_attr(a,s:String,x,y)

       DrawText(s,x,y)
       DrawText(a,x+320-TextWidth(a)/2,y)


       'dbl -10

       If a>1 Then
	       If button_draw(img_button_left_dbl,"",x+210,y)=True Then
	         If a>=11 Then
	           laptop_user_points_left:+10
	           a:-10
	         Else
	           If a>1 Then
	             laptop_user_points_left:+a-1
	             a=1
	           End If
	         End If
	         laptop_user_extra_cash=laptop_user_points_left*laptop_user_extra_cash_mult
	       End If
       End If

       'single -1

       If a>1 Then
	       If button_draw(img_button_left,"",x+270,y)=True Then
	         If a>1 Then
	           laptop_user_points_left:+1
	           a:-1
	         End If
	         laptop_user_extra_cash=laptop_user_points_left*laptop_user_extra_cash_mult
	       End If
       End If

       'single +1

       If a<laptop_user_points_lvl_max And laptop_user_points_left>=1 Then
       If button_draw(img_button_right,"",x+350,y)=True Then
         If a<laptop_user_points_lvl_max Then
           laptop_user_points_left:-1
           a:+1
         End If
         laptop_user_extra_cash=laptop_user_points_left*laptop_user_extra_cash_mult
       End If
       End If

       'dbl +10

       If a<laptop_user_points_lvl_max And laptop_user_points_left>=1 Then
       If button_draw(img_button_right_dbl,"",x+390,y)=True Then
         If a<=laptop_user_points_lvl_max-10 Then
           If laptop_user_points_left>=10 Then
             laptop_user_points_left:-10
             a:+10
           Else
             a:+laptop_user_points_left
             laptop_user_points_left=0
           End If
         Else
           If a<laptop_user_points_lvl_max Then
             If laptop_user_points_left>=laptop_user_points_lvl_max-a Then
               laptop_user_points_left:-laptop_user_points_lvl_max-a
               a=laptop_user_points_lvl_max
             Else
               a:+laptop_user_points_left
               laptop_user_points_left=0
             End If

           End If
         End If
         laptop_user_extra_cash=laptop_user_points_left*laptop_user_extra_cash_mult
       End If
       End If

  Return a

End Function


Function laptop_user_init()

  If laptop_start=1 Then

   'custom main player

   'alte daten laden

   If laptop_user_player_init=0 Then
     laptop_user_player_index=player_new()
     player_main[laptop_user_player_index]=1
     player_clear_data(laptop_user_player_index)
     laptop_user_page=0
     laptop_user_points_max=laptop_user_points_max_abs
     laptop_user_points_left=laptop_user_points_mid
     laptop_user_extra_cash=laptop_user_points_left*laptop_user_extra_cash_mult
     laptop_user_player_init=1
   End If

   SetColor(255,255,255)

   DrawImage(img_laptop,wx/2,wy/2)


   DrawText(strings[t_benutzerinit],laptop_x1+30,laptop_y1+10)
   DrawText(strings[t_schritt],laptop_x1+820-TextWidth(strings[t_schritt]),laptop_y1+10)
   DrawText((laptop_user_page+1)+"/"+(laptop_user_page_max+1),laptop_x1+830,laptop_y1+10)

   Select laptop_user_page

     Case 0
       'name eingeben
       'geschlecht auswählen
       'händigkeit auswählen
       'bild auswählen
       'stimme auswählen

       DrawText(strings[t_personalisierung],laptop_x1+30,laptop_y1+60)

       DrawText(strings[t_name],laptop_x1+30,laptop_y1+100)
       If button_draw(img_input,player_name[laptop_user_player_index],laptop_x1+170,laptop_y1+95)=True Then
         laptop_inputfield=0
       End If

       DrawText(strings[t_nick],laptop_x1+30,laptop_y1+140)
       If button_draw(img_input,player_nick[laptop_user_player_index],laptop_x1+170,laptop_y1+135)=True Then
         laptop_inputfield=1
       End If

       Select laptop_inputfield
         Case 0
           player_name[laptop_user_player_index]=getc(player_name[laptop_user_player_index],24)
         Case 1
           player_nick[laptop_user_player_index]=getc(player_nick[laptop_user_player_index],8)
       End Select


       DrawText(strings[t_maennlich],laptop_x1+30,laptop_y1+180)
       If player_sex[laptop_user_player_index]=0 Then
         If button_draw(img_button_cbchecked,"",laptop_x1+170,laptop_y1+180)=True Then
           player_sex[laptop_user_player_index]=1
         End If
       Else
         If button_draw(img_button_cb,"",laptop_x1+170,laptop_y1+180)=True Then
           player_sex[laptop_user_player_index]=0
         End If
       End If

       DrawText(strings[t_weiblich],laptop_x1+30,laptop_y1+220)
       If player_sex[laptop_user_player_index]=1 Then
         If button_draw(img_button_cbchecked,"",laptop_x1+170,laptop_y1+220)=True Then
           player_sex[laptop_user_player_index]=0
         End If
       Else
         If button_draw(img_button_cb,"",laptop_x1+170,laptop_y1+220)=True Then
           player_sex[laptop_user_player_index]=1
         End If
       End If


       DrawText(strings[t_haendigkeit],laptop_x1+30,laptop_y1+260)
       Select player_handed[laptop_user_player_index]

         Case player_righthand
           DrawText(strings[t_righthand],laptop_x1+250-TextWidth(strings[t_righthand])/2,laptop_y1+260)
         Case player_lefthand
           DrawText(strings[t_lefthand],laptop_x1+250-TextWidth(strings[t_lefthand])/2,laptop_y1+260)
         Case player_dualhand
           DrawText(strings[t_dualhand],laptop_x1+250-TextWidth(strings[t_dualhand])/2,laptop_y1+260)

       End Select


       If button_draw(img_button_left,"",laptop_x1+170,laptop_y1+260)=True Then
         If player_handed[laptop_user_player_index]>0 Then
           player_handed[laptop_user_player_index]:-1
         End If
       End If

       If button_draw(img_button_right,"",laptop_x1+310,laptop_y1+260)=True Then
         If player_handed[laptop_user_player_index]<2 Then
           player_handed[laptop_user_player_index]:+1
         End If
       End If






       If soldier_custom_img[player_soldier[laptop_user_player_index],player_sex[laptop_user_player_index]] <> Null Then
         DrawImage(soldier_custom_img[player_soldier[laptop_user_player_index],player_sex[laptop_user_player_index]],laptop_x1+630,laptop_y1+110)
       Else

         player_soldier[laptop_user_player_index]=0

         While soldier_custom_img[player_soldier[laptop_user_player_index],player_sex[laptop_user_player_index]] = Null And player_soldier[laptop_user_player_index] < soldier_max-1
           player_soldier[laptop_user_player_index]:+1
         Wend

       End If

       If button_draw(img_button_left,"",laptop_x1+580,laptop_y1+120)=True Then
         player_soldier[laptop_user_player_index]:-1
         If player_soldier[laptop_user_player_index]<0 Then
           player_soldier[laptop_user_player_index]=soldier_max-1
         End If
         While soldier_custom_img[player_soldier[laptop_user_player_index],player_sex[laptop_user_player_index]] = Null And player_soldier[laptop_user_player_index] > 0
           player_soldier[laptop_user_player_index]:-1
         Wend
       End If

       If button_draw(img_button_right,"",laptop_x1+700,laptop_y1+120)=True Then
         player_soldier[laptop_user_player_index]:+1
         If player_soldier[laptop_user_player_index]>soldier_max-1 Then
           player_soldier[laptop_user_player_index]=0
         End If
         While soldier_custom_img[player_soldier[laptop_user_player_index],player_sex[laptop_user_player_index]] = Null And player_soldier[laptop_user_player_index] < soldier_max-1
           player_soldier[laptop_user_player_index]:+1
         Wend
       End If







     Case 1

       'attribute über buttons erhöhen

       DrawText(strings[t_attribute],laptop_x1+30,laptop_y1+60)

       'vefügbare punkte

       DrawText(strings[t_punkte],laptop_x1+30,laptop_y1+100)
       DrawText(laptop_user_points_left,laptop_x1+350-TextWidth(laptop_user_points_left)/2,laptop_y1+100)
       DrawText(strings[t_extracash],laptop_x1+550,laptop_y1+100)
       DrawText("+"+laptop_user_extra_cash+"€",laptop_x1+670-TextWidth(laptop_user_points_left)/2,laptop_y1+100)

       If button_draw(img_button_dice,"",laptop_x1+750,laptop_y1+75)=True Then

         player_attribute[laptop_user_player_index,c_gesundheit]=1
         player_attribute[laptop_user_player_index,c_geschicklichkeit]=1
         player_attribute[laptop_user_player_index,c_beweglichkeit]=1
         player_attribute[laptop_user_player_index,c_reflexe]=1
         player_attribute[laptop_user_player_index,c_staerke]=1
         player_attribute[laptop_user_player_index,c_ausdauer]=1
         player_attribute[laptop_user_player_index,c_weisheit]=1
         player_attribute[laptop_user_player_index,c_erfahrung]=1
         player_attribute[laptop_user_player_index,c_glueck]=1
         player_attribute[laptop_user_player_index,c_charisma]=1

         player_fertigkeiten[laptop_user_player_index,c_treffsicherheit]=1
         player_fertigkeiten[laptop_user_player_index,c_schwimmen]=1
         player_fertigkeiten[laptop_user_player_index,c_fuehrung]=1
         player_fertigkeiten[laptop_user_player_index,c_scouting]=1
         player_fertigkeiten[laptop_user_player_index,c_jagen]=1
         player_fertigkeiten[laptop_user_player_index,c_fischen]=1
         player_fertigkeiten[laptop_user_player_index,c_kochen]=1
         player_fertigkeiten[laptop_user_player_index,c_bogenschiessen]=1

         player_wissen[laptop_user_player_index,c_allgemeinwissen]=1
         player_wissen[laptop_user_player_index,c_medizin]=1
         player_wissen[laptop_user_player_index,c_botanik]=1
         player_wissen[laptop_user_player_index,c_sprachen]=1
         player_wissen[laptop_user_player_index,c_technik]=1
         player_wissen[laptop_user_player_index,c_mathematik]=1
         player_wissen[laptop_user_player_index,c_physik]=1
         player_wissen[laptop_user_player_index,c_chemie]=1
         player_wissen[laptop_user_player_index,c_sprengstoffe]=1
         player_wissen[laptop_user_player_index,c_survivallism]=1
         player_wissen[laptop_user_player_index,c_waffen]=1


         laptop_user_points_left=Rand(laptop_user_points_min,laptop_user_points_max)
         laptop_user_extra_cash=laptop_user_points_left*laptop_user_extra_cash_mult
         If laptop_user_points_max>laptop_user_points_mid Then
           laptop_user_points_max:-1
         End If

       End If

       DrawText(strings[t_punkte],laptop_x1+30,laptop_y1+100)
       DrawText(laptop_user_points_left,laptop_x1+350-TextWidth(laptop_user_points_left)/2,laptop_y1+100)
       DrawText(strings[t_extracash],laptop_x1+550,laptop_y1+100)
       DrawText("+"+laptop_user_extra_cash+"€",laptop_x1+670-TextWidth(laptop_user_points_left)/2,laptop_y1+100)

       player_attribute[laptop_user_player_index,c_gesundheit]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_gesundheit],strings[t_gesundheit],laptop_x1+30,laptop_y1+140)
       player_attribute[laptop_user_player_index,c_geschicklichkeit]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_geschicklichkeit],strings[t_geschicklichkeit],laptop_x1+30,laptop_y1+180)
       player_attribute[laptop_user_player_index,c_beweglichkeit]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_beweglichkeit],strings[t_beweglichkeit],laptop_x1+30,laptop_y1+220)
       player_attribute[laptop_user_player_index,c_reflexe]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_reflexe],strings[t_reflexe],laptop_x1+30,laptop_y1+260)
       player_attribute[laptop_user_player_index,c_staerke]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_staerke],strings[t_staerke],laptop_x1+30,laptop_y1+300)
       player_attribute[laptop_user_player_index,c_ausdauer]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_ausdauer],strings[t_ausdauer],laptop_x1+30,laptop_y1+340)
       player_attribute[laptop_user_player_index,c_weisheit]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_weisheit],strings[t_weisheit],laptop_x1+30,laptop_y1+380)
       player_attribute[laptop_user_player_index,c_erfahrung]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_erfahrung],strings[t_erfahrung],laptop_x1+30,laptop_y1+420)
       player_attribute[laptop_user_player_index,c_glueck]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_glueck],strings[t_glueck],laptop_x1+30,laptop_y1+460)
       player_attribute[laptop_user_player_index,c_charisma]=laptop_user_get_attr(player_attribute[laptop_user_player_index,c_charisma],strings[t_charisma],laptop_x1+30,laptop_y1+500)

     Case 2

       DrawText(strings[t_fertigkeiten],laptop_x1+30,laptop_y1+60)

       DrawText(strings[t_punkte],laptop_x1+30,laptop_y1+100)
       DrawText(laptop_user_points_left,laptop_x1+350-TextWidth(laptop_user_points_left)/2,laptop_y1+100)
       DrawText(strings[t_extracash],laptop_x1+550,laptop_y1+100)
       DrawText("+"+laptop_user_extra_cash+"€",laptop_x1+670-TextWidth(laptop_user_points_left)/2,laptop_y1+100)

       'fertigkeiten über buttons erhöhen

         player_fertigkeiten[laptop_user_player_index,c_treffsicherheit]=laptop_user_get_attr(player_fertigkeiten[laptop_user_player_index,c_treffsicherheit],strings[t_treffsicherheit],laptop_x1+30,laptop_y1+140)
         player_fertigkeiten[laptop_user_player_index,c_schwimmen]=laptop_user_get_attr(player_fertigkeiten[laptop_user_player_index,c_schwimmen],strings[t_schwimmen],laptop_x1+30,laptop_y1+180)
         player_fertigkeiten[laptop_user_player_index,c_fuehrung]=laptop_user_get_attr(player_fertigkeiten[laptop_user_player_index,c_fuehrung],strings[t_fuehrung],laptop_x1+30,laptop_y1+220)
         player_fertigkeiten[laptop_user_player_index,c_scouting]=laptop_user_get_attr(player_fertigkeiten[laptop_user_player_index,c_scouting],strings[t_scouting],laptop_x1+30,laptop_y1+260)
         player_fertigkeiten[laptop_user_player_index,c_jagen]=laptop_user_get_attr(player_fertigkeiten[laptop_user_player_index,c_jagen],strings[t_jagen],laptop_x1+30,laptop_y1+300)
         player_fertigkeiten[laptop_user_player_index,c_fischen]=laptop_user_get_attr(player_fertigkeiten[laptop_user_player_index,c_fischen],strings[t_fischen],laptop_x1+30,laptop_y1+340)
         player_fertigkeiten[laptop_user_player_index,c_kochen]=laptop_user_get_attr(player_fertigkeiten[laptop_user_player_index,c_kochen],strings[t_kochen],laptop_x1+30,laptop_y1+380)
         player_fertigkeiten[laptop_user_player_index,c_bogenschiessen]=laptop_user_get_attr(player_fertigkeiten[laptop_user_player_index,c_bogenschiessen],strings[t_bogenschiessen],laptop_x1+30,laptop_y1+420)

     Case 3

       DrawText(strings[t_wissen],laptop_x1+30,laptop_y1+60)

       DrawText(strings[t_punkte],laptop_x1+30,laptop_y1+100)
       DrawText(laptop_user_points_left,laptop_x1+350-TextWidth(laptop_user_points_left)/2,laptop_y1+100)
       DrawText(strings[t_extracash],laptop_x1+550,laptop_y1+100)
       DrawText("+"+laptop_user_extra_cash+"€",laptop_x1+670-TextWidth(laptop_user_points_left)/2,laptop_y1+100)

       'wissen über buttons erhöhen

         player_wissen[laptop_user_player_index,c_allgemeinwissen]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_allgemeinwissen],strings[t_allgemeinwissen],laptop_x1+30,laptop_y1+140)
         player_wissen[laptop_user_player_index,c_medizin]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_medizin],strings[t_medizin],laptop_x1+30,laptop_y1+180)
         player_wissen[laptop_user_player_index,c_botanik]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_botanik],strings[t_botanik],laptop_x1+30,laptop_y1+220)
         player_wissen[laptop_user_player_index,c_sprachen]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_sprachen],strings[t_sprachen],laptop_x1+30,laptop_y1+260)
         player_wissen[laptop_user_player_index,c_technik]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_technik],strings[t_technik],laptop_x1+30,laptop_y1+300)
         player_wissen[laptop_user_player_index,c_mathematik]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_mathematik],strings[t_mathematik],laptop_x1+30,laptop_y1+340)
         player_wissen[laptop_user_player_index,c_physik]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_physik],strings[t_physik],laptop_x1+30,laptop_y1+380)
         player_wissen[laptop_user_player_index,c_chemie]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_chemie],strings[t_chemie],laptop_x1+30,laptop_y1+420)
         player_wissen[laptop_user_player_index,c_sprengstoffe]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_sprengstoffe],strings[t_sprengstoffe],laptop_x1+30,laptop_y1+460)
         player_wissen[laptop_user_player_index,c_survivallism]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_survivallism],strings[t_survivallism],laptop_x1+30,laptop_y1+500)
         player_wissen[laptop_user_player_index,c_waffen]=laptop_user_get_attr(player_wissen[laptop_user_player_index,c_waffen],strings[t_waffen],laptop_x1+30,laptop_y1+540)

     Case 4

       DrawText(strings[t_eigenschaften],laptop_x1+30,laptop_y1+60)

       DrawText(strings[t_punkte],laptop_x1+30,laptop_y1+100)
       DrawText(laptop_user_points_left,laptop_x1+350-TextWidth(laptop_user_points_left)/2,laptop_y1+100)
       DrawText(strings[t_extracash],laptop_x1+550,laptop_y1+100)
       DrawText("+"+laptop_user_extra_cash+"€",laptop_x1+670-TextWidth(laptop_user_points_left)/2,laptop_y1+100)

       'eigenschaften aus liste auswählen

       DrawText(strings[t_ausgwaehlt]+" ("+player_eigenschaften_selected[laptop_user_player_index]+")",laptop_x1+30,laptop_y1+140)
       DrawText(strings[t_verfuegbar]+" ("+(player_eigenschaften_selected_max-player_eigenschaften_selected[laptop_user_player_index])+")",laptop_x1+240,laptop_y1+140)

       Local i=0
       Local k=0
       Local j=0
       Local l=0

       For i=0 To player_eigenschaften_max-1

         If player_eigenschaften[laptop_user_player_index,i]=1 Then

           If button_draw(img_button,strings[player_eigenschaften_strings[i]],laptop_x1+30,laptop_y1+180+l*40)=True Then

             player_eigenschaften[laptop_user_player_index,i]=0
             player_eigenschaften_selected[laptop_user_player_index]:-1

             laptop_user_points_left:-player_eigenschaften_costvalue[i]
             laptop_user_extra_cash=laptop_user_points_left*laptop_user_extra_cash_mult

           End If

           l:+1

         End If

       Next



       j=0
       l=0

       If player_eigenschaften_selected[laptop_user_player_index] < player_eigenschaften_selected_max Then

      	 For i=0 To player_eigenschaften_max-1

	         If player_eigenschaften[laptop_user_player_index,i]=0 Then
	
	           Local f=False
	
	           For k=0 To player_eigenschaften_max-1
	
	             If player_eigenschaften_disablevalue[i,k]=1 And player_eigenschaften[laptop_user_player_index,k]=1 Then
	               f=True
	             End If
	
	           Next
	
	           If f=False Then

               If laptop_user_points_left>=-player_eigenschaften_costvalue[i] Then
	
  	             If button_draw(img_button_mid,strings[player_eigenschaften_strings[i]],laptop_x1+240+j*160,laptop_y1+180+l*30)=True Then
		
		               player_eigenschaften[laptop_user_player_index,i]=1
		               player_eigenschaften_selected[laptop_user_player_index]:+1
		
		               laptop_user_points_left:+player_eigenschaften_costvalue[i]
	                 laptop_user_extra_cash=laptop_user_points_left*laptop_user_extra_cash_mult
	
		             End If
		
	             Else
	
	               button_draw(img_button_mid,strings[player_eigenschaften_strings[i]],laptop_x1+240+j*160,laptop_y1+180+l*30,155,155,155,155,155,155)
	
	             End If
	
		           j:+1
	             If j>3 Then
	               l:+1
	               j=0
	             End If
	
	           End If
	
	         End If
	
	       Next

       End If

   End Select


       If laptop_user_page=0 Then
         DrawText(strings[t_hauptmenu],laptop_x1+50,laptop_y1+600)
       Else
         DrawText(strings[t_zurueck],laptop_x1+50,laptop_y1+600)
       End If

       If button_draw(img_button_left,"",laptop_x1+20,laptop_y1+600)=True Then
         If laptop_user_page=0 Then
           menu=c_menu_main
         Else
           laptop_user_page:-1
         End If
       End If

       If laptop_user_page=laptop_user_page_max Then
         DrawText(strings[t_abschliessen],laptop_x1+830-TextWidth(strings[t_abschliessen]),laptop_y1+600)
       Else
         DrawText(strings[t_weiter],laptop_x1+830-TextWidth(strings[t_weiter]),laptop_y1+600)
       End If

       If button_draw(img_button_right,"",laptop_x1+840,laptop_y1+600)=True Then
         If laptop_user_page=laptop_user_page_max Then

           laptop_first_run=0

           Local g=group_new(0,0,fraction_player)
           Local f=False
           While f=False
	           group_map_x[g]=Rand(0,map_x-1)
	           group_map_y[g]=Rand(0,map_y-1)
             If map_height[group_map_x[g],group_map_y[g]]>5 Then f=True
          Wend

          world_map_x=group_map_x[g]
          world_map_y=group_map_y[g]

          group_add_player(g,laptop_user_player_index)
          player_add_custom_equip(laptop_user_player_index)

          laptop_user_page:+1

         Else
           laptop_user_page:+1
         End If
       End If


  End If

End Function





Function laptop_init()

If laptop_start=0 Then

  If MilliSecs()>laptop_start_t+laptop_start_s Then
    laptop_start_t=MilliSecs()

    laptop_load:+1
    If laptop_load>=100 Then 
      laptop_start=1
      FlushMouse
    End If
  End If

  SetColor(255,255,255)
  DrawImage(img_laptop,wx/2,wy/2)
  DrawImage(img_logo,wx/2,wy/2)
  DrawText("Loading",wx/2-TextWidth("Loading"),laptop_y1+640-60)
  DrawRect(laptop_x1,laptop_y1+640-35,laptop_load*880/100,20)

End If

End Function




Function laptop_do()

  If laptop_on=1 Then

  laptop_init()

  laptop_user_init()


  If laptop_start=1 And laptop_first_run=0 Then

    laptop_draw()
    world_save()

	  Select laptop_menu
	
	    Case c_m_main
		
		      If button_draw(img_button,strings[t_gps],laptop_x1+5,laptop_y1)=True Then
					  laptop_menu=c_m_gps
			      map_center()		
		      End If
		
		      If button_draw(img_button,strings[t_truppverwaltung],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button)))=True Then
	        	laptop_menu=c_m_truppverwaltung
		
		      End If
				
		      If button_draw(img_button,strings[t_soeldner_akte],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*2)=True Then
		
		
		      End If
		
		      If button_draw(img_button,strings[t_web],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*3)=True Then
		
		
		      End If
		
		      If button_draw(img_button,strings[t_email],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*4)=True Then
		
		
		      End If		

		      If button_draw(img_button,strings[t_finanzen],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*5)=True Then
		
		
		      End If	

		      If button_draw(img_button,strings[t_logbuch],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*6)=True Then
		
		
		      End If	
		
		      If button_draw(img_button,strings[t_archiv],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*7)=True Then
		
		
		      End If	
		
		      If button_draw(img_button,strings[t_daten],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*8)=True Then
		
		
		      End If	
		
			
			
	
	    Case c_m_gps


          Local i
          Local s:String

					For Local k=0 To group_max-1
					
					  If group[k]=1 And group_fraction[k]=fraction_player Then
					
					    s=strings[t_trupp]+" "+i
					
					    If k=group_selected Then
					      SetColor(200,200,200)
					    Else
							  SetColor(255,255,255)
							End If
							
							If button_draw(img_button,s,laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*i)=True Then
					      group_selected=k
					      map_center()
        				group_reset_new_way()
  						End If					

					    i:+1
					  End If
					
					Next


					If button_draw(img_button,strings[t_stoppen],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*(i+1))=True Then
			      group_stop(group_selected)
  		    End If

					If button_draw(img_button,strings[t_schliessen],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*(i+2))=True Then
			      laptop_menu=c_m_main
  		    End If

			
	      map_aktion_do()
	      map_draw_topografic()
	
				map_mouseover()
	
	      SetColor(255,255,255)
	      For Local k=0 To 16
	        Local s:String
	        DrawImage(img_map_height[16-k],laptop_x1+880-120,laptop_y1+640-16*(16+3)-95+k*(16+3))
	        Select 16-k
	          Case 0 s="-3000"
	          Case 1 s="-2000"
            Case 2 s="-1500"
	          Case 3 s="-1000"
	          Case 4 s="-500"
	          Case 5 s="-100"
	          Case 6 s="0"
	          Case 7 s="100"
	          Case 8 s="250"
	          Case 9 s="500"
            Case 10 s="750"
	          Case 11 s="1000"
	          Case 12 s="1250"
	          Case 13 s="1500"
	          Case 14 s="1750"
	          Case 15 s="2000"
	          Case 16	s="3000"
	        End Select
	        DrawText(s+" m",laptop_x1+880-90,laptop_y1+640-16*(16+3)-95+k*(16+3))
	      Next
	
	
	    Case c_m_truppverwaltung
				


          Local i
          Local s:String

					For Local k=0 To group_max-1
					
					  If group[k]=1 And group_fraction[k]=0 Then
					
					    s=strings[t_trupp]+" "+i
					
					    If k=group_selected Then
					      SetColor(200,200,200)
					    Else
							  SetColor(255,255,255)
							End If
							
							If button_draw(img_button,s,laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*i)=True Then
					      group_selected=k
					    End If							
														
					    i:+1
					  End If
					
					Next


					If button_draw(img_button,strings[t_schliessen],laptop_x1+5,laptop_y1+(button_vx+ImageHeight(img_button))*i+1)=True Then
			      laptop_menu=c_m_main
  		    End If
					
				

					For i=0 To group_player_max-1
					
					  If group_player[group_selected,i]>0 Then
					
					    SetColor(255,255,255)
															
					    If group_player_role[group_selected,i]>0 Then
					
						    Select group_player_role[group_selected,i]
							    Case c_leader
		                s=strings[t_leader]
		              Case c_scout
		                s=strings[t_scout]
		              Case c_sani
		                s=strings[t_sani]
		              Case c_mech
		                s=strings[t_mech]
	              End Select
	
				        DrawText(s,laptop_x1+250+i*120-TextWidth(s)/2,laptop_y1)
				
			        End If
			
						  If player_main[group_player_index[group_selected,i]]=1 Then
						    DrawImage(soldier_custom_img[player_soldier[group_player_index[group_selected,i]],player_sex[group_player_index[group_selected,i]]],laptop_x1+250+i*120-ImageWidth(soldier_custom_img[player_soldier[group_player_index[group_selected,i]],player_sex[group_player_index[group_selected,i]]])/2,laptop_y1+20)

						  Else
						    DrawImage(soldier_img[player_soldier[group_player_index[group_selected,i]]],laptop_x1+250+i*120-ImageWidth(soldier_img[player_soldier[group_player_index[group_selected,i]]])/2,laptop_y1+20)
						  End If

              'einem trupp zuweisen
						
						  If button_draw(img_button_small,strings[t_neuer_Trupp],laptop_x1+250+i*120-ImageWidth(img_button_small)/2,laptop_y1+90)=True Then
						
                Local g=group_new(group_map_x[group_selected],group_map_y[group_selected],0)
                If g>=0 Then
                  If group_add_player(g,group_player_index[group_selected,i])=1 Then
                    group_del_player(group_selected,i)
                  End If
                End If
		
		          End If
		
	
							Local j
							Local l
							
	            For Local k=0 To group_max-1
	
	              If group[k]=1 And group_fraction[k]=0 Then
	
		              If k <> group_selected And group_map_x[group_selected] = group_map_x[k] And group_map_y[group_selected] = group_map_y[k] Then
	
	                  If button_draw(img_button_small,strings[t_trupp]+" "+l,laptop_x1+250+i*120-ImageWidth(img_button_small)/2,laptop_y1+110+j*20)=True Then
	
	                    If group_add_player(k,group_player_index[group_selected,i])=1 Then
	                      group_del_player(group_selected,i)
	                    End If

                    End If

										j:+1
										
		              End If
				
				          l:+1
				
		            End If
	
		
	            Next

              'rollen

              SetColor(255,255,255)

              s=strings[t_gruppenrolle]
			        DrawText(s,laptop_x1+250+i*120-TextWidth(s)/2,laptop_y1+110+20*j+20)


              If button_draw(img_button_small,strings[t_keine],laptop_x1+250+i*120-ImageWidth(img_button_small)/2,laptop_y1+110+j*20+40)=True Then
								group_player_role[group_selected,i]=0
	            End If

              If button_draw(img_button_small,strings[t_leader],laptop_x1+250+i*120-ImageWidth(img_button_small)/2,laptop_y1+110+j*20+60)=True Then
								For Local p=0 To group_player_max-1
								  If group_player_role[group_selected,p]=c_leader Then group_player_role[group_selected,p]=0
								Next
								group_player_role[group_selected,i]=c_leader
								group_leader[group_selected]=player_attribute[group_player_index[group_selected,i],c_fuehrung]
              End If

              If button_draw(img_button_small,strings[t_scout],laptop_x1+250+i*120-ImageWidth(img_button_small)/2,laptop_y1+110+j*20+80)=True Then
								For Local p=0 To group_player_max-1
									If group_player_role[group_selected,p]=c_scout Then group_player_role[group_selected,p]=0
								Next
								group_player_role[group_selected,i]=c_scout
								group_scout[group_selected]=player_attribute[group_player_index[group_selected,i],c_scouting]+50*player_eigenschaften[group_player_index[group_selected,i],c_pfadfinder]
		          End If
		
              If button_draw(img_button_small,strings[t_sani],laptop_x1+250+i*120-ImageWidth(img_button_small)/2,laptop_y1+110+j*20+100)=True Then
                For Local p=0 To group_player_max-1
                  If group_player_role[group_selected,p]=c_sani Then group_player_role[group_selected,p]=0
                Next
								group_player_role[group_selected,i]=c_sani
		          End If

              If button_draw(img_button_small,strings[t_mech],laptop_x1+250+i*120-ImageWidth(img_button_small)/2,laptop_y1+110+j*20+120)=True Then
								For Local p=0 To group_player_max-1
									If group_player_role[group_selected,p]=c_mech Then group_player_role[group_selected,p]=0
								Next
								group_player_role[group_selected,i]=c_mech
							End If
		

            End If

					Next				
	
	    Case c_m_off
	
	      laptop_on=0
	      laptop_start=0
	
      	time_mod=1
	
	      world_map_x=group_map_x[group_selected]
	      world_map_y=group_map_y[group_selected]
	
	      world_load()
        
        group_pos_in_world(group_selected)

       	menu=c_menu_world

        FlushMouse

	  End Select
	
	  End If

  End If

End Function




Function ordner_draw()

  If laptop_menu=0 Then

  For Local i=0 To 7
  For Local k=0 To 6

  If laptop_ordner[i,k]=1 Then

  DrawImage(img_ordner,laptop_x1+880-60-i*laptop_ordner_dx,laptop_y1+25+laptop_ordner_dy*k)
  DrawText(laptop_ordner_s[i,k],laptop_x1+880-60-i*laptop_ordner_dx-TextWidth(laptop_ordner_s[i,k])/2,laptop_y1+25+laptop_ordner_dy*k+25)

  End If

  Next
  Next

  End If

End Function



Function laptop_draw()

  '880 x 640


  SetColor(255,255,255)
  DrawImage(img_laptop,wx/2,wy/2)
  DrawImage(img_logo,wx/2,wy/2)

  ordner_draw()




  SetColor(255,255,255)
  Select laptop_window
    Case 1 DrawImage(img_window_s,wx/2,wy/2)
    Case 2 DrawImage(img_window_l,laptop_x1,laptop_y1)
  End Select


  'footer

  SetColor(127,201,255)
  DrawRect(laptop_x1,laptop_y1+640-45,880,40)


  If button_draw(img_button,strings[t_ausschalten],laptop_x1+5,laptop_y1+640-10-ImageHeight(img_button))=True Then
    laptop_menu=c_m_off
  End If

  SetColor(0,0,0)
  time_draw_short(laptop_x1+880-180,laptop_y1+640-45,100,159,201)

  If button_draw(img_pause,"",laptop_x1+880-220-40*2,laptop_y1+640-40)=True Then
    time_mod=0
  End If

  If button_draw(img_play,"",laptop_x1+880-220-40,laptop_y1+640-40)=True Then
    time_mod=1
  End If

  If button_draw(img_fast,"",laptop_x1+880-220,laptop_y1+640-40)=True Then
    time_mod=100
  End If

End Function


