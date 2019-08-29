

Function item_del(i)

  item[i]=0
  Select item_location[i]
    Case location_map
      del_world_item(item_world_x[i],item_world_y[i],item_world_z[i],item_world_z[i])
    Case location_mouse
      mouse_inventory=0
    Case location_stack
      item_stack[item_location_index[i],item_location_pos[i]]=0
  End Select

  If item_last=i Then item_last:-1

End Function




Function item_new(typ,location,index,pos=0,x=0,y=0,z=0,stack=1,zustand=100,aktiv=0,time=0)

  Local f=False
  Local i=0
  Local posi

  While f=False And i<item_max
    If item[i]=0 Then


      item_type[i]=typ
      item_location[i]=location
      item_location_index[i]=index
      item_location_pos[i]=pos
      item_world_x[i]=x
      item_world_y[i]=y
      item_world_z[i]=z
      item_world_i[i]=posi


      Select location

        Case location_player_hand

          If player_hand_item_add(index,i,typ)=False Then
            Return -1
          End If

        Case location_player_inventory

          If player_inventory_item_add(index,i,typ)=False Then
            Return -1
          End If

        Case location_player_bag

          If player_bag_item_add(index,i,typ)=False Then
            Return -1
          End If

        Case location_player

          'prüfen ob inventar
          'inventar zuweisen wenn leer
          'ansonsten platz suchen

          If player_inventory_item_add(index,i,typ)=False Then
            If player_bag_item_add(index,i,typ)=False Then
              If player_hand_item_add(index,i,typ)=False Then
                Return -1
              End If
            End If
          End If

        Case location_map

          If world_ground_type[x,y,z]<>c_water Then
            Local b=False
            Local k=0

            While b=False And k<world_item_max
              If world_item[x,y,z,k]=0 Then
                world_item[x,y,z,k]=1
                world_item_index[x,y,z,k]=i
                b=True
                posi=k
              Else
                k:+1
              End If
            Wend
            If b=False Then
              Return -1
            End If
          Else
            Return -1            
          End If

      End Select



      If item_last<i Then item_last=i

      f=True
      item[i]=1


      If zustand<0 Then
        item_zustand[i]=Rand(100+zustand,100)
      Else
        item_zustand[i]=zustand
      End If

      item_stack_count[i]=stack
      If item_stack_count[i]>item_type_stack[item_type[i]] Then item_stack_count[i]=item_type_stack[item_type[i]]
      If item_stack_count[i]>item_stack_max Then item_stack_count[i]=item_stack_max


      If item_type_stack[item_type[i]]>0 Then
      If item_stack_count[i]>0 Then
        For Local k=0 To item_stack_count[i]-1
          Local j=item_new(typ,location_stack,i,k,x,y,z,0,zustand)
          If j>=0 Then
            item_stack[i,k]=1
            item_stack_index[i,k]=j
            item_room[i]:+item_type_space[item_type[j]]
          End If
        Next
      End If
      End If

      Return i

    Else
      i:+1
    End If

  Wend

  Return -1

End Function






Function item_find_group(i)

  Local group
  Local g=False

  For Local k=0 To item_stack_max-1
    If item_stack[i,k]>0 Then
      If item_stack_count[i]=1 Then
        item_type[i]=item_type[item_stack_index[i,k]]
      Else
        If g=False Then
          group=item_type_group[item_type[item_stack_index[i,k]],1]
          g=True
        End If

        If g=True And item_type_group[item_type[item_stack_index[i,k]],1]<>group Then
           item_set_stack(i)
        End If

      End If
    End If
  Next

End Function



Function item_set_stack(i)

  Select item_type_group[item_type[i],0]
    Case group_ammo
      'item_type[i]=mun_mixed
    Case group_glowstick
      'item_type[i]=knicklichter
  End Select

End Function







Function item_combine_stack(i,k)

  Local l=0
  For Local j=0 To item_stack_max-1
    If item_stack_count[i]<item_type_stack[item_type[i]] Then
      If item_room[i]<item_type_room[item_type[i]] Then
        If item_stack[i,j]=0 Then
          Local f=False

          While f=False And l<item_stack_max-1
            If item_stack[k,l]=1 Then
              If item_type_room[item_type[i]]>=item_room[i]+item_type_space[item_type[item_stack_index[k,l]]] Then
                item_stack[i,j]=1
                item_stack_index[i,j]=item_stack_index[k,l]
                item_location[item_stack_index[k,l]]=location_stack
                item_location_index[item_stack_index[k,l]]=i
                item_location_pos[item_stack_index[k,l]]=j
                item_stack_count[i]:+1
                item_stack_count[k]:-1
                item_room[i]:+item_type_space[item_type[item_stack_index[k,l]]]
                item_room[k]:-item_type_space[item_type[item_stack_index[k,l]]]
                item_stack[k,l]=0

                item_find_group(i)
                item_find_group(k)

                f=True

              Else
                l:+1
              End If
            Else
              l:+1
            End If
          Wend
        End If
      End If
    End If
  Next


  If item_stack_count[k]=0 Then
    item_del(k)
    Return 0
  Else
    Return 1
  End If

Return -1
End Function



Function item_pickup_stack(k,location,location_index,location_pos)
  Local f=False
  Local i=0
  While f=False And i<item_stack_max-1
    If item_stack[k,i]=1 Then
      f=True
      Local j=item_stack_new(item_stack_index[k,i],location,location_index,location_pos)
      item_stack[k,i]=0
      item_stack_count[k]:-1
      item_room[k]:-item_type_space[item_type[item_stack_index[k,i]]]
      item_find_group(k)
      Return j
    Else
      i:+1
    End If
  Wend
  Return -1

End Function



Function item_stack_new(k,location,location_index,location_pos)
  Local f=False
  Local i=0
  While f=False And i<item_max-1
    If item[i]=0 Then
      f=True
      item[i]=1
      item_type[i]=item_type[k]
      item_zustand[i]=item_zustand[k]
      item_stack_count[i]:+1
      item_room[i]:+item_type_space[item_type[k]]
      item_stack[i,0]=1
      item_stack_index[i,0]=k
      item_location[i]=location
      item_location_index[i]=location_index
      item_location_pos[i]=location_pos
      item_location[k]=location_stack
      item_location_index[k]=i
      item_location_pos[k]=0
      Return i
    Else
      i:+1
    End If
  Wend
  Return -1
End Function



Function get_bul_first(i,cal)
  Local f=False
  Local k=0
  While f=False And k<item_stack_max-1
    If item_stack[i,k]=1 Then
      If item_type_kaliber[item_type[item_stack_index[i,k]]]=cal Then
        f=True
        item_stack[i,k]=0
        item_stack_count[i]:-1
        item_room[i]:-item_type_space[item_type[item_stack_index[i,k]]]
        item_find_group(i)
        If item_stack_count[i]=0 Then item_del(i)
      Else
        k:+1
      End If
    Else
      k:+1
    End If
  Wend

If f=True Then
  Return item_stack_index[i,k]
Else
  Return -1
End If

End Function



Function item_combine_stack_equal(i,k,platz,cal)

  Local l=0
  Local s=item_stack_count[i]
  For Local j=0 To item_stack_max-1
    If platz>item_stack_count[i] Then
      If item_room[i]<item_type_room[item_type[i]] Then
        If item_stack[i,j]=0 Then


          Local f=False
          While f=False And l<item_stack_max-1

            If item_stack[k,l]=1 Then
              If cal=item_type_kaliber[item_type[item_stack_index[k,l]]] And item_type_room[item_type[i]]>=item_room[i]+item_type_space[item_type[item_stack_index[k,l]]] Then

                item_stack[i,j]=1
                item_stack_index[i,j]=item_stack_index[k,l]
                item_location[item_stack_index[k,l]]=location_stack
                item_location_index[item_stack_index[k,l]]=i
                item_location_pos[item_stack_index[k,l]]=j
                item_stack_count[i]:+1
                item_stack_count[k]:-1
                item_room[i]:+item_type_space[item_type[item_stack_index[k,l]]]
                item_room[k]:-item_type_space[item_type[item_stack_index[k,l]]]
                item_stack[k,l]=0


                item_find_group(i)
                item_find_group(k)
                f=True

              Else
                l:+1
              End If
            Else
              l:+1
            End If
          Wend
        End If
      End If
    End If
  Next


  If item_stack_count[k]=0 Then
    item_del(k)
    Return item_stack_count[i]
  Else
    Return item_stack_count[i]
  End If

Return -1

End Function




Function item_stack_shift(i)

  Local e=False
  Local j=0
  Local f=False
  Local l=0
  While e=False And j<item_stack_max-1

    If item_stack[i,j]=0 Then

      f=False
      l=j

      While f=False And l<item_stack_max-1
        If item_stack[i,l]=1 Then
          item_stack[i,j]=1
          item_stack_index[i,j]=item_stack_index[i,l]
          item_location_pos[item_stack_index[i,l]]=j
          item_stack[i,l]=0
          f=True
        Else
          l:+1
        End If
      Wend

    End If

    If l=item_stack_max-1 Then
      e=True
    Else
      j:+1
    End If

  Wend

End Function











