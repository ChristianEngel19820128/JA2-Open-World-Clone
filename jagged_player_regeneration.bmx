

Function player_energy_reg(index)

  'oder wenn runde um

  If timestemp>player_energy_t[index]+player_energy_s[index] Then
    player_energy_t[index]=timestemp
    If player_energy[index]<player_energy_lowered[index] Then player_energy[index]:+1
  End If


End Function


Function player_regeneration()
  For Local i=0 To player_max-1

    If player[i]>0 Then

      If player_bleeding[i]>0 Then
        If timestemp>player_life_t[i]+(100-player_bleeding[i]) Then
          player_life_t[i]=timestemp
          If player_life[i]>0 Then
            player_life[i]:-1
          Else
            player_die(i)
          End If
        End If
      Else
        If timestemp>player_life_t[i]+player_life_s[i] Then
          player_life_t[i]=timestemp
          If player_life[i]<player_life_lowered[i] Then player_life[i]:+1
        End If
      End If


      If timestemp>player_schlaf_t[i]+player_schlaf_s[i] Then
        player_schlaf_t[i]=timestemp
        If player_schlaf[i]>0 Then
          player_schlaf[i]:-1
        Else
          If player_life[i]>0 Then
            player_life[i]:-1
          Else
            player_die(i)
          End If
        End If
      End If

      If timestemp>player_hunger_t[i]+player_hunger_s[i] Then
        player_hunger_t[i]=timestemp
        If player_hunger[i]>0 Then
          player_hunger[i]:-1
        Else
          If player_life[i]>0 Then
            player_life[i]:-1
          Else
            player_die(i)
          End If
        End If
      End If

      If timestemp>player_durst_t[i]+player_durst_s[i] Then
        player_durst_t[i]=timestemp
        If player_durst[i]>0 Then
          player_durst[i]:-1
        Else
          If player_life[i]>0 Then
            player_life[i]:-1
          Else
            player_die(i)
          End If
        End If
      End If

    End If

  Next
End Function


