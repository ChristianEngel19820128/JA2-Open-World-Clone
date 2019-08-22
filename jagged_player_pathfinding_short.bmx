




Function player_field_left(x2,y2,z2,x,y)

  Local a
  Local d

  'feld vorne links ermitteln
   a=player_get_align(x,y)-1
   If a<0 Then a=7
   x=player_get_x(a)
   y=player_get_y(a)
   d=1

   'prüfe ob feld besetzt
   If world_obj_type[x2+x,y2+y,z2]>0 Then

     'feld vorne rechts ermitteln
     a=player_get_align(x,y)+2
     If a=8 Then a=0
     If a=9 Then a=1
     x=player_get_x(a)
     y=player_get_y(a)
     d=2

     'prüfe ob feld besetzt
     If world_obj_type[x2+x,y2+y,z2]>0 Then

       'feld links ermitteln
       a=player_get_align(x,y)-3
       If a=-1 Then a=7
       If a=-2 Then a=6
       If a=-3 Then a=5
       x=player_get_x(a)
       y=player_get_y(a)
       d=1

       'prüfe ob feld besetzt
       If world_obj_type[x2+x,y2+y,z2]>0 Then

         'feld rechts ermitteln
         a=player_get_align(x,y)+4
         If a=8 Then a=0
         If a=9 Then a=1
         If a=10 Then a=2
         If a=11 Then a=3
         x=player_get_x(a)
         y=player_get_y(a)
         d=2

         'prüfe ob feld besetzt
         If world_obj_type[x2+x,y2+y,z2]>0 Then
           'kein freies feld vorhanden
           d=0
         End If

       End If
     End If
   End If

  Return d

End Function


Function player_field_right(x2,y2,z2,x,y)

  Local a
  Local d

  'rechtshänder gehen zu erst nach rechts
  'feld vorne rechts ermitteln
  a=player_get_align(x,y)+1
  If a>7 Then a=0
  x=player_get_x(a)
  y=player_get_y(a)
  d=2

  'prüfe ob feld besetzt
  If world_obj_type[x2+x,y2+y,z2]>0 Then

    'feld vorne links ermitteln
    a=player_get_align(x,y)-2
    If a=-1 Then a=7
    If a=-2 Then a=6
    x=player_get_x(a)
    y=player_get_y(a)
    d=1

    'prüfe ob feld besetzt
    If world_obj_type[x2+x,y2+y,z2]>0 Then

      'feld rechts ermitteln
      a=player_get_align(x,y)+3
      If a=8 Then a=0
      If a=9 Then a=1
      If a=10 Then a=2
      x=player_get_x(a)
      y=player_get_y(a)
      d=2

      'prüfe ob feld besetzt
      If world_obj_type[x2+x,y2+y,z2]>0 Then

        'feld links ermitteln
        a=player_get_align(x,y)-4
        If a=-1 Then a=7
        If a=-2 Then a=6
        If a=-3 Then a=5
        If a=-4 Then a=4
        x=player_get_x(a)
        y=player_get_y(a)
        d=1

        'prüfe ob feld besetzt
        If world_obj_type[x2+x,y2+y,z2]>0 Then
          'kein freies feld vorhanden
          d=0
        End If
      End If
    End If

  End If

  Return d

End Function




Function player_way_find_short(index,x1,y1,action)

  Local f=False
  Local e=False

  Local x2=player_action_x[index]
  Local y2=player_action_y[index]
  Local z2=player_action_z[index]

  Local p2=player_position[index]
  Local a2=player_align[index]

  Local a

  Local x
  Local y

  Local i=0

  While e=False And i<player_tar_max

    If x1=x2 And y1=y2 Then

      If action=player_act_pickup Then
        'item prüfen
        If e= Not player_tar_add(index,x2,y2,player_act_pickup)=True Then
          f=True
        End If
        e=True
      Else

        'ende erreicht
        e=True
        f=True

      End If

    Else

      If action=player_act_run And p2>0 Then
        e= Not player_tar_add(index,x2+x,y2+y,player_act_pos_up)
        p2:-1
      Else

        If x1<x2 Then x=-1
        If x1>x2 Then x=+1
        If y1<y2 Then y=-1
        If y1>y2 Then y=+1

        a=player_get_align(x,y)

        If a2=a Then

          If world_obj_type[x2+x,y2+y,z2]=0 Then

            If action=player_act_run Then
              e= Not player_tar_add(index,x2+x,y2+y,player_act_run)
            Else

              Select p2
                Case 0
                  e= Not player_tar_add(index,x2+x,y2+y,player_act_walk)
                Case 1
                  e= Not player_tar_add(index,x2+x,y2+y,player_act_swat)
                Case 2
                  e= Not player_tar_add(index,x2+x,y2+y,player_act_crawl)
                Default
                  e=True
              End Select

            End If

            x2:+x
            y2:+y


          Else

            If x1=x2+x And y1=y2+y Then

              If action=player_act_open Then
                'container prüfen
                If e= Not player_tar_add(index,x2+x,y2+y,player_act_open)=True Then
                  f=True
                End If
                e=True
              End If

            Else

              If player_handed[index]=player_lefthand Then
                a=player_field_left(x2,y2,z2,x,y)
              Else
                a=player_field_right(x2,y2,z2,x,y)
              End If

                Select a
                  Case 1
                    e= Not player_tar_add(index,x2,y2,player_act_turn_left)
                    a2:-1
                    If a2<0 Then a2=7
                  Case 2
                    e= Not player_tar_add(index,x2,y2,player_act_turn_right)
                    a2:+1
                    If a2>7 Then a2=0
                  Default
                    e=True
                End Select

             End If

          End If

        Else

            If player_handed[index]=player_lefthand Then
              a=player_field_left(x2,y2,z2,x,y)
            Else
              a=player_field_right(x2,y2,z2,x,y)
            End If

              Select a
                Case 1
                  e= Not player_tar_add(index,x2,y2,player_act_turn_left)
                  a2:-1
                  If a2<0 Then a2=7
                Case 2
                  e= Not player_tar_add(index,x2,y2,player_act_turn_right)
                  a2:+1
                  If a2>7 Then a2=0
                Default
                  e=True
              End Select

        End If

      End If

    End If

    i:+1

  Wend

  If f=True Then Print "moves to target "+(i-1)

  Return f

End Function



