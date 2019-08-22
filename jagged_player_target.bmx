


Function player_tar_set(index,i,x,y,action)

  player_tar_list[index,i]=1
  player_tar_list_count[index]:+1
  player_tar_list_action[index,i]=action
  player_tar_list_x[index,i]=x
  player_tar_list_y[index,i]=y

  If player_action[index]=player_act_stand Then
    player_action_end[index]=1
  End If

End Function



Function player_tar_add(index,x,y,action)

  Local i=player_tar_list_count[index]
  Local f=False
  While f=False And i<player_tar_max
    If player_tar_list[index,i]=0 Then

      player_tar_set(index,i,x,y,action)
      f=True
      Print "add tagret x="+x+" y="+y+" action="+action

      Return True

    Else

      i:+1

    End If
  Wend

  Return False

End Function



Function player_tar_shift(index)

  If player_tar_list_count[index]>0 Then

    Local i=0
    While i<player_tar_max-2 And player_tar_list[index,i+1]=1

      player_tar_list_action[index,i]=player_tar_list_action[index,i+1]
      player_tar_list_x[index,i]=player_tar_list_x[index,i+1]
      player_tar_list_y[index,i]=player_tar_list_y[index,i+1]
      player_tar_list_z[index,i]=player_tar_list_z[index,i+1]

      i:+1

    Wend

    player_tar_list[index,i]=0
    player_tar_list_count[index]:-1

    Print "shift targets"
    Print "targets left "+player_tar_list_count[index]

  End If

End Function



Function player_tar_del(index)

  player_tar_list_count[index]=0
  For Local i=0 To player_tar_max-1
    player_tar_list[index,i]=0
  Next
  Print "delete all targets"

End Function



Function player_tar_set_list(index,x,y,action)

  Local f=False

  If player_eigenschaften[index,c_pfadfinder]=0 Then
    'kürzesten weg
    Print "search shortest way to x="+x+" y="+y
    f=player_way_find_short(index,x,y,action)
  Else
    'schnelster weg
    Print "search fastest way to x="+x+" y="+y
    f=player_way_find_fast(index,x,y,action)
  End If

  Return f

End Function