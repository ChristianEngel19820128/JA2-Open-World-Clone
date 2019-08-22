
Function getc:String(s:String,l=15)

  Local c=GetChar()
  FlushKeys()

  If c=8 Then
    s=Left(s,Len(s)-1)
  Else
    If c>=32 And Len(s)<l Then
      s=s+Chr(c)
    End If
  End If

  Return s

End Function


Function loadbar(t:String,i=0,m=1,e=True)

	SetClsColor(0,0,0)
	Cls
	SetColor(255,255,255)
	Local s:String="Hier könnte ein Tipp stehen!"
	DrawText(s,wx/2-TextWidth(s)/2,wy/2-TextHeight(s)/2)
	DrawText(t,10,wy-60)
	DrawRect(0,wy-35,i*wx/m,15)
	Flip
	
	If KeyHit(key_escape) And e=True Then ende=True

End Function



Function button_draw(img:TImage,t:String,x,y,c11=255,c12=255,c13=255,c21=200,c22=200,c23=200)

  Local f=False

	SetColor(c11,c12,c13)
	
  If mouseover(x,y,x+ImageWidth(img),y+ImageHeight(img))=True Then

    SetColor(c21,c22,c23)

    If mouse=1 Then

      mouse=0

      f=True

    End If

  End If

  DrawImage(img,x,y)

	SetColor(0,0,0)
	
  DrawText(t,x+ImageWidth(img)/2-TextWidth(t)/2,y+ImageHeight(img)/2-TextHeight(t)/2)


  SetColor(255,255,255)

  Return f

End Function







Include "jagged_header.bmx"
Include "jagged_strings.bmx"
Include "jagged_soldiers.bmx"
Include "jagged_draw.bmx"
Include "jagged_sounds.bmx"
Include "jagged_time.bmx"
Include "jagged_weather.bmx"
Include "jagged_mouse.bmx"
Include "jagged_map.bmx"
Include "jagged_light.bmx"
Include "jagged_house.bmx"
Include "jagged_world.bmx"
Include "jagged_player.bmx"
Include "jagged_items.bmx"
Include "jagged_anim.bmx"
Include "jagged_laptop.bmx"
Include "jagged_test.bmx"








Function keys()

  If menu<>c_menu_laptop And KeyDown(KEY_L) Then
    menu=c_menu_laptop
    laptop_on=1
    laptop_load=0
    laptop_menu=0
    main_out()
  End If

  If menu<>c_menu_main And KeyDown(KEY_Q) Then
    menu=c_menu_main
    main_out()
  End If

End Function




Function main_init()

  strings_load()
  soldier_load()
  soldier_custom_load()
  merc_anim_load()
  tiles_load()
  house_load()
  

End Function



Function main_out()

  world_save()
  map_save()
  player_save()

End Function




Function main_menu_draw()

  SetClsColor(0,0,0)
  Cls

  Local space=40

  If button_draw(img_menu_button,strings[t_fortsetzen],wx/2-ImageWidth(img_menu_button)/2,wy/2+0*space-ImageHeight(img_menu_button)/2)=True Then
    Print "continue last game"
    laptop_get_start()
		menu=c_menu_laptop
		map_load()
  End If

  If button_draw(img_menu_button,strings[t_neustarten],wx/2-ImageWidth(img_menu_button)/2,wy/2+1*space-ImageHeight(img_menu_button)/2)=True Then
    Print "start new game"
    laptop_get_start()
		menu=c_menu_laptop
		map_init_topografic()
		player_clear()
		laptop_first_run=1
		laptop_user_player_init=0
  End If

  If button_draw(img_menu_button,strings[t_option],wx/2-ImageWidth(img_menu_button)/2,wy/2+2*space-ImageHeight(img_menu_button)/2)=True Then
    Print "open options"
		'menu=c_menu_option
  End If

  If button_draw(img_menu_button,strings[t_ende],wx/2-ImageWidth(img_menu_button)/2,wy/2+3*space-ImageHeight(img_menu_button)/2)=True Then
    Print "end programm"
		ende=True
  End If

End Function




Function main_do()

  Select menu

    Case c_menu_main

      main_menu_draw()

    Case c_menu_option

    Case c_menu_laptop

      laptop_do()
      time_do()
      group_move()
      keys()

    Case c_menu_world

      mouse_get_in_world()

      player_selection_do()
      player_selected_do()
      player_do()

      world_cluster_draw_screen()
      time_do()
      world_cam_move()
      keys()

  End Select

End Function
