

Function gui_minimap_draw()

  DrawImage img_world_minimap,wx-ImageWidth(img_world_minimap),0

End Function


Function gui_maindata_group_draw()

  For Local i=0 To group_player_max-1

    SetColor(255,255,255)

    DrawImage img_main_data,i*180,wy-95

    If group_player[group_selected,i]=1 Then
      gui_maindata_draw(group_player_index[group_selected,i],i*180,wy-95)
    End If

  Next


End Function



Function gui_maindata_draw(index,x,y)

  If player_main[index]=1 Then
    DrawImage(soldier_custom_img[player_soldier[index],player_sex[index]],x+21,y+18)
  Else
    DrawImage(soldier_custom_img[player_soldier[index],player_sex[index]],x+21,y+18)
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




Function slot_draw(c,x,y)

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




Function slot_item_draw(c,i,k,x,y)

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

  SetColor(155,255,55)
  DrawRect(x+75,y+6+40,3,40*item_zustand[k]/100)

  SetColor(255,255,255)
  DrawImage(item_type_img[i],x,y)

End Function





Function gui_inventar_draw()

  If gui_inventar=True Then

  Local p=group_player_index[group_selected,group_player_selected[group_selected]]

  If player[p]>0 Then

    'alle inv slots und items zeichnen
    For Local i=0 To player_inv_max-1

      'inv slot zeichnen
      DrawImage(img_slot_big,inventar_x,inventar_y+i*50)

      If player_inventory[p,i]>0 Then

        Local ii=player_inventory_index[p,i]
        Local it=item_type[ii]

       'inv item zeichnen
        'DrawImage(item_type_img[it],inventar_x+78,inventar_y+24+i*50)
        slot_item_draw(4,it,ii,inventar_x,inventar_y+i*50)

        If item_type_slots[it]>0 Then

          'slots zeichnen
          For Local k=0 To item_slot_max-1

            Local c=item_type_slot_capacity[it,k]
            Local x1=0

            For Local l=0 To item_capacity_max-1

              If item_slot[ii,k,l]>0 Then

                'wenn item dann berechne den verbrauchten platz
                'zeichne den slot

                Local iii=item_slot_index[ii,k,l]
                Local iit=item_type[iii]

                If item[iii]>0 Then

                  c:-item_type_room[iit]

                  slot_draw(item_type_room[iit],inventar_x+150+x1,inventar_y+i*50)
                  slot_item_draw(item_type_room[iit],iit,iii,inventar_x+150+x1,inventar_y+i*50)

                  x1:+50*item_type_room[iit]*25
                  
                End If

              End If

            Next

            'rest zeichnen

            While c>0

              Local c1=slot_draw(c,inventar_x+150+x1,inventar_y+i*50)
              c:-c1
              x1:+50*c1*25

            Wend

          Next

        End If

      End If

    Next

    'hand slots zeichnen

  End If

  End If

End Function








