


Function soldier_copy_data(i,k)

  player[i]=1

  player_soldier[i]=k

	player_color_hair_r[i]=soldier_color_hair_r[k]
	player_color_hair_g[i]=soldier_color_hair_g[k]
	player_color_hair_b[i]=soldier_color_hair_b[k]
	
	player_color_shirt_r[i]=soldier_color_shirt_r[k]
	player_color_shirt_g[i]=soldier_color_shirt_g[k]
	player_color_shirt_b[i]=soldier_color_shirt_b[k]
	
	player_color_skin_r[i]=soldier_color_skin_r[k]
	player_color_skin_g[i]=soldier_color_skin_g[k]
	player_color_skin_b[i]=soldier_color_skin_b[k]
	
	player_color_pants_r[i]=soldier_color_pants_r[k]
	player_color_pants_g[i]=soldier_color_pants_g[k]
	player_color_pants_b[i]=soldier_color_pants_b[k]
	
	
	player_life_max[i]=100
	player_life_lowered[i]=0
	player_life[i]=player_life_max[i]
	player_life_s[i]=60
	
	player_energy_max[i]=500
	player_energy_lowered[i]=0
	player_energy[i]=player_energy_max[i]
	player_energy_s[i]=1

	player_hurt[i]=0
	player_bleeding[i]=0
	player_venomed[i]=0
	player_freeze[i]=0
	player_sick[i]=0

  player_moral[i]=50
	
	player_hunger_max[i]=500
	player_durst_max[i]=250
	player_schlaf_max[i]=1000
	
	player_traglast[i]=100
	
	player_move_s[i]=50
  player_anim_s[i]=100

  player_anim_transition[i]=player_anim_stand
	
	
	For Local l=0 To player_attribute_max-1
		player_attribute[i,l]=soldier_attribute[k,l]
	Next
	
	For Local l=0 To player_fertigkeiten_max-1
		player_fertigkeiten[i,l]=soldier_fertigkeiten[k,l]
	Next
		
	For Local l=0 To player_wissen_max-1
		player_wissen[i,l]=soldier_wissen[k,l]
	Next
	
	For Local l=0 To player_eigenschaften_max-1
		player_eigenschaften[i,l]=soldier_eigenschaften[k,l]
	Next


End Function




Function soldier_custom_load()

	For Local k=0 To sex_max-1
	For Local i=0 To soldier_max-1
	
		Local s:String
		
	  If i<10 Then s="000"+i
	  If i>9 And i<100 Then s="00"+i
	  If i>99 And i<1000 Then s="0"+i
	  If i>999 Then s=i


    Select k
	    Case 0
		    If FileType("gfx/face/custom_m/small/"+s+".png")=1 Then
			    soldier_custom_img[i,k]=LoadImage("gfx/face/custom_m/small/"+s+".png")
	    	End If
		
			Case 1
		    If FileType("gfx/face/custom_w/small/"+s+".png")=1 Then
			    soldier_custom_img[i,k]=LoadImage("gfx/face/custom_w/small/"+s+".png")
		    End If
		
		End Select
		
	  loadbar("Loading Custom Soldiers",i,soldier_max)
		
	Next
	Next
		
End Function






Function soldier_load()


	For Local i=0 To soldier_max-1
	
		Local s:String
		
	  If i<10 Then s="000"+i
	  If i>9 And i<100 Then s="00"+i
	  If i>99 And i<1000 Then s="0"+i
	  If i>999 Then s=i

	
		If FileType("gfx/face/soldier/small/"+s+".png")=1 Then
			soldier_img[i]=LoadImage("gfx/face/soldier/small/"+s+".png")
		End If
		
		If FileType("config/merc/"+s+".txt")=1 Then
			Local file:TStream=ReadFile("config/merc/merc_"+s+".txt")
			
			ReadLine(file)
			soldier_name[i]=ReadLine(file)
			ReadLine(file)
			soldier_nick[i]=ReadLine(file)
			ReadLine(file)
			soldier_desc[i]=ReadLine(file)
			
			ReadLine(file)
			ReadLine(file)			
			soldier_color_hair_r[i]=Int(ReadLine(file))
			soldier_color_hair_g[i]=Int(ReadLine(file))
			soldier_color_hair_b[i]=Int(ReadLine(file))
			ReadLine(file)
			soldier_color_shirt_r[i]=Int(ReadLine(file))
			soldier_color_shirt_g[i]=Int(ReadLine(file))
			soldier_color_shirt_b[i]=Int(ReadLine(file))
			ReadLine(file)
			soldier_color_skin_r[i]=Int(ReadLine(file))
			soldier_color_skin_g[i]=Int(ReadLine(file))
			soldier_color_skin_b[i]=Int(ReadLine(file))
			ReadLine(file)
			soldier_color_pants_r[i]=Int(ReadLine(file))
			soldier_color_pants_g[i]=Int(ReadLine(file))
			soldier_color_pants_b[i]=Int(ReadLine(file))
			
			ReadLine(file)
						
			For Local l=0 To player_attribute_max-1
			  ReadLine(file)
		    soldier_attribute[i,l]=Int(ReadLine(file))
	    Next

      ReadLine(file)

			For Local l=0 To player_fertigkeiten_max-1
			  ReadLine(file)
		    soldier_fertigkeiten[i,l]=Int(ReadLine(file))
	    Next

      ReadLine(file)

			For Local l=0 To player_wissen_max-1
			  ReadLine(file)
		    soldier_wissen[i,l]=Int(ReadLine(file))
	    Next

      ReadLine(file)

			For Local l=0 To player_eigenschaften_max-1
		    soldier_eigenschaften[i,l]=Int(ReadLine(file))
	    Next
			
			CloseFile(file)
      soldier[i]=1

      loadbar("Loading Soldiers",i,soldier_max)

		End If
		
		
	Next


End Function



