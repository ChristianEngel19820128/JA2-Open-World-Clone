

Function mouse_do()

  mouse=0
  shift=0
  strg=0
  alt=0

  If MouseHit(1) Then mouse=1
  If MouseHit(2) Then mouse=2

  mouse_x=MouseX()
  mouse_y=MouseY()

  If KeyDown(KEY_LSHIFT) Then shift=1
  If KeyDown(KEY_LCONTROL) Then strg=1
  If KeyDown(KEY_LALT) Then alt=1

End Function




Function mouseover(x1,y1,x2,y2)
  If mouse_x>=x1 And mouse_x<=x2 And mouse_y>=y1 And mouse_y<=y2 Then
    Return True
  Else
    Return False
  End If
End Function










Function mouse_for_each_tile(i,k,x,y)

  For Local j=0 To world_cluster_size-1
  For Local l=0 To world_cluster_size-1
  For Local z=0 To world_z-1


    Local x1=i*world_cluster_size+j
    Local y1=k*world_cluster_size+l

	  Local dx=world_tilesize
	  Local dy=world_tilesize/2
	
		Local x2=x+j*dx-l*dx-dx
		Local y2=y+l*dy+j*dy+roof_offy*z

      If mouseover(x2,y2,x2+40,y2+20)=True Then
        If ImagesCollide(img_field_red,x2,y2,0,img_dot,MouseX(),MouseY(),0) Then

          mouse_world_x=x1
          mouse_world_y=y1
          mouse_world=1

          Return 1

        End If
      End If

  Next
  Next
  Next

  Return 0

End Function




Function mouse_for_each_cluster()

  For Local i=0 To world_x/world_cluster_size-1
  For Local k=0 To world_y/world_cluster_size-1

    Local j=world_cam_x*world_tilesize*2
    Local l=world_cam_y*world_tilesize

	    Local dx=world_tilesize*world_cluster_size
	    Local dy=world_tilesize/2*world_cluster_size
	
	    Local dx2=(world_cluster_dx-world_tilesize*2*world_cluster_size)/2
	    Local dy2=world_cluster_dy-world_tilesize*world_cluster_size
		
			Local x=wx/2+dx2+i*dx-k*dx
			Local y=-wy/2+dy2+k*dy+i*dy

      If x+j>=-world_cluster_dx And x+j<=wx+world_cluster_dx And y+l>=-world_cluster_dy And y+l<=wy+world_cluster_dy Then

        'If mouseover(x-dx,y+dy*2,x+dx*2,y+dy*4)=True Then
          'SetColor Rand(255),Rand(255),Rand(255)
          'DrawRect(x-dx,y+dy*2,dx*2,dy*4)

      	  If mouse_for_each_tile(i,k,x+j,y+l)=1 Then
            Return 1
          End If
        'End If
	    End If
	
	Next
	Next

  Return 0

End Function


Function mouse_get_in_world()

  mouse_world=0

  If mouseover(gui_main_data_x,gui_main_data_y,gui_main_data_dx,gui_main_data_dy) = False Then
  If (gui_inventar_open=1 And mouseover(gui_inventar_x,gui_inventar_y,gui_inventar_dx,gui_inventar_dy) = False) Or (gui_inventar_open=0 And mouseover(gui_inventar_x,gui_inventar_y,gui_inventar_minimized_dx,gui_inventar_dy) = False) Then
  If mouseover(gui_hand_x,gui_hand_y,gui_hand_dx,gui_hand_dy) = False Then

    mouse_for_each_cluster()

  End If
  End If
  End If

End Function


