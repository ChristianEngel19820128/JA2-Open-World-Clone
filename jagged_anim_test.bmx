Strict

SeedRnd MilliSecs()

Global wx=1600
Global wy=900
Global wd=0
Global wh=0



Graphics wx,wy,wd,wh,graphics_backbuffer


SetBlend alphablend

'HideMouse()


Global font:timagefont=LoadImageFont("font/arial.ttf",12)
SetImageFont font



Include "jagged_main.bmx"



house_load()

merc_anim_load()
strings_load()
soldier_load()
map_init_topografic()

tiles_load()
world_init()
'world_cluster_activ_rand()
'world_cluster_activ[0,0]=1

'world_cluster_create(0,0,0,0)
'world_cluster_create(1,1,5,5)
world_cluster_create_map()



test()




Function do()

time_do()

world_cam_move()


If KeyHit(KEY_UP) Then
 If player_anim[0]<anim_max-1 Then player_anim[0]:+1
 player_animation_set(0)
 'player_animation_shift(0)
End If

If KeyHit(KEY_DOWN) Then
 If player_anim[0]>0 Then player_anim[0]:-1
 player_animation_set(0)
End If

If KeyHit(KEY_RIGHT) Then
 If player_align[0]<anim_align_max-1 Then player_align[0]:+1
 player_animation_set(0)
End If

If KeyHit(KEY_LEFT) Then
 If player_align[0]>0 Then player_align[0]:-1
 player_animation_set(0)
End If


'SetBlend solidblend
'world_cluster_draw_static(0,0,100,100)
'world_cluster_draw_static(1,0,600,100)
'world_cluster_draw_static(1,0,1000,100)
'world_cluster_draw_static(0,1,100,600)
'world_cluster_draw_static(1,1,600,600)
'world_cluster_draw_static(1,1,1000,600)
world_cluster_draw_screen()

'world_cluster_draw_dynamic(0,0,600,600)


player_animation_shift(0)
player_animation_draw(0,100,100)

'map_aktion_do()
'map_draw_topografic()


'laptop_do()
'group_move()


End Function






'hauptschleife









SetBlend alphablend

Global now:Int=MilliSecs()
Global ende:Byte=False
Global draw_t:Int=now

Global fps
Global fps_a
Global fps_t
Global fps_c
Global cycle

While ende=False

Cls

now=MilliSecs()

mouse=0
If MouseHit(1) Then mouse=1
If MouseHit(2) Then mouse=2

do()

cycle=cycle+1


If MilliSecs()-draw_t>0 Then

SetColor 0,0,0
DrawRect wx-240,0,240,50
SetColor 255,255,255

  DrawText "cycle: "+(MilliSecs()-now),wx-120,10
  DrawText "steps: "+cycle,wx-240,10 
  cycle=0




  fps_c=fps_c+1
  fps=1000/(MilliSecs()-fps_t+1)
  fps_a=fps_a+fps


  DrawText "fps: "+(fps_a/fps_c)+" "+fps,wx-240,30 
  DrawText "cycle: "+(MilliSecs()-fps_t),wx-120,30


  If fps_c>100 Then
   fps_a=fps_a/fps_c
   fps_c=1
  End If

  fps_t=MilliSecs()

  Flip(-1)
  draw_t=MilliSecs()

End If





If KeyHit(key_escape) Then ende=True
Wend

