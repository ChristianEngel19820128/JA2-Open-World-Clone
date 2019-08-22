

Function player_load()

End Function


Function player_save()

End Function



Function player_clear()

  For Local i=0 To player_max-1
    player[i]=0
  Next

End Function


Function player_clear_data(index)

  player_name[index]=""
  player_nick[index]=""

  player_soldier[index]=0

  player_handed[index]=player_righthand
  player_sex[index]=0


  For Local i=0 To player_attribute_max-1
    player_attribute[index,i]=1
  Next

  For Local i=0 To player_fertigkeiten_max-1
    player_fertigkeiten[index,i]=1
  Next

  For Local i=0 To player_wissen_max-1
    player_wissen[index,i]=1
  Next

  For Local i=0 To player_eigenschaften_max-1
    player_eigenschaften[index,i]=0
  Next

  player_eigenschaften_selected[index]=0

	player_fraction[index]=0
	player_group[index]=0

	player_color_hair_r[index]=127
	player_color_hair_g[index]=51
	player_color_hair_b[index]=0
	
	player_color_shirt_r[index]=38
	player_color_shirt_g[index]=127
	player_color_shirt_b[index]=0
	
	player_color_skin_r[index]=255
	player_color_skin_g[index]=178
	player_color_skin_b[index]=127
	
	player_color_pants_r[index]=48
	player_color_pants_g[index]=48
	player_color_pants_b[index]=48
	
	
	player_map_x[index]=0
	player_map_y[index]=0

	player_world_x[index]=0
	player_world_y[index]=0
	player_world_z[index]=0
	
	player_x[index]=0
	player_y[index]=0
	player_z[index]=0
	
	
	player_life_max[index]=100
	player_life_lowered[index]=100
	player_life[index]=100
	player_life_s[index]=60
	
	player_hurt[index]=0
	player_bleeding[index]=0
	player_venomed[index]=0
	player_freeze[index]=0
	player_sick[index]=0
	
	player_exhaustion[index]=0
	
	player_energy_max[index]=500
	player_energy_lowered[index]=500
	player_energy[index]=500
	player_energy_s[index]=1
	
	player_moral[index]=50
	player_moral[index]=50
	player_angst[index]=50
	player_hoffnung[index]=50
	player_vertrauen[index]=50
	player_neugier[index]=50
	
	player_hunger_max[index]=500
	player_hunger[index]=500
	player_hunger_s[index]=5
	
	player_durst_max[index]=250
	player_durst[index]=250
	player_durst_s[index]=5
	
	player_schlaf_max[index]=1000
	player_schlaf[index]=1000
	player_schlaf_s[index]=5
	
	player_move_s[index]=50
	player_anim_s[index]=100
	
	player_anim_transition[index]=player_anim_stand
	player_animation_set(index)



End Function


Function player_new()
  Local i=0
  Local f=False
  While f=False And i<player_max
    If player[i]>0 Then
      i:+1
    Else
      player[i]=1
      f=True
      Return i
    End If
  Wend
  Return -1
End Function


Function player_create(i)
  If i>=0 Then

  End If
End Function



Function player_del(index)
  player[index]=0
End Function


Function player_die(index)


End Function


Function player_get_vx(a)
  Local x
  Select a
    Case south
      x=0
    Case southeast
      x=2
    Case southwest
      x=-2
    Case west
      x=-2
    Case north
      x=0
    Case northeast
      x=2
    Case northwest
      x=-2
    Case east
      x=2
  End Select
  Return x
End Function

Function player_get_vy(a)
  Local y
  Select a
    Case south
      y=1
    Case southeast
      y=1
    Case southwest
      y=1
    Case west
      y=0
    Case north
      y=-1
    Case northeast
      y=-1
    Case northwest
      y=-1
    Case east
      y=0
  End Select
  Return y
End Function


Function player_get_x(a)
  Local x
  Select a
    Case south
      x=1
    Case southeast
      x=1
    Case southwest
      x=0
    Case west
      x=-1
    Case north
      x=-1
    Case northeast
      x=0
    Case northwest
      x=-1
    Case east
      x=1
  End Select
  Return x
End Function

Function player_get_y(a)
  Local y
  Select a
    Case south
      y=1
    Case southeast
      y=0
    Case southwest
      y=1
    Case west
      y=1
    Case north
      y=-1
    Case northeast
      y=-1
    Case northwest
      y=0
    Case east
      y=-1
  End Select
  Return y
End Function

Function player_get_align(x,y)
  Local a
  If x=1 And y=1 Then a=south
  If x=1 And y=0 Then a=southeast
  If x=0 And y=1 Then a=southwest
  If x=-1 And y=1 Then a=west
  If x=-1 And y=-1 Then a=north
  If x=0 And y=-1 Then a=northeast
  If x=-1 And y=0 Then a=northwest
  If x=1 And y=-1 Then a=east
  Return a
End Function








Function player_do()
  For Local i=0 To player_max-1
    If player[i]>0 Then
      If player_map_x[i]=world_map_x And player_map_y[i]=world_map_y Then

        player_calc_move_speed(i)
        player_calc_animation_speed(i)

        player_animation_shift(i)

        player_action_do(i)

        If player_action_end[i]=1 Then
          player_action_move(i)
        End If


      Else
        'alle Spieler auﬂerhalb der karte
      End If
    End If
  Next
End Function

