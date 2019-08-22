

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

  Select player_action[index]

    Case player_act_stand

      Select player_position[index]
        Case 0
          player_anim_transition[index]=player_anim_stand
        Case 1
          player_anim_transition[index]=player_anim_crouch
        Case 2
          player_anim_transition[index]=player_anim_prone
      End Select

      'wenn waffe jeglicher art
      'wenn liegend
      'wenn gebückt
      'wenn im wasser
      'wenn im tiefen wasser

    Case player_act_pos_up

      Select player_position[index]
        Case 2
          player_anim_transition[index]=player_anim_go_prone_to_crouch
        Case 1
          player_anim_transition[index]=player_anim_go_crouch_to_stand
      End Select

    Case player_act_pos_down

      Select player_position[index]
        Case 0
          player_anim_transition[index]=player_anim_go_stand_to_crouch
        Case 1
          player_anim_transition[index]=player_anim_go_crouch_to_prone
      End Select

    Case player_act_walk
      player_anim_transition[index]=player_anim_walk
    Case player_act_run
      player_anim_transition[index]=player_anim_run
    Case player_act_swat
      player_anim_transition[index]=player_anim_swat
    Case player_act_crawl
      player_anim_transition[index]=player_anim_crawl

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
          player_walk(index)

        Case player_act_run
          player_run(index)

        Case player_act_swat
          player_swat(index)

        Case player_act_crawl
          player_crawl(index)

      End Select


End Function