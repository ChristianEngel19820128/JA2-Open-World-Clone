

'------------------------------------------------------------------------------------------
' cursors
'------------------------------------------------------------------------------------------

Const cur_none=0
Const cur_walk=1
Const cur_target=2
Const cur_grab_item=3
Const cur_standard=4
Const cur_switch=5

Const cursor_max=6

Global cursor_i
Global cursor_t
Global cursor_s=125
Global cursor_type
Global cursor_img_max[cursor_max]


cursor_img_max[cur_target]=7
Global img_cur_target:TImage[7]

img_cur_target[0]=LoadImage("gfx/cursors/target_00.png",0)
img_cur_target[1]=LoadImage("gfx/cursors/target_01.png",0)
img_cur_target[2]=LoadImage("gfx/cursors/target_02.png",0)
img_cur_target[3]=LoadImage("gfx/cursors/target_03.png",0)
img_cur_target[4]=LoadImage("gfx/cursors/target_04.png",0)
img_cur_target[5]=LoadImage("gfx/cursors/target_05.png",0)
img_cur_target[6]=LoadImage("gfx/cursors/target_06.png",0)

For Local i=0 To 6
MidHandleImage img_cur_target[i]
Next

cursor_img_max[cur_walk]=11
Global img_cur_walk:TImage[11]

img_cur_walk[0]=LoadImage("gfx/cursors/walk_00.png",0)
img_cur_walk[1]=LoadImage("gfx/cursors/walk_01.png",0)
img_cur_walk[2]=LoadImage("gfx/cursors/walk_02.png",0)
img_cur_walk[3]=LoadImage("gfx/cursors/walk_03.png",0)
img_cur_walk[4]=LoadImage("gfx/cursors/walk_04.png",0)
img_cur_walk[5]=LoadImage("gfx/cursors/walk_05.png",0)
img_cur_walk[6]=LoadImage("gfx/cursors/walk_06.png",0)
img_cur_walk[7]=LoadImage("gfx/cursors/walk_07.png",0)
img_cur_walk[8]=LoadImage("gfx/cursors/walk_08.png",0)
img_cur_walk[9]=LoadImage("gfx/cursors/walk_09.png",0)
img_cur_walk[10]=LoadImage("gfx/cursors/walk_10.png",0)

For Local i=0 To 10
MidHandleImage img_cur_walk[i]
Next

cursor_img_max[cur_grab_item]=3
Global img_cur_grab_item:TImage[3]

img_cur_grab_item[0]=LoadImage("gfx/cursors/grab_00.png",0)
img_cur_grab_item[1]=LoadImage("gfx/cursors/grab_01.png",0)
img_cur_grab_item[2]=LoadImage("gfx/cursors/grab_02.png",0)

For Local i=0 To 2
MidHandleImage img_cur_grab_item[i]
Next

cursor_img_max[cur_switch]=11
Global img_cur_switch:TImage[11]

img_cur_switch[0]=LoadImage("gfx/cursors/switch_00.png",0)
img_cur_switch[1]=LoadImage("gfx/cursors/switch_01.png",0)
img_cur_switch[2]=LoadImage("gfx/cursors/switch_02.png",0)
img_cur_switch[3]=LoadImage("gfx/cursors/switch_03.png",0)
img_cur_switch[4]=LoadImage("gfx/cursors/switch_04.png",0)
img_cur_switch[5]=LoadImage("gfx/cursors/switch_05.png",0)
img_cur_switch[6]=LoadImage("gfx/cursors/switch_06.png",0)
img_cur_switch[7]=LoadImage("gfx/cursors/switch_07.png",0)
img_cur_switch[8]=LoadImage("gfx/cursors/switch_08.png",0)
img_cur_switch[9]=LoadImage("gfx/cursors/switch_09.png",0)
img_cur_switch[10]=LoadImage("gfx/cursors/switch_10.png",0)

For Local i=0 To 10
MidHandleImage img_cur_switch[i]
Next


cursor_img_max[cur_standard]=1
Global img_cur_standard:TImage[1]

img_cur_standard[0]=LoadImage("gfx/cursors/cursor_00.png",0)

For Local i=0 To 0
MidHandleImage img_cur_standard[i]
Next

Function cursor_set(t)
  cursor_type=t
End Function

Function cursor_draw()

  If MilliSecs()>cursor_t+cursor_s Then
    cursor_t=MilliSecs()
    cursor_i:+1
  End If

  If cursor_i>cursor_img_max[cursor_type]-1 Then cursor_i=0

  Select cursor_type
    Case cur_walk
      DrawImage(img_cur_walk[cursor_i],MouseX(),MouseY())
    Case cur_target 
      DrawImage(img_cur_target[cursor_i],MouseX(),MouseY())
    Case cur_grab_item
      DrawImage(img_cur_grab_item[cursor_i],MouseX(),MouseY())
    Case cur_standard
      DrawImage(img_cur_standard[cursor_i],MouseX(),MouseY())
    Case cur_switch
      DrawImage(img_cur_switch[cursor_i],MouseX(),MouseY())
  End Select

End Function