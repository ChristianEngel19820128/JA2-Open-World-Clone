
Function player_calc_move_speed(index)

End Function

Function player_calc_animation_speed(index)

End Function



Function player_energy_drain(index,energy)

  If energy<=player_energy[index] Then
    player_energy[index]:-energy
    'aktionspunkte abziehen
  End If

End Function




Function player_energy_ok(index,energy)

  If player_energy[index]>energy Then
    If player_energy[index]>0.25*player_energy_max[index] Or player_exhaustion[index]=1 Then

      Return True

    Else

      player_tar_del(index)
      player_exhaustion[index]=1
      player_action_end[index]=1
      'ton ausgabe erschöpfung
      Print "exhaustion"
    End If

  Else

    player_tar_del(index)
    player_exhaustion[index]=2
    player_action_end[index]=1
    'falle in ohnmacht
    'ton ausgabe ko
    Print "ko exhaustion"

  End If

  Return False

End Function



Function player_idle(index)

  'fülle energie wieder auf

  player_energy_reg(index)


End Function


Function player_pos_up(index)

  If player_action_end[index]=1 Then
    If player_position[index]>0 Then
      If player_energy_ok(index,player_e_pos_change)=True Then
        Print "move positon up"
        player_position[index]:-1
        player_energy_drain(index,player_e_pos_change)
      End If
    End If
  End If

End Function


Function player_pos_down(index)

  If player_action_end[index]=1 Then
    If player_position[index]<2 Then
      If player_energy_ok(index,player_e_pos_change)=True Then
        Print "move positon down"
        player_position[index]:+1
        player_energy_drain(index,player_e_pos_change)
      End If
    End If
  End If

End Function



Function player_turn_left(index)

'ändere die align
'verbrauche aktionspunkte
'verbrauche energie

  If MilliSecs()>player_move_t[index]+player_move_s[index] Then
    player_move_t[index]=MilliSecs()
    If player_energy_ok(index,player_e_turn)=True Then
      Print "turn align left"
      player_align[index]:-1
      If player_align[index]<0 Then
        player_align[index]=7
      End If
      player_action_animation_set(index,1)
      player_action_end[index]=1
      player_energy_drain(index,player_e_turn)
    End If
  End If

End Function


Function player_turn_right(index)

'ändere die align
'verbrauche aktionspunkte
'verbrauche energie

  If MilliSecs()>player_move_t[index]+player_move_s[index] Then
    player_move_t[index]=MilliSecs()
    If player_energy_ok(index,player_e_turn)=True Then
      Print "turn align right"
      player_align[index]:+1
      If player_align[index]>7 Then
        player_align[index]=0
      End If
      player_action_animation_set(index,1)
      player_action_end[index]=1
      player_energy_drain(index,player_e_turn)
    End If
  End If

End Function




Function player_moving(index,e)

  Local x=player_get_x(player_align[index])
  Local y=player_get_y(player_align[index])

  If world_ambient_type[player_world_x[index]+x,player_world_y[index]+y,player_world_z[index]]>0 Then e:+4

  If player_energy_ok(index,e)=True Then

    If player_action_started[index]=1 Then
      player_action_started[index]=0
      reserve_world_player(player_world_x[index]+x,player_world_y[index]+y,player_world_z[index])

      Print "start move to x="+(player_world_x[index]+x)+" y="+(player_world_y[index]+y)

    End If

    If player_move(index)=1 Then

      'ende erreicht

      player_energy_drain(index,e)

      player_x[index]=0
      player_y[index]=0

      del_world_player(player_world_x[index],player_world_y[index],player_world_z[index])
      player_world_x[index]:+x
      player_world_y[index]:+y
      set_world_player(player_world_x[index],player_world_y[index],player_world_z[index],index)

      player_action_end[index]=1

      Print "end move"

    End If

  End If

End Function









Function player_move(index)

  If now>player_move_t[index]+player_move_s[index] Then
    player_move_t[index]=MilliSecs()

    Local x=player_get_vx(player_align[index])
    Local y=player_get_vy(player_align[index])

    player_x[index]:+x
    player_y[index]:+y

    If player_align[index]=north Or player_align[index]=south Or player_align[index]=west Or player_align[index]=east Then
      If player_x[index]<-40 Or player_x[index]>40 Or player_y[index]<-20 Or player_y[index]>20 Then
        Return 1
      End If
    Else
      If player_x[index]<-20 Or player_x[index]>20 Or player_y[index]<-10 Or player_y[index]>10 Then
        Return 1
      End If
    End If
  End If

  Return 0

End Function


