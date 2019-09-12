
Function group_new(x,y,fraction)
  Local i=0
  Local f=False

  If fraction>0 Or (fraction=fraction_player And group_count<group_count_max) Then
  While f=False And i<group_max

    If group[i]>0 Then
      i:+1
    Else

      group[i]=1
      group_fraction[i]=fraction

      group_map_x[i]=x
      group_map_y[i]=y

      group_move_t[i]=timestemp
      group_move_s[i]=0

      group_position_set[i]=0

      For Local k=0 To group_player_max-1
        group_player[i,k]=0
        group_player_role[i,k]=0
      Next

      If fraction=fraction_player Then group_count:+1

      group_player_count[i]=0

      f=True
      Return i
    End If
  Wend
  End If
  Return -1
End Function



Function group_del(g)
  group[g]=0
  If group_fraction[g]=fraction_player Then group_count:-1
End Function




Function group_pos_in_world(g)

  If group_position_set[g]=0 Then

  Select group_position[g]

    Case north

      For Local k=0 To group_player_max-1
        If group_player[g,k]=1 Then

          player_map_x[k]=group_map_x[g]
          player_map_y[k]=group_map_y[g]

          player_world_x[k]=0
          player_world_y[k]=0
          
          player_world_z[k]=0

          player_x[k]=0
          player_y[k]=0
          player_z[k]=0

          player_align[k]=south          
          player_action_animation_set(k,1)

          set_world_player(player_x[k],player_y[k],player_z[k],group_player_index[g,k])

        End If
      Next

    Case south

      For Local k=0 To group_player_max-1
        If group_player[g,k]=1 Then

          player_map_x[k]=group_map_x[g]
          player_map_y[k]=group_map_y[g]

          player_world_x[k]=world_x-1
          player_world_y[k]=world_y-1
          player_world_z[k]=0

          player_x[k]=0
          player_y[k]=0
          player_z[k]=0

          player_align[k]=north   
          player_action_animation_set(k,1)       

          set_world_player(player_x[k],player_y[k],player_z[k],group_player_index[g,k])

        End If
      Next

    Case east

      For Local k=0 To group_player_max-1
        If group_player[g,k]=1 Then

          player_map_x[k]=group_map_x[g]
          player_map_y[k]=group_map_y[g]

          player_world_x[k]=world_x-1
          player_world_y[k]=0
          player_world_z[k]=0

          player_x[k]=0
          player_y[k]=0
          player_z[k]=0

          player_align[k]=west   
          player_action_animation_set(k,1)       

          set_world_player(player_x[k],player_y[k],player_z[k],group_player_index[g,k])

        End If
      Next

    Case west

      For Local k=0 To group_player_max-1
        If group_player[g,k]=1 Then

          player_map_x[k]=group_map_x[g]
          player_map_y[k]=group_map_y[g]

          player_world_x[k]=0
          player_world_y[k]=world_y-1
          player_world_z[k]=0

          player_x[k]=0
          player_y[k]=0
          player_z[k]=0

          player_align[k]=east   
          player_action_animation_set(k,1)       

          set_world_player(player_x[k],player_y[k],player_z[k],group_player_index[g,k])

        End If
      Next

    Case northeast

      For Local k=0 To group_player_max-1
        If group_player[g,k]=1 Then

          player_map_x[k]=group_map_x[g]
          player_map_y[k]=group_map_y[g]

          player_world_x[k]=0
          player_world_y[k]=(world_y-1)/2
          player_world_z[k]=0

          player_x[k]=0
          player_y[k]=0
          player_z[k]=0

          player_align[k]=southwest  
          player_action_animation_set(k,1)        

          set_world_player(player_x[k],player_y[k],player_z[k],group_player_index[g,k])

        End If
      Next

    Case northwest

      For Local k=0 To group_player_max-1
        If group_player[g,k]=1 Then

          player_map_x[k]=group_map_x[g]
          player_map_y[k]=group_map_y[g]

          player_world_x[k]=(world_x-1)/2
          player_world_y[k]=0
          player_world_z[k]=0

          player_x[k]=0
          player_y[k]=0
          player_z[k]=0

          player_align[k]=southeast  
          player_action_animation_set(k,1)        

          set_world_player(player_x[k],player_y[k],player_z[k],group_player_index[g,k])

        End If
      Next

    Case southeast

      For Local k=0 To group_player_max-1
        If group_player[g,k]=1 Then

          player_map_x[k]=group_map_x[g]
          player_map_y[k]=group_map_y[g]

          player_world_x[k]=(world_x-1)/2
          player_world_y[k]=world_y-1
          player_world_z[k]=0

          player_x[k]=0
          player_y[k]=0
          player_z[k]=0

          player_align[k]=northwest  
          player_action_animation_set(k,1)        

          set_world_player(player_x[k],player_y[k],player_z[k],group_player_index[g,k])

        End If
      Next

    Case southwest

      For Local k=0 To group_player_max-1
        If group_player[g,k]=1 Then

          player_map_x[k]=group_map_x[g]
          player_map_y[k]=group_map_y[g]

          player_world_x[k]=world_x-1
          player_world_y[k]=(world_y-1)/2
          player_world_z[k]=0

          player_x[k]=0
          player_y[k]=0
          player_z[k]=0

          player_align[k]=northeast   
          player_action_animation_set(k,1)       

          set_world_player(player_x[k],player_y[k],player_z[k],group_player_index[g,k])

        End If
      Next

  End Select

    group_position_set[g]=1

  End If

End Function




