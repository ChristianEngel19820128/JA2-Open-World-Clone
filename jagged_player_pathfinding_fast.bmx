






Function player_way_find_fast(index,x,y,action,c=0)
  'irgendwie den a* algorithmus einbauen

  player_list_open_last=0
  player_list_close_last=0

  player_close_list_clear()
  player_close_ref_list_clear()
  player_open_list_clear()
  player_open_ref_list_clear()

  Local open_min
  Local target
  Local nexttarget
  Local b=False

  player_list_open[0]=1
  player_list_open_x[0]=player_world_x[index]
  player_list_open_y[0]=player_world_y[index]
  player_list_open_a[0]=player_align[index]
  player_list_open_c[0]=0
  player_list_open_p[0]=-1

  Local z=player_world_z[index]

  player_list_open_ref[player_list_open_x[0],player_list_open_y[0]]=1
  player_list_open_ref_index[player_list_open_x[0],player_list_open_y[0]]=0


  While b=False And open_min<>-1

    open_min=player_list_open_find_min()

    If open_min>=0 Then

      nexttarget=player_list_close_set(open_min)

      If nexttarget>=0 Then

        target=nexttarget

        If player_list_open_x[open_min]<>x Or player_list_open_y[open_min]<>y Then

          player_list_open_neighbour_set(open_min,target,north,x,y,z,c)
          player_list_open_neighbour_set(open_min,target,south,x,y,z,c)
          player_list_open_neighbour_set(open_min,target,east,x,y,z,c)
          player_list_open_neighbour_set(open_min,target,west,x,y,z,c)
          player_list_open_neighbour_set(open_min,target,northeast,x,y,z,c)
          player_list_open_neighbour_set(open_min,target,northwest,x,y,z,c)
          player_list_open_neighbour_set(open_min,target,southeast,x,y,z,c)
          player_list_open_neighbour_set(open_min,target,southwest,x,y,z,c)


        Else
          b=True
        End If
      
        player_list_open_del(open_min)

      Else
        b=True
      End If

    End If

  Wend

  Local i=0
  Local k=target
  Local f=False


  Local x2=player_world_x[index]
  Local y2=player_world_y[index]
  Local a2=player_align[index]
  Local p2=player_position[index]
  Local a
  Local act


  If b=True Then


    'suche den weg zum anfang
    While player_list_close_p[k]<>-1
      player_list_close_n[player_list_close_p[k]]=k
      k=player_list_close_p[k]
    Wend

    i=player_list_close_n[k]

    'setze die hauptwerte für tar

    'player_tar[index]=1
    'player_tar_pos[index]=0
    player_tar_main_action[index]=action
    If action=player_act_run Then player_tar_main_pos[index]=p2
    player_tar_main_x[index]=player_list_close_x[target]
    player_tar_main_y[index]=player_list_close_y[target]

    'gehe den weg schrittweise ab und weise die aktionen zu

    While f=False

	      If x2<>player_list_close_x[target] Or y2<>player_list_close_y[target] Then
	
	        If action=player_act_run And p2>0 Then
	
	          'aufstehen wenn der spieler rennen soll
	          player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_pos_up)
	          p2:-1
	
	        Else
	
	          'prüfe ob zielfeld besetzt ist
	          If world_obj_type[player_list_close_x[i],player_list_close_y[i],z]>0 Then
	            'prüfe ob es das endziel objekt ist
	            If player_list_close_x[i]=player_list_close_x[target] And player_list_close_y[i]=player_list_close_y[target] Then
	              'ziel erreicht
	              'prüfe ob die aktion öffnen ist
	              If action=player_act_open Then
	                player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_open)
	              End If
	              f=True
	
	            Else
	              'nicht das endziel objekt
	              'irgendwas im weg
	              'stop
	              f=True
	
	            End If
	          Else
	
	            'zielfeld ist bekannt und frei
	            'prüfe ob der spieler gedreht werden muss
	            'wenn align = dann move oder run
	            'ansonsten ermittle richtung und turn
	
	            a=player_get_align(player_list_close_x[i]-x2,player_list_close_y[i]-y2)
	
	            'prüfe ob player align gleich ziel align
	            If a2=a Then
	
	              'move oder run zum nächsten feld
	              player_move_set(i,index,p2,action)
	
	              'nächsten schritt in der liste setzen
	               x2=player_list_close_x[i]
	               y2=player_list_close_y[i]
	               i=player_list_close_n[i]
	
	             Else
	
	               'nicht align dann turn
	                a2=player_turn_set(index,x2,y2,a2,a)
	
	              End If
	
	
	          End If
	
	        End If
	
	      Else
	
	        'ziel erreicht
	        'prüfe ob die aktion aufheben ist
	        If action=player_act_pickup Then
	           player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_pickup)
	        End If
	        f=True
	
	      End If

    Wend

  End If

  Return f

End Function




