
Function group_add_player(g,p)
  Local i=0
  Local f=False

  If group_player_count[g]<group_player_max Then
  While f=False And i<group_player_max
    If group_player[g,i]>0 Then
      i:+1
    Else
      group_player[g,i]=1
      group_player_index[g,i]=p

      player_group[p]=g

      group_player_role[g,i]=0
      
      If group_move_s[g]<player_move_s[p] Then group_move_s[g]=player_move_s[p]

      group_player_count[g]:+1

      f=True
      Return 1
    End If
  Wend
  End If

Return 0
End Function



Function group_del_player(g,i)
  group_player[g,i]=0
  group_player_count[g]:-1

  group_move_s[g]=0
  For Local k=0 To group_player_max-1
    If group_player[g,k]>0 Then
      If group_move_s[g]<player_move_s[group_player_index[g,k]] Then group_move_s[g]=player_move_s[group_player_index[g,k]]
    End If
  Next

  If group_player_count[g]<=0 Then
    group_del(g)
  End If
End Function

