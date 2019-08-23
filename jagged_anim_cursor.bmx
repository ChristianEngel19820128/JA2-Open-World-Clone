
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