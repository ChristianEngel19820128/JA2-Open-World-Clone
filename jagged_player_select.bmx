
Function player_select_new(index)
  Local i=0
  Local f=False
  While f=False And i<player_select_max
    If player_select[i]=1 Then
      i:+1
    Else
      player_select[i]=1
      player_select_index[i]=index

      player_select_count:+1

      player_selected[index]=1
      player_select_pos[index]=i

      f=True
      Return i
    End If
  Wend
  Return -1
End Function


Function player_select_del(i)
  player_selected[player_select_index[i]]=0
  player_select[i]=0
  If player_select_count>0 Then player_select_count:-1
End Function

Function player_select_del_all()
  For Local i=0 To player_select_max-1
    player_selected[player_select_index[i]]=0
    player_select[i]=0
  Next
  player_select_count=0
End Function


Function player_select_find(index)
  Local i=0
  Local f=False
  While f=False And i<player_select_max
    If player_select[i]=0 Then
      i:+1
    Else
      If player_select_index[i]=index Then
        f=True
        Return i
      Else
        i:+1
      End If
    End If
  Wend
  Return -1
End Function


Function player_selection_do()
  If mouse_world=1 Then
    If world_obj_type[mouse_world_x,mouse_world_y,mouse_world_z]=world_obj_player Then
      If player_fraction[world_obj_index[mouse_world_x,mouse_world_y,mouse_world_z]]=fraction_player Then
        If shift=1 And mouse=1 Then
          If player_selected[world_obj_index[mouse_world_x,mouse_world_y,mouse_world_z]]=1 Then
            'söldner herrausnehmen
            player_select_del(player_select_pos[world_obj_index[mouse_world_x,mouse_world_y,mouse_world_z]])
          Else
            'söldner hinzufügen
            player_select_new(world_obj_index[mouse_world_x,mouse_world_y,mouse_world_z])
          End If
          mouse=0
        Else
          If mouse=1 Then
            'söldner auswählen
            player_select_del_all()
            player_select_new(world_obj_index[mouse_world_x,mouse_world_y,mouse_world_z])
            mouse=0
          End If
        End If
      End If
    End If
  End If
End Function




'klick in welt dann tar und action überschreiben

'shift klick auf söldner zur auswahl hinzufügen

'strg klick in der welt aufsammeln
'strg klick auf ein objekt aktion ausführen
'(tür öffnen, verschlossene tür aufbrechen/knacken je nach werkzeug in der hand, kiste öffnen)



Function player_selected_action(i)

  Local action



  If strg=1 And mouse=1 Then
    'objekt aktion ausführen
    If world_obj_type[mouse_world_x,mouse_world_y,mouse_world_z]=world_obj_container Then
      'objekt öffen
      action=player_act_open
    End If
    If world_obj_type[mouse_world_x,mouse_world_y,mouse_world_z]=0 And is_item(mouse_world_x,mouse_world_y,mouse_world_z)=True Then
      'item aufsammeln
      action=player_act_pickup
    End If
    If world_obj_type[mouse_world_x,mouse_world_y,mouse_world_z]=0 And is_item(mouse_world_x,mouse_world_y,mouse_world_z)=False Then
      'an position bewegen
      Select player_position[player_select_index[i]]
        Case 0
          action=player_act_walk
        Case 1
          action=player_act_swat
        Case 2
          action=player_act_crawl
      End Select
    End If

  Else

    If shift=1 And mouse=1 Then

        'an position rennen
        If world_obj_type[mouse_world_x,mouse_world_y,mouse_world_z]=0 Then
          action=player_act_run
        End If

    Else

      If mouse=1 Then
        'an position bewegen
        If world_obj_type[mouse_world_x,mouse_world_y,mouse_world_z]=0 Then
          
          Select player_position[player_select_index[i]]
            Case 0
              action=player_act_walk
            Case 1
              action=player_act_swat
            Case 2
              action=player_act_crawl
          End Select

        End If

      End If

    End If

  End If

  If action>0 Then

    If alt=0 Then
      player_tar_del(player_select_index[i])
    End If

    If player_tar_set_list(player_select_index[i],mouse_world_x,mouse_world_y,action)=False Then
      player_tar_del(player_select_index[i])
      Print "no short way"
    Else
      Print "move to x="+mouse_world_x+" y="+mouse_world_y
    End If

  End If

End Function



Function player_selected_keys()

  'position one step up
  If KeyHit(KEY_PAGEUP) Then
    For Local i=0 To player_select_max-1
      If player_select[i]>0 Then
        If player_position[i]>0 Then
          player_tar_del(player_select_index[i])
          player_tar_add(player_select_index[i],player_world_x[player_select_index[i]],player_world_y[player_select_index[i]],player_act_pos_up)
        End If
      End If
    Next
  End If

  'position one step down
  If KeyHit(KEY_PAGEDOWN) Then
    For Local i=0 To player_select_max-1
      If player_select[i]>0 Then
        If player_position[i]<2 Then
          player_tar_del(player_select_index[i])
          player_tar_add(player_select_index[i],player_world_x[player_select_index[i]],player_world_y[player_select_index[i]],player_act_pos_down)
        End If
      End If
    Next
  End If

  'View Rotation to mousepointer
  If KeyHit(KEY_R) Then
    For Local i=0 To player_select_max-1

    Next
  End If

End Function




Function player_selected_do()

  If player_select_count>0 Then
    If mouse=1 Then
      For Local i=0 To player_select_max-1
        If player_select[i]>0 Then
          player_selected_action(i)
        End If
      Next
      mouse=0
    End If
    If mouse=2 Then
      'aim aber für wen? eigentlich nur im runden modus
      mouse=0
    End If
    player_selected_keys()
  End If

End Function

