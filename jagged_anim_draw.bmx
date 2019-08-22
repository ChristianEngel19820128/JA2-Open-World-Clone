




Function player_animation_shift(i)

  If MilliSecs()>player_anim_t[i]+player_anim_s[i] Then
    player_anim_t[i]=MilliSecs()

      If player_anim_reverse[player_anim_transition[i]]=1 Then
        player_anim_i[i]:-1
	      If player_anim_i[i]<player_anim_keyframe_min[player_anim_transition[i]] Then
	        player_anim_i[i]=player_anim_keyframe_max[player_anim_transition[i]]
	        If player_anim_loop[player_anim_transition[i]]=0 Then
            player_action_end[i]=1
          End If
	      End If
      Else
        player_anim_i[i]:+1
	      If player_anim_i[i]>player_anim_keyframe_max[player_anim_transition[i]] Then
	        player_anim_i[i]=player_anim_keyframe_min[player_anim_transition[i]]
        	If player_anim_loop[player_anim_transition[i]]=0 Then
            player_action_end[i]=1
          End If
	      End If
      End If

  End If

End Function


Function player_animation_draw(i,x,y)

  If player_anim_cache_2[i] <> Null Then 

	  Local dx=img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]]
	  Local dy=img_merc_dy[player_sex[i],player_anim[player_anim_transition[i]]]
	
		Local x2=dx*player_anim_i[i]
		Local y2=0
	  'Local y2=dy*player_align[i]
	
		Local x1=x+img_merc_offx[player_sex[i],player_anim[player_anim_transition[i]],player_align[i],player_anim_i[i]]
		Local y1=y+img_merc_offy[player_sex[i],player_anim[player_anim_transition[i]],player_align[i],player_anim_i[i]]
	
		
		'If x2+dx<=PixmapWidth(player_anim_cache_1[i]) And y2+dy<=PixmapHeight(player_anim_cache_1[i]) Then
		
		  'Local pix1:TPixmap = PixmapWindow(player_anim_cache_1[i],x2,y2,dx,dy)
	
	  	DrawImage(player_anim_cache_2[i],x1,y1,player_anim_i[i])
	
		  'Local pix1:TPixmap = PixmapWindow(img_merc[player_sex[i],player_anim[player_anim_transition[i]]],x2,y2,dx,dy)
	
	  	'DrawImage(LoadImage(pix1),x1,y1)
	
	  'End If
	
  End If


End Function




Function player_animation_set(i)

  If img_merc[player_sex[i],player_anim[player_anim_transition[i]]] <> Null Then 

    player_anim_t[i]=MilliSecs()

    If player_anim_reverse[player_anim_transition[i]]=1 Then
      player_anim_i[i]=player_anim_keyframe_max[player_anim_transition[i]]
    Else
      player_anim_i[i]=player_anim_keyframe_min[player_anim_transition[i]]
    End If

    If player_anim_cache_1[i] = Null Then
      player_anim_cache_1[i]=CreatePixmap(10,10,PF_RGBA8888)
		End If

    Local dx = img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]]*img_merc_count[player_sex[i],player_anim[player_anim_transition[i]]]
    Local dy = img_merc_dy[player_sex[i],player_anim[player_anim_transition[i]]]

		player_anim_cache_1[i]=ResizePixmap(player_anim_cache_1[i],dx,dy)

    ClearPixels(player_anim_cache_1[i])

		Local y1 = img_merc_dy[player_sex[i],player_anim[player_anim_transition[i]]]*player_align[i]


    For Local z=0 To img_merc_count[player_sex[i],player_anim[player_anim_transition[i]]]-1

    For Local x=0 To img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]]-1
    For Local y=0 To img_merc_dy[player_sex[i],player_anim[player_anim_transition[i]]]-1


      Local argb=ReadPixel(img_merc[player_sex[i],player_anim[player_anim_transition[i]]],x+z*img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]],y1+y)

      'hair
      If (argb Shr 16 & $FF) > 100 And (argb Shr 8 & $FF) = 0 And (argb & $FF) < 50 Then
        WritePixel(player_anim_cache_1[i],x+z*img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]],y,get_blend(argb,player_color_hair_r[i],player_color_hair_g[i],player_color_hair_b[i]))
			End If

      'shirt
      If (argb Shr 16 & $FF) = 0 And (argb Shr 8 & $FF) = 0 And (argb & $FF) > 0 Then
        WritePixel(player_anim_cache_1[i],x+z*img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]],y,get_blend(argb,player_color_shirt_r[i],player_color_shirt_g[i],player_color_shirt_b[i]))
			End If
			
			'skin
      If ((argb Shr 16 & $FF) > 0 And (argb Shr 8 & $FF) = 0 And (argb & $FF) > 0) And Not ((argb Shr 16 & $FF) > 100 And (argb Shr 8 & $FF) = 0 And (argb & $FF) < 50) Then
        WritePixel(player_anim_cache_1[i],x+z*img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]],y,get_blend(argb,player_color_skin_r[i],player_color_skin_g[i],player_color_skin_b[i]))
			End If
			
			'pants
      If (argb Shr 16 & $FF) = 0 And (argb Shr 8 & $FF) > 0 And (argb & $FF) = 0 Then
        WritePixel(player_anim_cache_1[i],x+z*img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]],y,get_blend(argb,player_color_pants_r[i],player_color_pants_g[i],player_color_pants_b[i]))
			End If
			
      'equip
      If (argb Shr 16 & $FF) > 0 And (argb Shr 8 & $FF) > 0 And (argb & $FF) > 0 Then
        WritePixel(player_anim_cache_1[i],x+z*img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]],y,argb)
			End If
			
      'misc
      If ((argb Shr 16 & $FF) = 0 And (argb Shr 8 & $FF) = 255 And (argb & $FF) = 255) Or ((argb Shr 16 & $FF) = 128 And (argb Shr 8 & $FF) = 128 And (argb & $FF) = 128) Then
        WritePixel(player_anim_cache_1[i],x+z*img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]],y,get_black(argb))
			End If

      'blood
      If ((argb Shr 16 & $FF) = 63 And (argb Shr 8 & $FF) = 0 And (argb & $FF) = 0) Then
        WritePixel(player_anim_cache_1[i],x+z*img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]],y,argb)
			End If
			
		Next
		Next
		Next
		
    player_anim_cache_2[i]=LoadAnimImage(player_anim_cache_1[i],img_merc_dx[player_sex[i],player_anim[player_anim_transition[i]]],img_merc_dy[player_sex[i],player_anim[player_anim_transition[i]]],0,img_merc_count[player_sex[i],player_anim[player_anim_transition[i]]])

  End If

End Function




