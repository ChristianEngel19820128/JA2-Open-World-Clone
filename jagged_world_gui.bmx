


Include "jagged_world_gui_header.bmx"



Function stats_draw()


  DrawImage img_world_minimap,0,0


  DrawImage(img_stats,stats_x,stats_y)
  DrawImage(img_inventory,player_inv_x,player_inv_y)


  DrawText player_life[0]+"/"+player_life_max[0],50,wy-80
  DrawText player_energy[0]+"/"+player_energy_max[0],50,wy-50

  DrawText player_tar_main_x[0]+"/"+player_tar_main_y[0],150,wy-80
  DrawText player_world_x[0]+"/"+player_world_y[0],150,wy-50
  DrawText player_x[0]+"/"+player_y[0],150,wy-30


  If player_hurt[0]>0 Then DrawImage img_cross,stats_x+98,stats_y+74
  If player_bleeding[0]>0 Then DrawImage img_blood,stats_x+114,stats_y+74
  If player_venomed[0]>0 Then DrawImage img_toxic,stats_x+130,stats_y+74
  If player_freeze[0]>0 Then DrawImage img_freeze,stats_x+146,stats_y+74
  If player_sick[0]>0 Then DrawImage img_sick,stats_x+162,stats_y+74


  If player_bleeding[0]>0 Then
    SetColor 255,255,0
  Else
    SetColor 255,88,66
  End If
  DrawRect stats_x+99,stats_y+7+61,3,-(61*player_life_lowered[0]/player_life_max[0])
  SetColor 255,0,0
  DrawRect stats_x+99,stats_y+7+61,3,-(61*player_life[0]/player_life_max[0])


  SetColor 0,88,255
  DrawRect stats_x+108,stats_y+7+61,3,-(61*player_energy_lowered[0]/player_energy_max[0])
  SetColor 0,0,255
  DrawRect stats_x+108,stats_y+7+61,3,-(61*player_energy[0]/player_energy_max[0])

  SetColor 0,255,0
  DrawRect stats_x+117,stats_y+7+61,3,-(61*player_moral[0]/100)


  SetColor 255,255,255
  DrawRect stats_x+129,stats_y+7+61,3,-(61*player_schlaf[0]/player_schlaf_max[0])

  SetColor 255,88,66
  DrawRect stats_x+138,stats_y+7+61,3,-(61*player_hunger[0]/player_hunger_max[0])

  SetColor 0,155,255
  DrawRect stats_x+147,stats_y+7+61,3,-(61*player_durst[0]/player_durst_max[0])



  SetColor 255,255,255
  SetScale 1,1


End Function


