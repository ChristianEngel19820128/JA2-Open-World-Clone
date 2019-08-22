

Global player_list_open_last
Global player_list_open_min
Global player_list_close_last

Global player_list_close_ref[world_x,world_y]
Global player_list_close_ref_index[world_x,world_y]

Global player_list_close[world_x*world_y]
Global player_list_close_x[world_x*world_y]
Global player_list_close_y[world_x*world_y]
Global player_list_close_a[world_x*world_y]
Global player_list_close_c[world_x*world_y]
Global player_list_close_p[world_x*world_y]
Global player_list_close_n[world_x*world_y]

Global player_list_open_ref[world_x,world_y]
Global player_list_open_ref_index[world_x,world_y]

Global player_list_open[world_x*world_y]
Global player_list_open_x[world_x*world_y]
Global player_list_open_y[world_x*world_y]
Global player_list_open_a[world_x*world_y]
Global player_list_open_c[world_x*world_y]
Global player_list_open_p[world_x*world_y]






Function player_list_check(x,y,z)
  If in_world(x,y)=True Then
    If world_obj_type[x,y,z]=0 Then
      If player_list_open_ref[x,y]=0 Then
        If player_list_close_ref[x,y]=0 Then
          Return True
        End If
      End If
    End If
  End If
  Return False
End Function


Function player_list_open_new()
  Local i=0
  While i<world_x*world_y
    If player_list_open[i]=0 Then
      If player_list_open_last<i Then player_list_open_last=i
      Return i
    Else
      i:+1
    End If
  Wend
  Return -1
End Function


Function player_list_close_new()
  Local i=0
  While i<world_x*world_y
    If player_list_close[i]=0 Then
      If player_list_close_last<i Then player_list_close_last=i
      Return i
    Else
      i:+1
    End If
  Wend
  Return -1
End Function


Function player_list_open_set(x,y,a,c,p)
  Local i=player_list_open_new()
  player_list_open[i]=1
  player_list_open_x[i]=x
  player_list_open_y[i]=y
  player_list_open_a[i]=a
  player_list_open_c[i]=c
  player_list_open_ref[x,y]=1
  player_list_open_ref_index[x,y]=i
End Function


Function player_list_close_set(i)
  Local k=player_list_close_new()
  player_list_close[k]=player_list_open[i]
  player_list_close_x[k]=player_list_open_x[i]
  player_list_close_y[k]=player_list_open_y[i]
  player_list_close_a[k]=player_list_open_a[i]
  player_list_close_c[k]=player_list_open_c[i]
  player_list_close_p[k]=player_list_open_p[i]
  player_list_close_ref[player_list_open_x[i],player_list_open_y[i]]=1
  player_list_close_ref_index[player_list_open_x[i],player_list_open_y[i]]=k
End Function


Function player_list_open_find_min()
  Local open_min
  Local f=False
  For Local i=0 To player_list_open_last
    If player_list_open[i]=1 Then
      If player_list_open[open_min]=1 Then
        If player_list_open_c[open_min]>player_list_open_c[i] Then
          open_min=i
          f=True
        End If
      Else
        open_min=i
        f=True
      End If
    End If
  Next
  If f=False Then
    Return -1
  Else
    Return open_min
  End If
End Function


Function player_list_open_cost_get(i,x1,y1,z1,a,x2,y2)

  Local c
  Local f
  Local g
  Local o
  Local h
  Local a1
  Local a2

  h=Sqr(Abs(x2-x1)*Abs(x2-x1)+Abs(y2-y1)*Abs(y2-y1))

  g=player_list_open_c[i]

  Select world_ground_type[x1,y1,z1]
    Case c_earth g:+2
    Case c_gras g:+2
    Case c_water g:+3
    Case c_deep_water g:+4
    Default g:+1
  End Select

  If a<>player_list_open_a[i] Then

    a1=Abs(player_list_open_a[i]-a)
    If player_list_open_a[i]<a Then
      a2=player_list_open_a[i]+8-a
    Else
      a2=a+8-player_list_open_a[i]
    End If

    If a1<a2 Then
      o=a1
    Else
      o=a2
    End If

  End If

  c=h+g+o

  Return c
End Function


Function player_list_open_neighbour_set(i,a,x,y,z)

  Local x1=player_list_open_x[i]+player_get_x(a)
  Local y1=player_list_open_y[i]+player_get_y(a)

  If player_list_check(x1,y1,z)=True Then

    Local c1=player_list_open_cost_get(i,x1,y1,z,a,x,y)
    player_list_open_set(x1,y1,a,c1,i)

  End If

End Function


Function player_list_open_del(i)

  player_list_open_ref[player_list_open_x[i],player_list_open_y[i]]=0
  player_list_open[i]=0

End Function


Function player_way_find_fast(index,x,y,action)
  'irgendwie den a* algorithmus einbauen

  Local open_min
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

  player_list_open_last=0

  While b=False And open_min<>-1

    open_min=player_list_open_find_min()

    If open_min>=0 Then

      If player_list_open_x[open_min]<>x And player_list_open_y[open_min]<>y Then

        player_list_open_neighbour_set(open_min,north,x,y,z)
        player_list_open_neighbour_set(open_min,northeast,x,y,z)
        player_list_open_neighbour_set(open_min,northwest,x,y,z)
        player_list_open_neighbour_set(open_min,south,x,y,z)
        player_list_open_neighbour_set(open_min,southeast,x,y,z)
        player_list_open_neighbour_set(open_min,southwest,x,y,z)
        player_list_open_neighbour_set(open_min,east,x,y,z)
        player_list_open_neighbour_set(open_min,west,x,y,z)

      Else
        b=True
      End If

      player_list_close_set(open_min)
      player_list_open_del(open_min)

    End If

  Wend

  Local i=0
  Local k=player_list_close_last
  Local f=False

  Local a2=player_align[index]
  Local p2=player_position[index]
  Local a
  Local act

  If b=True Then

    'suche den weg zum anfang
    While i<>0
      player_list_close_n[player_list_close_p[i]]=i
      i=player_list_close_p[i]
    Wend

    'setze die hauptwerte für tar

    'player_tar[index]=1
    'player_tar_pos[index]=0
    player_tar_main_action[index]=action
    player_tar_main_x[index]=player_list_close_x[player_list_close_last]
    player_tar_main_y[index]=player_list_close_y[player_list_close_last]

    'gehe den weg schrittweise ab und weise die aktionen zu

    While f=False

      If k<>player_list_close_last Then

        If action=player_act_run And p2>0 Then

          'aufstehen wenn der spieler rennen soll
          player_tar_list_action[index,i]=player_act_pos_up
          p2:-1
          i:+1

        Else

          'prüfe ob zielfeld besetzt ist
          If world_obj_type[player_list_close_x[i],player_list_close_y[i],z]>0 Then
            'prüfe ob es das endziel objekt ist
            If player_list_close_x[i]=player_list_close_x[player_list_close_last] And player_list_close_y[i]=player_list_close_y[player_list_close_last] Then
              'ziel erreicht
              'prüfe ob die aktion öffnen ist
              If action=player_act_open Then
                player_tar_set(index,i,player_list_close_x[i],player_list_close_y[i],player_act_open)
              End If
              f=True
            Else
              'nicht das endziel objekt
              'stop
              f=True
            End If
          Else

            'zielfeld ist bekannt und frei
            'prüfe ob der spieler gedreht werden muss
            'wenn align = dann move oder run
            'ansonsten ermittle richtung und turn

            'prüfe ob player align gleich ziel align
            If a2=a Then

              'move oder run zum nächsten feld
              If action=player_act_run Then
                player_tar_set(index,i,player_list_close_x[i],player_list_close_y[i],player_act_run)
              Else

                Select p2
                  Case 0
                    player_tar_set(index,i,player_list_close_x[i],player_list_close_y[i],player_act_walk)
                  Case 1
                    player_tar_set(index,i,player_list_close_x[i],player_list_close_y[i],player_act_swat)
                  Case 2
                    player_tar_set(index,i,player_list_close_x[i],player_list_close_y[i],player_act_crawl)
                End Select

              End If

              'nächsten schritt in der liste setzen
               k=player_list_close_n[i]

             Else

               'nicht align dann turn
                If act=player_act_turn_left Then
                  player_tar_set(index,i,player_list_close_x[i],player_list_close_y[i],player_act_turn_left)
                  a2:-1
                  If a2<0 Then a2=7
                Else
                  player_tar_set(index,i,player_list_close_x[i],player_list_close_y[i],player_act_turn_right)
                  a2:+1
                  If a2>7 Then a2=0
                End If

              End If


          End If

        End If

        'zähler erhöhen
        i:+1

      Else

        'ziel erreicht
        'prüfe ob die aktion aufheben ist
        If action=player_act_pickup Then
           player_tar_set(index,i,player_list_close_x[i],player_list_close_y[i],player_act_pickup)
        End If
        f=True

      End If

    Wend

  End If

  Return f

End Function




