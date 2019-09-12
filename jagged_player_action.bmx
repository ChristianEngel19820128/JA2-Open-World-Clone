

Function player_action_move(index)

  'copy tar to action

  If player_tar_list[index,0]=1 Then

    player_action[index]=player_tar_list_action[index,0]
    player_action_x[index]=player_tar_list_x[index,0]
    player_action_y[index]=player_tar_list_y[index,0]
    player_action_z[index]=player_tar_list_z[index,0]

    player_tar_shift(index)

  Else

    player_action[index]=player_act_stand
    Print "go idle"

  End If

    player_move_t[index]=MilliSecs()
    player_action_started[index]=1
    player_action_end[index]=0
    player_action_animation_set(index)

End Function





Function player_action_animation_set(index,a=0)

  Local an=player_anim_transition[index]

  Local h=player_check_hand(index)
  If world_ground_type[player_world_x[index],player_world_y[index],player_world_z[index]]=c_deep_water Or world_ground_type[player_world_x[index],player_world_y[index],player_world_z[index]]=c_pool_water Then h=0

  Select player_action[index]

    Case player_act_stand

       Select h

         Case 0

          'wenn player nichts in der hand hat

          Select world_ground_type[player_world_x[index],player_world_y[index],player_world_z[index]]
            Case c_water
              player_anim_transition[index]=player_anim_w_stand
            Case c_deep_water
              player_anim_transition[index]=player_anim_w_tred
            Case c_pool_water
              player_anim_transition[index]=player_anim_w_tred
            Default
              Select player_position[index]
                Case 0
                  player_anim_transition[index]=player_anim_stand
                Case 1
                  player_anim_transition[index]=player_anim_crouch
                Case 2
                  player_anim_transition[index]=player_anim_prone
              End Select
          End Select

       Case 1

      'wenn waffe rifle type

          Select world_ground_type[player_world_x[index],player_world_y[index],player_world_z[index]]
            Case c_water
              player_anim_transition[index]=player_anim_w_stand_r
            Default
              Select player_position[index]
                Case 0
                  player_anim_transition[index]=player_anim_stand_r
                Case 1
                  player_anim_transition[index]=player_anim_crouch_r
                Case 2
                  player_anim_transition[index]=player_anim_prone_r
              End Select
          End Select

       Case 2

       'pistol

          Select world_ground_type[player_world_x[index],player_world_y[index],player_world_z[index]]
            Case c_water
              player_anim_transition[index]=player_anim_w_stand
            Default
              Select player_position[index]
                Case 0
                  player_anim_transition[index]=player_anim_stand_p
                Case 1
                  player_anim_transition[index]=player_anim_crouch
                Case 2
                  player_anim_transition[index]=player_anim_prone
              End Select
          End Select

        Case 3

        'dbl pistol

          Select world_ground_type[player_world_x[index],player_world_y[index],player_world_z[index]]
            Case c_water
              player_anim_transition[index]=player_anim_w_stand
            Default
              Select player_position[index]
                Case 0
                  player_anim_transition[index]=player_anim_stand_d
                Case 1
                  player_anim_transition[index]=player_anim_crouch
                Case 2
                  player_anim_transition[index]=player_anim_prone
              End Select
          End Select

       End Select


    Case player_act_pos_up

      If player_position[index]>0 Then

      If h=1 Then
        If player_sex[index]=0 And player_position[index]=1 Then
          player_anim_transition[index]=player_anim_go_crouch_to_stand_trans_r
        Else
          Select player_position[index]
            Case 2
              player_anim_transition[index]=player_anim_go_prone_to_crouch_r
            Case 1
              player_anim_transition[index]=player_anim_go_crouch_to_stand_r
          End Select
        End If
      Else

        Select player_position[index]
          Case 2
            player_anim_transition[index]=player_anim_go_prone_to_crouch
          Case 1
            player_anim_transition[index]=player_anim_go_crouch_to_stand
        End Select

      End If

      Else
        player_action[index]=player_act_stand
        player_action_animation_set(index)
        Return 0
      End If

    Case player_act_pos_down

      If player_position[index]<2 Then

      If h=1 Then
        If player_sex[index]=0 And player_position[index]=0 Then
          player_anim_transition[index]=player_anim_go_stand_to_crouch_trans_r
        Else
          Select player_position[index]
            Case 0
              player_anim_transition[index]=player_anim_go_stand_to_crouch_r
            Case 1
              player_anim_transition[index]=player_anim_go_crouch_to_prone_r
          End Select
        End If
      Else

        Select player_position[index]
          Case 0
            player_anim_transition[index]=player_anim_go_stand_to_crouch
          Case 1
            player_anim_transition[index]=player_anim_go_crouch_to_prone
        End Select

      End If

      Else
        player_action[index]=player_act_stand
        player_action_animation_set(index)
        Return 0
      End If

    Case player_act_walk
      If h=1 Then
        player_anim_transition[index]=player_anim_walk_r
      Else
        player_anim_transition[index]=player_anim_walk
      End If

    Case player_act_run
      If h=1 Then
        player_anim_transition[index]=player_anim_run_r
      Else
        player_anim_transition[index]=player_anim_run
      End If

    Case player_act_swat
      If h=1 Then
        player_anim_transition[index]=player_anim_swat_r
      Else
        player_anim_transition[index]=player_anim_swat
      End If

    Case player_act_crawl
      If h=1 Then
        player_anim_transition[index]=player_anim_crawl_r
      Else
        player_anim_transition[index]=player_anim_crawl
      End If

    Case player_act_w_walk
      If h=1 Then
        player_anim_transition[index]=player_anim_w_walk_r
      Else
        player_anim_transition[index]=player_anim_w_walk
      End If

    Case player_act_w_swim
      player_anim_transition[index]=player_anim_w_swim

    Case player_act_w_swimfast
      player_anim_transition[index]=player_anim_w_swimfast

  End Select

  If an<>player_anim_transition[index] Or a=1 Then
    player_animation_set(index)
  End If

End Function






Function player_action_do(index)

'führe den nächsten schritt in der liste aus
'wenn blockiert liste neu erstellen

'wenn vergesslich random player_tar_del
'wenn energy low player_tar_del

  Local h=player_check_hand(index)

      Select player_action[index]

        Case player_act_stand
          player_idle(index)

        Case player_act_pos_up
          player_pos_up(index)
        Case player_act_pos_down
          player_pos_down(index)

        Case player_act_turn_left
          player_turn_left(index)
        Case player_act_turn_right
          player_turn_right(index)

        Case player_act_walk
          If h=1 Then
            player_moving(index,player_e_walk_r)
          Else
            player_moving(index,player_e_walk)
          End If

        Case player_act_run
          If h=1 Then
            player_moving(index,player_e_run_r)
          Else
            player_moving(index,player_e_run)
          End If

        Case player_act_swat
          If h=1 Then
            player_moving(index,player_e_swat_r)
          Else
            player_moving(index,player_e_swat)
          End If

        Case player_act_crawl
          If h=1 Then
            player_moving(index,player_e_crawl_r)
          Else
            player_moving(index,player_e_crawl)
          End If

        Case player_act_w_walk
          If h=1 Then
            player_moving(index,player_e_w_walk_r)
          Else
            player_moving(index,player_e_w_walk)
          End If

        Case player_act_w_swim
          player_moving(index,player_e_w_swim)

        Case player_act_w_swimfast
          player_moving(index,player_e_w_swimfast)

      End Select


End Function