
Function player_calc_move_speed(index)

End Function

Function player_calc_animation_speed(index)

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

End Function


Function player_pos_up(index)

  If player_action_end[index]=1 Then
    If player_position[index]>0 Then
      Print "move positon up"
      player_position[index]:-1
    End If
  End If

End Function


Function player_pos_down(index)

  If player_action_end[index]=1 Then
    If player_position[index]<2 Then
      Print "move positon down"
      player_position[index]:+1
    End If
  End If

End Function



Function player_turn_left(index)

'suche die kürzeste richtung
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
    End If
  End If

End Function


Function player_turn_right(index)

'suche die kürzeste richtung
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
    End If
  End If

End Function



Function player_walk(index)

  If player_energy_ok(index,player_e_walk)=True Then

    Local x=player_get_x(player_align[index])
    Local y=player_get_y(player_align[index])

    If player_action_started[index]=1 Then
      player_action_started[index]=0
      reserve_world_player(player_world_x[index]+x,player_world_y[index]+y,player_world_z[index])

      Print "start walk to x="+(player_world_x[index]+x)+" y="+(player_world_y[index]+y)

    End If

    If player_move(index)=1 Then

      'ende erreicht

      player_energy[index]:-player_e_walk

      player_x[index]=0
      player_y[index]=0

      del_world_player(player_world_x[index],player_world_y[index],player_world_z[index])
      player_world_x[index]:+x
      player_world_y[index]:+y
      set_world_player(player_world_x[index],player_world_y[index],player_world_z[index],index)

      player_action_end[index]=1

      Print "end walk"

    End If

  End If

End Function




Function player_run(index)

  If player_energy_ok(index,player_e_run)=True Then

    Local x=player_get_x(player_align[index])
    Local y=player_get_y(player_align[index])

    If player_action_started[index]=1 Then
      player_action_started[index]=0
      reserve_world_player(player_world_x[index]+x,player_world_y[index]+y,player_world_z[index])

      Print "start run to x="+(player_world_x[index]+x)+" y="+(player_world_y[index]+y)

    End If

    If player_move(index)=1 Then

      'ende erreicht

      player_energy[index]:-player_e_run

      player_x[index]=0
      player_y[index]=0

      del_world_player(player_world_x[index],player_world_y[index],player_world_z[index])
      player_world_x[index]:+x
      player_world_y[index]:+y
      set_world_player(player_world_x[index],player_world_y[index],player_world_z[index],index)

      player_action_end[index]=1

      Print "end run"

    End If

  End If

End Function




Function player_swat(index)

  If player_energy_ok(index,player_e_swat)=True Then

    Local x=player_get_x(player_align[index])
    Local y=player_get_y(player_align[index])

    If player_action_started[index]=1 Then
      player_action_started[index]=0
      reserve_world_player(player_world_x[index]+x,player_world_y[index]+y,player_world_z[index])

      Print "start swat to x="+(player_world_x[index]+x)+" y="+(player_world_y[index]+y)

    End If

    If player_move(index)=1 Then

      'ende erreicht

      player_energy[index]:-player_e_swat

      player_x[index]=0
      player_y[index]=0

      del_world_player(player_world_x[index],player_world_y[index],player_world_z[index])
      player_world_x[index]:+x
      player_world_y[index]:+y
      set_world_player(player_world_x[index],player_world_y[index],player_world_z[index],index)

      player_action_end[index]=1

      Print "end swat"

    End If

  End If

End Function



Function player_crawl(index)

  If player_energy_ok(index,player_e_crawl)=True Then

    Local x=player_get_x(player_align[index])
    Local y=player_get_y(player_align[index])

    If player_action_started[index]=1 Then
      player_action_started[index]=0
      reserve_world_player(player_world_x[index]+x,player_world_y[index]+y,player_world_z[index])

      Print "start crawl to x="+(player_world_x[index]+x)+" y="+(player_world_y[index]+y)

    End If

    If player_move(index)=1 Then

      'ende erreicht

      player_energy[index]:-player_e_crawl

      player_x[index]=0
      player_y[index]=0

      del_world_player(player_world_x[index],player_world_y[index],player_world_z[index])
      player_world_x[index]:+x
      player_world_y[index]:+y
      set_world_player(player_world_x[index],player_world_y[index],player_world_z[index],index)

      player_action_end[index]=1

      Print "end crawl"

    End If

  End If

End Function




Function player_move(index)

  If MilliSecs()>player_move_t[index]+player_move_s[index] Then
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


