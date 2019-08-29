

Function gui_minimap_draw()

  DrawImage img_world_minimap,wx-ImageWidth(img_world_minimap),wy-ImageHeight(img_world_minimap)

End Function


Function gui_maindata_group_draw()

  For Local i=0 To group_player_max-1

    SetColor(255,255,255)

    If group_player[group_selected,i]=1 Then

	    If button_draw(img_main_data,"",gui_main_data_x+i*ImageWidth(img_main_data),gui_main_data_y)=True Then

	      If shift=1 Then

	        If player_selected[group_player_index[group_selected,i]]=1 Then
	          'söldner herrausnehmen
	          player_select_del(player_selected_pos[group_player_index[group_selected,i]])
	        Else
	          'söldner hinzufügen
	          player_select_new(group_player_index[group_selected,i])
	        End If
	
	      Else

	        player_select_del_all()
	        player_select_new(group_player_index[group_selected,i])
	
	      End If
	
	    End If
	
	    gui_maindata_draw(group_player_index[group_selected,i],gui_main_data_x+i*ImageWidth(img_main_data),gui_main_data_y)
	
	  Else
	    DrawImage(img_main_data,gui_main_data_x+i*ImageWidth(img_main_data),gui_main_data_y)
	  End If

  Next


End Function



Function gui_maindata_draw(index,x,y)

  If player_main[index]=1 Then
    DrawImage(soldier_custom_img[player_soldier[index],player_sex[index]],x+21,y+18)
  Else
    DrawImage(soldier_img[player_soldier[index]],x+21,y+18)
  End If

  SetColor(255,255,255)
  If player_selected[index]=1 Then
    If player_select_main=player_selected_pos[index] Then
      DrawImage(img_player_select_main,x,y)
    Else
      DrawImage(img_player_select,x,y)
    End If
  End If

  DrawText(player_nick[index],x+44-TextWidth(player_nick[index])/2,y+83-TextHeight(player_nick[index])/2)


  If player_hurt[index]>0 Then DrawImage img_cross,x+90,y+77
  If player_bleeding[index]>0 Then DrawImage img_blood,x+107,y+77
  If player_venomed[index]>0 Then DrawImage img_toxic,x+124,y+77
  If player_freeze[index]>0 Then DrawImage img_freeze,x+141,y+77
  If player_sick[index]>0 Then DrawImage img_sick,x+158,y+77



  If player_bleeding[0]>0 Then
    SetColor 255,255,0
  Else
    SetColor 255,88,66
  End If
  DrawRect x+91,y+8+61,3,-(61*player_life_lowered[0]/player_life_max[0])
  SetColor 255,0,0
  DrawRect x+91,y+8+61,3,-(61*player_life[0]/player_life_max[0])


  SetColor 0,88,255
  DrawRect x+100,y+8+61,3,-(61*player_energy_lowered[0]/player_energy_max[0])
  SetColor 0,0,255
  DrawRect x+100,y+8+61,3,-(61*player_energy[0]/player_energy_max[0])




  SetColor 255,255,255
  DrawRect x+121,y+8+61,3,-(61*player_schlaf[0]/player_schlaf_max[0])

  SetColor 255,88,66
  DrawRect x+130,y+8+61,3,-(61*player_hunger[0]/player_hunger_max[0])

  SetColor 0,155,255
  DrawRect x+139,y+8+61,3,-(61*player_durst[0]/player_durst_max[0])



  SetColor 0,255,0
  DrawRect x+152,y+8+61,3,-(61*player_moral[0]/100)

  SetColor 0,155,0
  DrawRect x+161,y+8+61,3,-(61*player_angst[0]/100)


End Function




Function gui_slot_draw(c,x,y)

  If c>0 Then

    Select c
      Case 1
        DrawImage(img_slot_tiny,x,y)
        Return 1
      Case 2
        DrawImage(img_slot_small,x,y)
        Return 2
      Case 3
        DrawImage(img_slot_mid,x,y)
        Return 3
      Default
        DrawImage(img_slot_big,x,y)
        Return 4
    End Select

  End If

  Return 0

End Function





Function gui_slot_zustand_draw(k,x,y)

  SetColor(155,255,55)
  DrawRect(x+5,y+6+40,3,-40*item_zustand[k]/100)

End Function




Function gui_slot_item_draw(c,i,k,x,y)

  gui_slot_zustand_draw(k,x,y)

  Select c
    Case 1
      x:+43
    Case 2
      x:+56
    Case 3
      x:+67
    Case 4
      x:+80
  End Select

  y:+25

  SetColor(255,255,255)
  DrawImage(item_type_img[i],x,y)

End Function





Function gui_inventar_draw()


If player_select_count>0 Then
If player_select_main>=0 Then
If player_select[player_select_main]=1 Then
Local p=player_select_index[player_select_main]

If player[p]>0 Then

    If gui_inventar_open=1 Then
		
	    If mouseover(gui_inventar_x,gui_inventar_y,gui_inventar_dx,gui_inventar_dy)=False Then
	      gui_inventar_open=0
	    Else
	
		    'alle inv slots und items zeichnen
		    For Local i=0 To player_inv_max-1
		
		      'inv slot zeichnen
		      DrawImage(img_slot_big,gui_inventar_x,gui_inventar_y+i*ImageHeight(img_slot_big))
		
		      If player_inventory[p,i]>0 Then
		
		        Local ii=player_inventory_index[p,i]
		        Local it=item_type[ii]
		
		       'inv item zeichnen
		        gui_slot_item_draw(4,it,ii,gui_inventar_x,gui_inventar_y+i*ImageHeight(img_slot_big))
		
		        If item_type_slots[it]>0 Then
		
				      Local x1=10
				
		          'slots zeichnen
		          For Local k=0 To item_type_slots[it]-1
		
		            Local c=item_type_slot_capacity[it,k]
		
		            For Local l=0 To item_capacity_max-1
		
		              If item_slot[ii,k,l]>0 Then
		
		                'wenn item dann berechne den verbrauchten platz
		                'zeichne den slot
		
		                Local iii=item_slot_index[ii,k,l]
		                Local iit=item_type[iii]
		
		                If item[iii]>0 Then
		
		                  c:-item_type_room[iit]
		
		                  gui_slot_draw(item_type_room[iit],gui_inventar_x+ImageWidth(img_slot_big)+x1,gui_inventar_y+i*ImageHeight(img_slot_big))
		                  gui_slot_item_draw(item_type_room[iit],iit,iii,gui_inventar_x+ImageWidth(img_slot_big)+x1,gui_inventar_y+i*ImageHeight(img_slot_big))
		
		                  x1:+50+item_type_room[iit]*25+10
		                  
		                End If
		
		              End If
		
		            Next
		
		            'rest zeichnen
		
		            While c>0
		
		              Local c1=gui_slot_draw(c,gui_inventar_x+ImageWidth(img_slot_big)+x1,gui_inventar_y+i*ImageHeight(img_slot_big))
		              c:-c1
		              x1:+50+c1*25+10
		
		            Wend
		
		          Next
		
		        End If
		
		      End If
		
		    Next
		
		  End If

    Else

      'gui inventar closed

	    If mouseover(gui_inventar_x,gui_inventar_y,gui_inventar_minimized_dx,gui_inventar_dy)=True Then
	      gui_inventar_open=1
	    Else
	
		    'alle inv slots und items zeichnen
		    For Local i=0 To player_inv_max-1
		
		      'inv slot zeichnen
		      SetColor(255,255,255)
		      DrawImage(img_slot_minimized,gui_inventar_x,gui_inventar_y+i*ImageHeight(img_slot_minimized))
		
		      If player_inventory[p,i]>0 Then
		        gui_slot_zustand_draw(player_inventory_index[p,i],gui_inventar_x,gui_inventar_y+i*ImageHeight(img_slot_minimized))
		      End If

		    Next
		
		  End If
		
    End If

End If
End If
End If
End If

End Function




Function gui_hand_draw()

If player_select_count>0 Then
If player_select_main>=0 Then
If player_select[player_select_main]=1 Then
Local p=player_select_index[player_select_main]

If player[p]>0 Then

    If gui_hand_open=1 Then
		
	    If mouseover(gui_hand_x,gui_hand_y,gui_hand_dx,gui_hand_dy)=False Then
	      gui_hand_open=0
	    Else
	
		    'alle inv slots und items zeichnen
		    For Local i=0 To player_hand_max-1
		
		      'inv slot zeichnen
		      DrawImage(img_slot_big,gui_hand_x,gui_hand_y+i*ImageHeight(img_slot_big))
		
		      If player_hand[p,i]>0 Then
		
		        Local ii=player_hand_index[p,i]
		        Local it=item_type[ii]
		
		       'inv item zeichnen
		        gui_slot_item_draw(4,it,ii,gui_hand_x,gui_hand_y+i*ImageHeight(img_slot_big))
		
		        If item_type_slots[it]>0 Then
		
				      Local x1=10
				
		          'slots zeichnen
		          For Local k=0 To item_type_slots[it]-1
		
		            Local c=item_type_slot_capacity[it,k]
		
		            For Local l=0 To item_capacity_max-1
		
		              If item_slot[ii,k,l]>0 Then
		
		                'wenn item dann berechne den verbrauchten platz
		                'zeichne den slot
		
		                Local iii=item_slot_index[ii,k,l]
		                Local iit=item_type[iii]
		
		                If item[iii]>0 Then
		
		                  c:-item_type_room[iit]
		
		                  gui_slot_draw(item_type_room[iit],gui_hand_x+ImageWidth(img_slot_big)+x1,gui_hand_y+i*ImageHeight(img_slot_big))
		                  gui_slot_item_draw(item_type_room[iit],iit,iii,gui_hand_x+ImageWidth(img_slot_big)+x1,gui_hand_y+i*ImageHeight(img_slot_big))
		
		                  x1:+50+item_type_room[iit]*25+10
		                  
		                End If
		
		              End If
		
		            Next
		
		            'rest zeichnen
		
		            While c>0
		
		              Local c1=gui_slot_draw(c,gui_hand_x+ImageWidth(img_slot_big)+x1,gui_hand_y+i*ImageHeight(img_slot_big))
		              c:-c1
		              x1:+50+c1*25+10
		
		            Wend
		
		          Next
		
		        End If
		
		      End If
		
		    Next
	
	    End If
	
	  Else
	
	    If mouseover(gui_hand_x,gui_hand_y,gui_hand_minimized_dx,gui_hand_dy)=True Then
	      gui_hand_open=1
	    Else
	
	      For Local i=0 To player_hand_max-1
	
			    SetColor(255,255,255)
		      DrawImage(img_slot_minimized,gui_hand_x,gui_hand_y+i*ImageHeight(img_slot_minimized))
		
		      If player_hand[p,i]>0 Then
		        gui_slot_zustand_draw(player_hand_index[p,i],gui_hand_x,gui_hand_y+i*ImageHeight(img_slot_minimized))
		      End If
		
		    Next
		
	    End If
	
    End If

End If
End If
End If
End If

End Function







