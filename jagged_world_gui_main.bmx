

Function gui_minimap_draw()

  SetColor(255,255,255)

  DrawImage(img_gui_time,wx-ImageWidth(img_gui_minimap)/2,wy-ImageHeight(img_gui_minimap)-ImageHeight(img_gui_time)/2)

  time_draw_time(wx-ImageWidth(img_gui_minimap)/2,wy-ImageHeight(img_gui_minimap)-ImageHeight(img_gui_time)/2,0,255,0)

  DrawImage(img_gui_minimap,wx-ImageWidth(img_gui_minimap)/2,wy-ImageHeight(img_gui_minimap)/2)

  SetRotation(45)  
  DrawImage(img_world_minimap,wx-ImageWidth(img_gui_minimap)/2,wy-ImageHeight(img_gui_minimap)/2)
  SetRotation(0)  


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




Function gui_slot_draw(pindex,iindex,slot,cap,c,x,y)

  If c>0 Then

    SetColor(255,255,255)

    Local b=0

    If item_slot[iindex,slot,cap]>0 Or mouse_inventory>0 Then

	    Select c
	      Case 1
	        b=button_draw(img_slot_tiny,"",x,y)
	      Case 2
	        b=button_draw(img_slot_small,"",x,y)
	      Case 3
	        b=button_draw(img_slot_mid,"",x,y)
	      Default
	        b=button_draw(img_slot_big,"",x,y)
	    End Select

    Else

	    Select c
	      Case 1
	        DrawImage(img_slot_tiny,x,y)
	      Case 2
	        DrawImage(img_slot_small,x,y)
	      Case 3
	        DrawImage(img_slot_mid,x,y)
	      Default
	        DrawImage(img_slot_big,x,y)
	    End Select

    End If



    If mouse_inventory>0 Then
      If c<item_type_room[item_type[mouse_inventory_index]] Then
        'blocked
		    Select c
		      Case 1
		        DrawImage(img_slot_tiny_blocked,x,y)
		      Case 2
		        DrawImage(img_slot_small_blocked,x,y)
		      Case 3
		        DrawImage(img_slot_mid_blocked,x,y)
		      Default
		        DrawImage(img_slot_big_blocked,x,y)
		    End Select
      End If
    End If


    If b=1 Then

      If item_slot[iindex,slot,cap]>0 Then

	      If mouse_inventory>0 Then
	
	        If item_group_check(item_type[item_slot_index[iindex,slot,cap]],group_weapon)=True And item_group_check(item_type[mouse_inventory_index],group_magazine)=True Then
	          gui_slot_fill_weapon_with_magazine(pindex,iindex,slot,cap)
          Else
	          If item_group_check(item_type[item_slot_index[iindex,slot,cap]],group_weapon)=True And item_group_check(item_type[mouse_inventory_index],group_ammo)=True Then
	            gui_slot_fill_weapon_with_ammo(pindex,iindex,slot,cap)
            Else
	            If item_group_check(item_type[item_slot_index[iindex,slot,cap]],group_magazine)=True And item_group_check(item_type[mouse_inventory_index],group_ammo)=True Then
	              gui_slot_fill_magazine(pindex,iindex,slot,cap)
	            Else
		            If item_type_stack[item_type[item_slot_index[iindex,slot,cap]]]>0 And item_compare_type(item_type[item_slot_index[iindex,slot,cap]],item_type[mouse_inventory_index])=True Then
	                gui_slot_stack_combine(pindex,iindex,slot,cap)
	              Else
	                If c>=item_type_room[item_type[mouse_inventory_index]] Then
	                  gui_slot_item_switch(pindex,iindex,slot,cap)
	                End If
	              End If
	            End If
            End If
          End If

	      Else
	
          gui_slot_item_pick(pindex,iindex,slot,cap)
		
	      End If

      Else

	      If mouse_inventory>0 Then
          If c>=item_type_room[item_type[mouse_inventory_index]] Then

            gui_slot_item_set(pindex,iindex,slot,cap)

		      End If
	      End If

      End If

    Else

      If b=2 Then

        If item_slot[iindex,slot,cap]>0 Then

          If item_stack_count[item_slot_index[iindex,slot,cap]]>0 Then
            gui_slot_item_stack_pick(pindex,iindex,slot,cap)
          Else
            If item_group_check(item_type[item_slot_index[iindex,slot,cap]],group_weapon)=True Then
              If item_magazine[item_slot_index[iindex,slot,cap]]>0 Then
                'pick mag
                gui_slot_mag_pick(pindex,iindex,slot,cap)
              Else
                If item_ammo_count[item_slot_index[iindex,slot,cap]]>0 Then
                  'pick ammo
                  gui_slot_ammo_pick(pindex,iindex,slot,cap)
                End If
              End If
            Else
              If item_group_check(item_type[item_slot_index[iindex,slot,cap]],group_magazine)=True Then
                If item_ammo_count[item_slot_index[iindex,slot,cap]]>0 Then
                  'pick ammo
                  gui_slot_ammo_pick(pindex,iindex,slot,cap)
                End If
              Else
                'pick item
                gui_slot_item_stack_pick(pindex,iindex,slot,cap)
              End If
            End If
          End If

        End If

      End If

    End If


    If c>4 Then
      Return 4
    Else
      Return c
    End If

  End If

  Return 0

End Function





Function gui_slot_mag_pick(pindex,iindex,slot,cap)


    If item_magazine[item_slot_index[iindex,slot,cap]]=1 Then
    If player_energy_ok(pindex,player_e_inventory_action_2)=True Then

      If mouse_inventory>0 Then
        item_stack_add_item(mouse_inventory_index,item_magazine_index[item_slot_index[iindex,slot,cap]])
      Else
        mouse_inventory=1
        mouse_inventory_index=item_magazine_index[item_slot_index[iindex,slot,cap]]

        item_location[mouse_inventory_index]=location_mouse
      End If

      item_magazine[item_slot_index[iindex,slot,cap]]=0

      player_energy_drain(pindex,player_e_inventory_action_2)

      playsnd_reload(item_type_group[item_type[item_slot_index[iindex,slot,cap]],1])

    End If
    End If


End Function



Function gui_slot_ammo_pick(pindex,iindex,slot,cap)


  If item_ammo_count[item_slot_index[iindex,slot,cap]]>0 Then

      If player_energy_ok(pindex,player_e_inventory_action_2)=True Then

        Local i=item_ammo_pick(item_slot_index[iindex,slot,cap])


        If mouse_inventory>0 Then
          item_stack_add_item(mouse_inventory_index,i)
        Else
          mouse_inventory=1
          mouse_inventory_index=i

          item_location[i]=location_mouse

        End If

        player_energy_drain(pindex,player_e_inventory_action_2)

        playsnd_lnl(item_type_group[item_type[item_slot_index[iindex,slot,cap]],1])

      End If

  End If

End Function



Function gui_slot_fill_weapon_with_magazine(pindex,iindex,slot,cap)



      If item_stack_find_first_magazine(mouse_inventory_index,item_slot_index[iindex,slot,cap])=True Then

      Local i=item_stack_pick_first_magazine(mouse_inventory_index,item_slot_index[iindex,slot,cap])

      If i>=0 Then

      If item_magazine[item_slot_index[iindex,slot,cap]]>0 Then

        If player_energy_ok(pindex,player_e_inventory_action_2)=True Then

          If mouse_inventory=0 Then
            mouse_inventory=1
            mouse_inventory_index=item_magazine_index[item_slot_index[iindex,slot,cap]]
            item_location[mouse_inventory_index]=mouse_inventory
          Else
            item_stack_add_item(mouse_inventory_index,item_magazine_index[item_slot_index[iindex,slot,cap]])
          End If

          item_magazine[item_slot_index[iindex,slot,cap]]=1
          item_magazine_index[item_slot_index[iindex,slot,cap]]=i

          item_location[i]=location_weapon
          item_location_index[i]=item_slot_index[iindex,slot,cap]

          player_energy_drain(pindex,player_e_inventory_action_2)

          playsnd_reload(item_type_group[item_type[item_slot_index[iindex,slot,cap]],1])

        End If

      Else

        If player_energy_ok(pindex,player_e_inventory_action_2)=True Then

          item_magazine[item_slot_index[iindex,slot,cap]]=1
          item_magazine_index[item_slot_index[iindex,slot,cap]]=i

          item_location[i]=location_weapon
          item_location_index[i]=item_slot_index[iindex,slot,cap]

          player_energy_drain(pindex,player_e_inventory_action_2)

          playsnd_reload(item_type_group[item_type[item_slot_index[iindex,slot,cap]],1])

        End If

      End If
      End If
      End If



End Function



Function gui_slot_fill_weapon_with_ammo(pindex,iindex,slot,cap)

  Local f=True
  Local l=False

  If item_stack_count[item_slot_index[iindex,slot,cap]]=0 Then

    While f=True

      f=False

      If item_magazine[item_slot_index[iindex,slot,cap]]=0 Then

      If item_ammo_count[item_slot_index[iindex,slot,cap]]<item_type_ammo[item_type[item_slot_index[iindex,slot,cap]]] Then

        If item_stack_find_first_bullet(mouse_inventory_index,item_type_kaliber_type[item_type[item_slot_index[iindex,slot,cap]]])=True Then

          If player_energy_ok(pindex,player_e_inventory_action_2)=True Then

            Local i=item_stack_pick_first_bullet(mouse_inventory_index,item_type_kaliber_type[item_type[item_slot_index[iindex,slot,cap]]])

            If i>=0 Then

              Local k=item_ammo_add(item_slot_index[iindex,slot,cap],i)

              If k>=0 Then

                player_energy_drain(pindex,player_e_inventory_action_2)

                f=True
                l=True

              End If
            End If
          End If
        End If
      End If

      End If

    Wend

  End If

  If l=True Then
    playsnd_reload(item_type_group[item_type[item_slot_index[iindex,slot,cap]],1])
  End If

  If item[mouse_inventory_index]=0 Then
    mouse_inventory=0
  End If

End Function



Function gui_slot_fill_magazine(pindex,iindex,slot,cap)

  Local f=True
  Local l=False

  'If item_stack_count[item_slot_index[iindex,slot,cap]]=1 Then
  '  item_slot_index[iindex,slot,cap]=item_stack_destroy(item_slot_index[iindex,slot,cap])
  'End If

  If item_stack_count[item_slot_index[iindex,slot,cap]]=0 Then
    While f=True

      f=False

      If item_ammo_count[item_slot_index[iindex,slot,cap]]<item_type_ammo[item_type[item_slot_index[iindex,slot,cap]]] Then

        If item_stack_find_first_bullet(mouse_inventory_index,item_type_kaliber_type[item_type[item_slot_index[iindex,slot,cap]]])=True Then

          If player_energy_ok(pindex,player_e_inventory_action_2)=True Then

            Local i=item_stack_pick_first_bullet(mouse_inventory_index,item_type_kaliber_type[item_type[item_slot_index[iindex,slot,cap]]])

            If i>=0 Then

              Local k=item_ammo_add(item_slot_index[iindex,slot,cap],i)

              If k>=0 Then

                player_energy_drain(pindex,player_e_inventory_action_2)

                f=True
                l=True

              End If
            End If
          End If
        End If
      End If

    Wend

  End If

  If l=True Then
    playsnd_reload(group_magazine)
  End If

  If item[mouse_inventory_index]=0 Then
    mouse_inventory=0
  End If

	
End Function



Function gui_slot_item_set(pindex,iindex,slot,cap)

	'ablegen
	
	If player_energy_ok(pindex,player_e_inventory_action_2)=True Then
	
		mouse_inventory=0
		
		item_slot[iindex,slot,cap]=1
		item_slot_index[iindex,slot,cap]=mouse_inventory_index
		
		item_location[item_slot_index[iindex,slot,cap]]=location_item_slot
		item_location_index[item_slot_index[iindex,slot,cap]]=iindex
		item_location_pos[item_slot_index[iindex,slot,cap],0]=slot
		item_location_pos[item_slot_index[iindex,slot,cap],1]=cap
		
		player_energy_drain(pindex,player_e_inventory_action_2)
	
	End If

End Function



Function gui_slot_item_pick(pindex,iindex,slot,cap)

	'aufnehmen
	If player_energy_ok(pindex,player_e_inventory_action_2)=True Then
		
		mouse_inventory=1
		mouse_inventory_index=item_slot_index[iindex,slot,cap]
		
		item_slot[iindex,slot,cap]=0
		
		item_location[mouse_inventory_index]=location_mouse
		
		player_energy_drain(pindex,player_e_inventory_action_2)
	
	End If

End Function

	

Function gui_slot_stack_combine(pindex,iindex,slot,cap)

	If player_energy_ok(pindex,player_e_inventory_action_2)=True Then
		
		item_stack_combine(mouse_inventory_index,item_slot_index[iindex,slot,cap])
		
		player_energy_drain(pindex,player_e_inventory_action_2)
		
	End If

End Function



Function gui_slot_item_switch(pindex,iindex,slot,cap)

	'austauschen
	If player_energy_ok(pindex,player_e_inventory_action_2)=True Then
	
		Local mitem=mouse_inventory_index
		
		mouse_inventory=1
		mouse_inventory_index=item_slot_index[iindex,slot,cap]
		
		item_slot[iindex,slot,cap]=1
		item_slot_index[iindex,slot,cap]=mitem
		
		item_location[mouse_inventory_index]=location_mouse
		
		item_location[item_slot_index[iindex,slot,cap]]=location_item_slot
		item_location_index[item_slot_index[iindex,slot,cap]]=iindex
		item_location_pos[item_slot_index[iindex,slot,cap],0]=slot
		item_location_pos[item_slot_index[iindex,slot,cap],1]=cap
		
		player_energy_drain(pindex,player_e_inventory_action_2)
	
	End If

End Function



Function gui_slot_item_stack_pick(pindex,index,slot,cap)

  If mouse_inventory>0 Then

        If player_energy_ok(pindex,player_e_inventory_action_2)=True Then

          item_stack_switch_item(item_slot_index[index,slot,cap],mouse_inventory_index)

			    player_energy_drain(pindex,player_e_inventory_action_2)
			
        End If

  Else

    'aufnehmen

    If player_energy_ok(pindex,player_e_inventory_action_2)=True Then

	    Local i=item_stack_pick_first_item(item_slot_index[index,slot,cap])
	
	    item_location_set(i,location_mouse)
	
			player_energy_drain(pindex,player_e_inventory_action_2)
			
    End If


  End If

End Function




Function gui_slot_zustand_draw(k,x,y)

  If item_zustand[k]<33 Then
    SetColor(255,0,0)
  Else
    If item_zustand[k]<66 Then
      SetColor(255,255,0)
    Else
      SetColor(0,255,0)
    End If
  End If

  DrawRect(x+5,y+6+40,3,-40*item_zustand[k]/100)

End Function




Function gui_slot_item_draw(c,i,k,x,y)

  Local x1=0
  Local y1=0

  gui_slot_zustand_draw(k,x,y)

  Select c
    Case 1
      'x1=x+43
      x1=x+ImageWidth(img_slot_tiny)/2+5
    Case 2
      'x1=x+56
      x1=x+ImageWidth(img_slot_small)/2+5
    Case 3
      'x1=x+67
      x1=x+ImageWidth(img_slot_mid)/2+5
    Case 4
      'x1=x+80
      x1=x+ImageWidth(img_slot_big)/2+5
  End Select

  'y1=y+25
  y1=y+ImageHeight(img_slot_big)/2

  SetColor(255,255,255)
  DrawImage(item_type_img[i],x1,y1)

  If item_stack_count[k]>0 Then

    SetColor(155,255,55)
    Select c
      Case 1
        DrawText(item_stack_count[k],x+ImageWidth(img_slot_tiny)-5-TextWidth(item_stack_count[k]),y+ImageHeight(img_slot_tiny)-3-TextHeight(item_stack_count[k]))
      Case 2
        DrawText(item_stack_count[k],x+ImageWidth(img_slot_small)-5-TextWidth(item_stack_count[k]),y+ImageHeight(img_slot_small)-3-TextHeight(item_stack_count[k]))
      Case 3
        DrawText(item_stack_count[k],x+ImageWidth(img_slot_mid)-5-TextWidth(item_stack_count[k]),y+ImageHeight(img_slot_mid)-3-TextHeight(item_stack_count[k]))
      Case 4
        DrawText(item_stack_count[k],x+ImageWidth(img_slot_big)-5-TextWidth(item_stack_count[k]),y+ImageHeight(img_slot_big)-3-TextHeight(item_stack_count[k]))
    End Select

  End If

DrawText k,x+15,y
DrawText item_magazine[k],x+15,y+15
DrawText item_ammo_count[k],x+15,y+30


End Function







Function gui_hand_zustand_draw(k,x,y)

  If item_zustand[k]<33 Then
    SetColor(255,0,0)
  Else
    If item_zustand[k]<66 Then
      SetColor(255,255,0)
    Else
      SetColor(0,255,0)
    End If
  End If

  DrawRect(x+12,y+11+40,3,-40*item_zustand[k]/100)

End Function




Function gui_hand_item_draw(i,k,x,y)

  gui_hand_zustand_draw(k,x,y)

  SetColor(255,255,255)
  DrawImage(item_type_img[i],x+ImageWidth(img_slot_hand)/2,y+ImageHeight(img_slot_hand)/2)

  If item_stack_count[k]>0 Then

    SetColor(155,255,55)
    DrawText(item_stack_count[k],x+ImageWidth(img_slot_hand)-5-TextWidth(item_stack_count[k]),y+ImageHeight(img_slot_hand)-3-TextHeight(item_stack_count[k]))

  End If

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
				  SetColor(255,255,255)
				
  			  If player_inventory[p,i]>0 Or mouse_inventory>0 Then

		        Local b=button_draw(img_slot_big,"",gui_inventar_x,gui_inventar_y+i*ImageHeight(img_slot_big))
		
		        If mouse_inventory>0 Then
				      If i<>item_type_inv_slot[item_type[mouse_inventory_index]] Then
		            'blocked
		            DrawImage(img_slot_big_blocked,gui_inventar_x,gui_inventar_y+i*ImageHeight(img_slot_big_blocked))
		          End If
		        End If
		
		        If b=1 Then
		
		          If player_inventory[p,i]>0 Then
	
			          Local ii=player_inventory_index[p,i]
		            Local it=item_type[ii]
		
		            If mouse_inventory>0 Then
		              'austauschen
		              If i=item_type_inv_slot[item_type[mouse_inventory_index]] Then

                    If player_energy_ok(p,player_e_inventory_action_1)=True Then

		                  Local mitem=mouse_inventory_index
		
							        mouse_inventory=1
		                  mouse_inventory_index=player_inventory_index[p,i]
		
			                player_inventory[p,i]=1
			                player_inventory_index[p,i]=mitem
			
			                item_location[mouse_inventory_index]=location_mouse
			
			                item_location[player_inventory_index[p,i]]=location_player_inventory
			                item_location_index[player_inventory_index[p,i]]=p
						          item_location_pos[player_inventory_index[p,i],0]=i
			
			                player_energy_drain(p,player_e_inventory_action_1)
			
					          End If
					
		              End If
	              Else
	                'aufnehmen
	
	                If player_energy_ok(p,player_e_inventory_action_1)=True Then
	
					          mouse_inventory=1
		                mouse_inventory_index=player_inventory_index[p,i]
		
			              player_inventory[p,i]=0
			
			              item_location[mouse_inventory_index]=location_mouse
			
			              player_energy_drain(p,player_e_inventory_action_1)
			
				          End If
				
		            End If
	
	            Else
	
		            If mouse_inventory>0 Then
		              'ablegen
		              If i=item_type_inv_slot[item_type[mouse_inventory_index]] Then
		                
		                If player_energy_ok(p,player_e_inventory_action_1)=True Then
		
		                  player_inventory[p,i]=1
		                  player_inventory_index[p,i]=mouse_inventory_index
		                  mouse_inventory=0

			                item_location[player_inventory_index[p,i]]=location_player_inventory
			                item_location_index[player_inventory_index[p,i]]=p
						          item_location_pos[player_inventory_index[p,i],0]=i
						
			                player_energy_drain(p,player_e_inventory_action_1)
			
		                End If
		
		              End If
		            End If
	
	            End If
		
		        End If
		
          Else		
            DrawImage(img_slot_big,gui_inventar_x,gui_inventar_y+i*ImageHeight(img_slot_big))
		      End If
		
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
		            Local l
		
		            For l=0 To item_capacity_max-1
		
		              If item_slot[ii,k,l]>0 Then
		
		                'wenn item dann berechne den verbrauchten platz
		                'zeichne den slot
		
		                Local iii=item_slot_index[ii,k,l]
		                Local iit=item_type[iii]
		
		                If item[iii]>0 Then
		
		                  c:-item_type_room[iit]
		
		                  gui_slot_draw(p,ii,k,l,item_type_room[iit],gui_inventar_x+ImageWidth(img_slot_big)+x1,gui_inventar_y+i*ImageHeight(img_slot_big))
		                  gui_slot_item_draw(item_type_room[iit],iit,iii,gui_inventar_x+ImageWidth(img_slot_big)+x1,gui_inventar_y+i*ImageHeight(img_slot_big))
		
		                  x1:+50+item_type_room[iit]*25+10
		                  
		                End If
		
		              End If
		
		            Next
		
		            'rest zeichnen
		
			            For l=0 To item_capacity_max-1

			              If c>0 And item_slot[ii,k,l]=0 Then
		
	                    Local c1=gui_slot_draw(p,ii,k,l,c,gui_inventar_x+ImageWidth(img_slot_big)+x1,gui_inventar_y+i*ImageHeight(img_slot_big))
	                    c:-c1
	                    x1:+50+c1*25+10

	                  End If
	
			            Next
			
			            SetColor(255,255,255)
			            DrawImage(img_slot_end,gui_inventar_x+ImageWidth(img_slot_big)+x1-ImageWidth(img_slot_end)-10,gui_inventar_y+i*ImageHeight(img_slot_big))
		
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









Function gui_hand_pick_item(pindex,i)

  'aufnehmen

  If player_energy_ok(pindex,player_e_inventory_action_1)=True Then

      'pickup item
      mouse_inventory=1
      mouse_inventory_index=player_hand_index[pindex,i]

      item_location[mouse_inventory_index]=location_mouse

      If item_type_dual[item_type[player_hand_index[pindex,i]]]>0 Then
        player_hand[pindex,0]=0
        player_hand[pindex,1]=0
      Else
        player_hand[pindex,i]=0
      End If

			player_energy_drain(pindex,player_e_inventory_action_1)
			player_action_animation_set(pindex,1)
			
    End If
	
End Function


Function gui_hand_set_item(pindex,i)

  'einfaches item ablegen

	If player_energy_ok(pindex,player_e_inventory_action_1)=True Then
	
		mouse_inventory=0

		player_hand[pindex,i]=1
		player_hand_index[pindex,i]=mouse_inventory_index
		
		item_location[mouse_inventory_index]=location_player_hand
		item_location_index[mouse_inventory_index]=pindex
		item_location_pos[mouse_inventory_index,0]=i
	
	  player_energy_drain(pindex,player_e_inventory_action_1)
	  player_action_animation_set(pindex,1)

	End If
	
End Function



Function gui_hand_set_item_dual(pindex)

  'dual item ablegen

	If player_energy_ok(pindex,player_e_inventory_action_1)=True Then
	
		mouse_inventory=0

		player_hand[pindex,0]=1
		player_hand_index[pindex,0]=mouse_inventory_index
		player_hand[pindex,1]=1
		player_hand_index[pindex,1]=mouse_inventory_index
		
		item_location[mouse_inventory_index]=location_player_hand
		item_location_index[mouse_inventory_index]=pindex
		item_location_pos[mouse_inventory_index,0]=player_dualhand
		
	  player_energy_drain(pindex,player_e_inventory_action_1)
	  player_action_animation_set(pindex,1)

	End If
	
End Function




Function gui_hand_switch_item(pindex,i)

  'normales item tauschen

	If player_energy_ok(pindex,player_e_inventory_action_1)=True Then
	
		Local mitem=mouse_inventory_index
		
		mouse_inventory=1
		mouse_inventory_index=player_hand_index[pindex,i]
		
		item_location[mouse_inventory_index]=location_mouse
				
		If item_type_dual[item_type[player_hand_index[pindex,i]]]>0 Then
			player_hand[pindex,0]=0
			player_hand[pindex,1]=0
		End If

		player_hand[pindex,i]=1
		player_hand_index[pindex,i]=mitem
						
		item_location[mitem]=location_player_hand
		item_location_index[mitem]=pindex
		item_location_pos[mitem,0]=i
		
		player_energy_drain(pindex,player_e_inventory_action_1)
	  player_action_animation_set(pindex,1)

	End If

End Function



Function gui_hand_switch_item_dual(pindex,i)

  'dual item tauschen

	If player_energy_ok(pindex,player_e_inventory_action_1)=True Then
	
		Local mitem=mouse_inventory_index
		
		mouse_inventory=1
		If player_hand[pindex,0]>0 Then
	    mouse_inventory_index=player_hand_index[pindex,0]
	  Else
	    mouse_inventory_index=player_hand_index[pindex,1]	    
	  End If
		
		item_location[mouse_inventory_index]=location_mouse
				
		player_hand[pindex,0]=1
		player_hand[pindex,1]=1
		
		player_hand_index[pindex,0]=mitem
		player_hand_index[pindex,1]=mitem

		item_location[mitem]=location_player_hand
		item_location_index[mitem]=pindex
		item_location_pos[mitem,0]=player_dualhand
	
	  player_energy_drain(pindex,player_e_inventory_action_1)
	  player_action_animation_set(pindex,1)

	End If
	
End Function



Function gui_hand_item_stack_pick(pindex,i)

  If mouse_inventory>0 Then

    If item_compare_type(item_type[player_hand_index[pindex,i]],item_type[mouse_inventory_index])=True Then
      If item_type_stack[item_type[mouse_inventory_index]]>0 Then

        If player_energy_ok(pindex,player_e_inventory_action_1)=True Then

	        item_stack_switch_item(player_hand_index[pindex,i],mouse_inventory_index)
	
	        If item_location[player_hand_index[pindex,i]]<>location_player_hand Then
	          If item_type_dual[item_type[player_hand_index[pindex,i]]]>0 Then
	            player_hand[pindex,0]=0
	            player_hand[pindex,1]=0
	          Else
	            player_hand[pindex,i]=0
	          End If
	        End If
	
          player_energy_drain(pindex,player_e_inventory_action_1)

        End If

      End If
    End If

  Else

    If player_energy_ok(pindex,player_e_inventory_action_1)=True Then

	    mouse_inventory_index=item_stack_pick_first_item(player_hand_index[pindex,i])
	
	    If mouse_inventory_index<0 Then
	
	      mouse_inventory=0
	
	    Else
	
	      mouse_inventory=1
	      item_location[mouse_inventory_index]=location_mouse
	
	      If item_location[player_hand_index[pindex,i]]<>location_player_hand Then
	        If item_type_dual[item_type[player_hand_index[pindex,i]]]>0 Then
	          player_hand[pindex,0]=0
	          player_hand[pindex,1]=0
	        Else
	          player_hand[pindex,i]=0
	        End If
	      End If
	
	    End If
	
	    player_energy_drain(pindex,player_e_inventory_action_1)

    End If

  End If

End Function


Function gui_hand_action(pindex,i,img:TImage,img_blocked:TImage,x,y)

	Local ii=player_hand_index[pindex,i]
	Local it=item_type[ii]
	
	SetColor(255,255,255)
		
  If player_hand[pindex,i]>0 Or mouse_inventory>0 Then

  Local b=button_draw(img,"",x,y)
  If b=1 Then

    If mouse_inventory>0 Then

      If item_type_dual[item_type[mouse_inventory_index]]>0 Then

        If player_hand[pindex,0]=0 And player_hand[pindex,1]=0 Then

          'ablegen dual
          gui_hand_set_item_dual(pindex)

        Else

          If (player_hand[pindex,0]>0 And player_hand[pindex,1]=0) Or item_type_dual[it]>0 Then

            'switch dual 0
            gui_hand_switch_item_dual(pindex,0)

          Else

            If player_hand[pindex,0]=0 And player_hand[pindex,1]>0 Then

              'switch dual 1
              gui_hand_switch_item_dual(pindex,1)

            End If

          End If

        End If

      Else

        If player_hand[pindex,i]=0 Then

          'ablegen
          gui_hand_set_item(pindex,i)

        Else

          'tauschen
          gui_hand_switch_item(pindex,i)

        End If

      End If

    Else
      'pickup
      gui_hand_pick_item(pindex,i)
    End If

  Else

    If b=2 Then
      If player_hand[pindex,i]>0 Then
        gui_hand_item_stack_pick(pindex,i)
      End If
    End If

  End If

  If player_hand[pindex,1]>0 And item_type_dual[it]>0 And i=1 Then
    DrawImage(img_blocked,x,y)
  End If

  Else

    DrawImage(img,x,y)

  End If

End Function





'basic hand

Function gui_hand_draw(index,x,y)

  'alle inv slots und items zeichnen
  For Local i=0 To player_hand_max-1		
				
    'inv slot zeichnen
    gui_hand_action(index,i,img_slot_hand,img_slot_hand_blocked,x,y+i*ImageHeight(img_slot_hand))	

    If player_hand[index,i]>0 Then
      If item_type_dual[item_type[player_hand_index[index,i]]]=0 Or (item_type_dual[item_type[player_hand_index[index,i]]]>0 And i=0) Then
        gui_hand_item_draw(item_type[player_hand_index[index,i]],player_hand_index[index,i],x,y+i*ImageHeight(img_slot_hand))
      End If
    End If

  Next

End Function




'basic group hand

Function gui_hand_group_draw()

  For Local i=0 To group_player_max-1

    SetColor(255,255,255)

    If group_player[group_selected,i]=1 Then

	    gui_hand_draw(group_player_index[group_selected,i],gui_hand_x+i*ImageWidth(img_slot_hand),gui_hand_y)
	
	  Else
	
	    DrawImage(img_slot_hand,gui_hand_x+i*ImageWidth(img_slot_hand),gui_hand_y)
		  DrawImage(img_slot_hand,gui_hand_x+i*ImageWidth(img_slot_hand),gui_hand_y+ImageHeight(img_slot_hand))
		
	    DrawImage(img_slot_hand_blocked,gui_hand_x+i*ImageWidth(img_slot_hand_blocked),gui_hand_y)
		  DrawImage(img_slot_hand_blocked,gui_hand_x+i*ImageWidth(img_slot_hand_blocked),gui_hand_y+ImageHeight(img_slot_hand_blocked))
				
	  End If

  Next


End Function




'invetory hand

Function gui_inventar_hand_draw()

If player_select_count>0 Then
If player_select_main>=0 Then
If player_select[player_select_main]=1 Then
Local p=player_select_index[player_select_main]

If player[p]>0 Then

    If gui_hand2_open=1 Then
		
	    If mouseover(gui_hand2_x,gui_hand2_y,gui_hand2_dx,gui_hand2_dy)=False Then
	      gui_hand2_open=0
	    Else
	
		    'alle inv slots und items zeichnen
		    For Local i=0 To player_hand_max-1
		
		      'inv slot zeichnen
		      gui_hand_action(p,i,img_slot_big,img_slot_big_blocked,gui_hand2_x,gui_hand2_y+i*ImageHeight(img_slot_big))
		      
		      If player_hand[p,i]>0 Then
		
		        Local ii=player_hand_index[p,i]
		        Local it=item_type[ii]
		
		       'inv item zeichnen
		        If item_type_dual[it]=0 Or (item_type_dual[it]>0 And i=0) Then
		          gui_slot_item_draw(4,it,ii,gui_hand2_x,gui_hand2_y+i*ImageHeight(img_slot_big))
		        End If
		
		        If item_type_slots[it]>0 Then
		
				      Local x1=10
				
		          'slots zeichnen
		          For Local k=0 To item_type_slots[it]-1
		
		            Local c=item_type_slot_capacity[it,k]
		            Local l
		
		            For l=0 To item_capacity_max-1
		
		              If item_slot[ii,k,l]>0 Then
		
		                'wenn item dann berechne den verbrauchten platz
		                'zeichne den slot
		
		                Local iii=item_slot_index[ii,k,l]
		                Local iit=item_type[iii]
		
		                If item[iii]>0 Then
		
		                  c:-item_type_room[iit]
		
		                  gui_slot_draw(p,ii,k,l,item_type_room[iit],gui_hand2_x+ImageWidth(img_slot_big)+x1,gui_hand2_y+i*ImageHeight(img_slot_big))
		                  gui_slot_item_draw(item_type_room[iit],iit,iii,gui_hand2_x+ImageWidth(img_slot_big)+x1,gui_hand2_y+i*ImageHeight(img_slot_big))
		
		                  x1:+50+item_type_room[iit]*25+10
		                  
		                End If
		
		              End If
		
		            Next
		
		            'rest zeichnen
		
		            For l=0 To item_capacity_max-1

		              If c>0 And item_slot[ii,k,l]=0 Then
	
                    Local c1=gui_slot_draw(p,ii,k,l,c,gui_hand2_x+ImageWidth(img_slot_big)+x1,gui_hand2_y+i*ImageHeight(img_slot_big))
                    c:-c1
                    x1:+50+c1*25+10

                  End If

		            Next

		          Next
		
		        End If
	
	        End If
	
		    Next
	
	    End If
	
	  Else
	
	    If mouseover(gui_hand2_x,gui_hand2_y,gui_hand2_minimized_dx,gui_hand2_dy)=True Then
	      gui_hand2_open=1
	    Else
	
	      For Local i=0 To player_hand_max-1
		
			    SetColor(255,255,255)
			   	DrawImage(img_slot_minimized,gui_hand2_x,gui_hand2_y+i*ImageHeight(img_slot_minimized))
								
				  If player_hand[p,i]>0 Then
				    If item_type_dual[item_type[player_hand_index[p,i]]]=0 Or i=0 Then
				
				      If player_hand[p,i]>0 Then
				        gui_slot_zustand_draw(player_hand_index[p,i],gui_hand2_x,gui_hand2_y+i*ImageHeight(img_slot_minimized))
				      End If
			
			      End If
		        
		      End If
		
		    Next
		
	    End If
	
    End If

End If
End If
End If
End If

End Function



Function gui_mouse_draw()

  If mouse_inventory>0 Then

    SetColor(255,255,255)

    DrawImage(item_type_img[item_type[mouse_inventory_index]],mouse_x,mouse_y)

	  If item_stack_count[mouse_inventory_index]>0 Then
	
	    SetColor(155,255,55)
	    DrawText(item_stack_count[mouse_inventory_index],mouse_x+ImageWidth(item_type_img[item_type[mouse_inventory_index]])/2-TextWidth(item_stack_count[mouse_inventory_index]),mouse_y+ImageHeight(item_type_img[item_type[mouse_inventory_index]])/2-TextHeight(item_stack_count[mouse_inventory_index]))
	
	  End If

DrawText(mouse_inventory_index,mouse_x-ImageWidth(item_type_img[item_type[mouse_inventory_index]])/2-TextWidth(item_stack_count[mouse_inventory_index]),mouse_y-ImageHeight(item_type_img[item_type[mouse_inventory_index]])/2-TextHeight(item_stack_count[mouse_inventory_index]))


  End If

End Function




