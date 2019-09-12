

Function item_del(i)

  item[i]=0
  If item_last=i Then item_last:-1

  Select item_location[i]

    Case location_map

      del_world_item(item_location_pos[i,0],item_location_pos[i,1],item_location_pos[i,2],item_location_pos[i,3])

    Case location_player_hand

      Select item_location_pos[i,0]

        Case player_lefthand
          player_hand[item_location_index[i],player_lefthand]=0

        Case player_righthand
          player_hand[item_location_index[i],player_righthand]=0

        Case player_dualhand
          player_hand[item_location_index[i],player_lefthand]=0
          player_hand[item_location_index[i],player_righthand]=0

      End Select

    Case location_player_inventory

      player_inventory[item_location_index[i],item_location_pos[i,0]]=0

    Case location_item_slot

      item_slot[item_location_index[i],item_location_pos[i,0],item_location_pos[i,1]]=0

    Case location_item_stack

      If item[item_location_index[i]]=1 Then
        item_stack[item_location_index[i],item_location_pos[i,0]]=0
        item_stack_count[item_location_index[i]]:-1
        If item_stack_count[item_location_index[i]]>0 Then
          item_stack_shift(item_location_index[i])
        Else
          item_del(item_location_index[i])
        End If
      End If

    Case location_object

    Case location_mouse

      mouse_inventory=0

    Case location_weapon

      If item_group_check(item_type[i],group_magazine)=True Then
          item_magazine[item_location_index[i]]=0
      Else
        If item_group_check(item_type[i],group_ammo)=True Then
		      item_ammo[item_location_index[i],item_location_pos[i,0]]=0
          item_ammo_count[item_location_index[i]]:-1
		      If item_ammo_count[item_location_index[i]]>0 Then
            item_ammo_shift(item_location_index[i])
          End If
        End If
      End If


    Case location_magazine

		        item_ammo[item_location_index[i],item_location_pos[i,0]]=0
		        item_ammo_count[item_location_index[i]]:-1
		        If item_ammo_count[item_location_index[i]]>0 Then
		          item_ammo_shift(item_location_index[i])
		        End If


  End Select

  If item_magazine[i]=1 Then
    item_del(item_magazine_index[i])
  End If

  If item_ammo_count[i]>0 Then
    For Local k=0 To item_ammo_max-1
      If item_ammo[i,k]=1 Then
        item_del(item_ammo_index[i,k])
      End If
    Next
  End If

  'lösche alle stack items

  If item_stack_count[i]>0 Then
    For Local k=0 To item_stack_max-1
      If item_stack[i,k]=1 Then
        item_del(item_stack_index[i,k])
      End If
    Next
  End If

End Function




Function item_new(typ,location,index,x=0,y=0,z=0,zustand=100)

  Local f=False
  Local i=0
  Local posi

  While f=False And i<item_max
    If item[i]=0 Then



			If item_last<i Then item_last=i
			
			f=True
			item[i]=1



			item_stack_count[i]=0
			
			For Local k=0 To item_stack_max-1
			  item_stack[i,k]=0
			Next
			
			For Local k=0 To item_slot_max-1
			  For Local l=0 To item_capacity_max-1
			    item_slot[i,k,l]=0
			  Next
			Next

			item_ammo_count[i]=0
			
			For Local k=0 To item_ammo_max-1
			  item_ammo[i,k]=0
			Next
			
			item_magazine[i]=0
			

      item_type[i]=typ
      item_location[i]=location
      item_location_index[i]=index
      item_location_pos[i,0]=x
      item_location_pos[i,1]=y
      item_location_pos[i,2]=z

      If zustand<0 Then
        item_zustand[i]=Rand(100+zustand,100)
      Else
        item_zustand[i]=zustand
      End If

      Select location

        Case location_player_hand

          If player_hand_item_add(index,i,typ)=False Then
            f=False
          End If

        Case location_player_inventory

          If player_inventory_item_add(index,i,typ)=False Then
            f=False
          End If

        Case location_player_bag

          If player_bag_item_add(index,i,typ)=False Then
            f=False
          End If


        Case location_player

          'prüfen ob inventar
          'inventar zuweisen wenn leer
          'ansonsten platz suchen

          If player_inventory_item_add(index,i,typ)=False Then
            If player_bag_item_add(index,i,typ)=False Then
              If player_hand_item_add(index,i,typ)=False Then
                f=False
              End If
            End If
          End If



        Case location_item_slot




        Case location_map

          If world_ground_type[x,y,z]<>c_water And world_ground_type[x,y,z]<>c_deep_water And world_ground_type[x,y,z]<>c_pool_water Then
            Local b=False
            Local k=0

            While b=False And k<world_item_max
              If world_item[x,y,z,k]=0 Then
                world_item[x,y,z,k]=1
                world_item_index[x,y,z,k]=i
                b=True
                item_location_pos[i,3]=k
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


      If f=True Then
        Return i
      Else
        item[i]=0
        Return -1
      End If

    Else
      i:+1
    End If

  Wend

  Return -1

End Function



Function item_stack_check(i,k)

  If item_compare_type(item_type[i],item_type[k])=True Then
  If item_type_room[item_type[i]]=item_type_room[item_type[k]] Then
  If item_stack_count[i]<item_type_stack[item_type[i]] Then
  If item_stack_calc_cap(i)+item_type_space[item_type[k]]<=item_type_contain[item_type[i]] Then

    Return True

  End If
  End If
  End If
  End If

  Return False

End Function



Function item_compare_type(i,k)

  If item_group_compare(0,i,k)=True Then
  'If item_group_compare_all(i,k)=True Then
    Return True
  Else
    If item_group_check(i,group_heap)=True Or item_group_check(k,group_heap)=True Then
      If item_group_compare(0,i,k)=True Then 'And item_group_compare(1,i,k)=True Then
        Return True
      End If
    End If
  End If

  Return False

End Function




Function item_group_check(typ,group)

  Local f=False
  For Local i=0 To item_group_max-1
    If item_type_group[typ,i]=group Then
      f=True
    End If
  Next
  Return f

End Function



Function item_group_compare_all(g1,g2)

  Local f=True

  For Local i=0 To item_group_max-1
    If item_type_group[g1,i]<>item_type_group[g2,i] Then
      f=False
    End If
  Next

  Return f

End Function


Function item_group_compare(i,g1,g2)

  If item_type_group[g1,i]=item_type_group[g2,i] Then
    Return True
  End If
  Return False

End Function



Function item_slot_get_room(index,slot)

  Local c=item_type_slot_capacity[item_type[index],slot]

  For Local l=0 To item_type_slot_capacity[item_type[index],slot]-1
    If item_slot[index,slot,l]=1 Then
      c:-item_type_room[item_type[item_slot_index[index,slot,l]]]
    End If
  Next

  Return c

End Function





Function item_find_free_slot(index,room)

  For Local slot=0 To item_type_slots[item_type[index]]-1

    Local c=item_slot_get_room(index,slot)

    If c>=room Then
      Return slot
    End If

  Next

  Return -1

End Function








Function item_find_heap(index,typ)

  If item_type_stack[typ]>0 Then

    For Local slot=0 To item_type_slots[item_type[index]]-1

      For Local cap=0 To item_type_slot_capacity[item_type[index],slot]-1

        If item_slot[index,slot,cap]>0 Then

          If item_type[item_slot_index[index,slot,cap]]=typ Then

            If item_stack_count[item_slot_index[index,slot,cap]]<item_type_stack[item_type[item_slot_index[index,slot,cap]]] Then

              Return item_slot_index[index,slot,cap]

            End If

          Else

            If item_compare_type(item_type[item_slot_index[index,slot,cap]],typ)=True Then

              If item_stack_count[item_slot_index[index,slot,cap]]<item_type_stack[item_type[item_slot_index[index,slot,cap]]] Then

                Return item_slot_index[index,slot,cap]

              End If

            End If

          End If

        End If

      Next

    Next

  End If

  Return -1

End Function




Function item_stack_calc_cap(index)

  Local c=0

  If item_stack_count[index]>0 Then

    For Local i=0 To item_stack_max-1

      If item_stack[index,i]>0 Then
        c:+item_type_space[item_type[item_stack_index[index,i]]]
      End If

    Next

  Else

    c=item_type_space[item_type[index]]

  End If

  Return c

End Function




Function item_stack_calc_zustand(index)

  Local count=0
  Local zustand=0

  For Local i=0 To item_stack_max-1

    If item_stack[index,i]>0 Then
      count:+1
      zustand:+item_zustand[item_stack_index[index,i]]
    End If

  Next

  If count>0 Then
    item_zustand[index]=zustand/count
  Else
    item_zustand[index]=0
  End If

End Function




Function item_stack_find_type(index)

  If item_stack_count[index]=0 Then
    index=item_stack_create(index)
  End If

  Local f=False
  Local i=0
  Local ti

  'ersten typ zuweisen
  While f=False And i<item_stack_max

    If item_stack[index,i]>0 Then
      item_type[index]=item_type[item_stack_index[index,i]]
      ti=item_type[item_stack_index[index,i]]
      f=True
    End If

    i:+1

  Wend

  f=False
  i=0

  'auf unterschied prüfen
  While f=False And i<item_stack_max

    If item_stack[index,i]>0 Then
      If item_type[index]<>item_type[item_stack_index[index,i]] Then
        f=True
      End If
    End If

    i:+1

  Wend

  'alle item types durchforsten

  'suche nach item type das heap hat und mit der hauptgruppe matscht

  If f=True Then

  Local t=False
  i=0

  For i=0 To item_type_max-1

    If item_group_check(i,group_heap)=True And item_group_compare(0,i,item_type[index])=True Then 'And item_group_compare(1,i,item_type[index])=True Then
      t=True
      ti=i
    End If

    If t=False Then
      If item_group_compare(0,i,item_type[index])=True Then
      'If item_group_compare_all(i,item_type[index])=True Then

        f=False
        Local k=0
        While f=False And k<item_stack_max
          If item_stack[index,k]>0 Then
            If item_type[item_stack_index[index,k]]=i Then
              f=True
            End If
          End If
          k:+1
        Wend

        If f=True Then
          If item_type_room[i]>item_type_room[ti] Then
            ti=i
            t=True
          End If
        End If

      End If
    End If

  Next

  If t=True Then
    item_type[index]=ti
  End If

  End If


End Function




Function item_stack_shift(i)

  If item_stack_count[i]>0 Then

  Local e=False
  Local j=0
  Local f=False
  Local l=0

  While e=False And j<item_stack_max-1

    If item_stack[i,j]=0 Then

      f=False
      l=j+1

      While f=False And l<item_stack_max-1
        If item_stack[i,l]=1 Then

          item_stack[i,j]=1
          item_stack_index[i,j]=item_stack_index[i,l]

          item_location[item_stack_index[i,j]]=location_item_stack
          item_location_index[item_stack_index[i,j]]=i
          item_location_pos[item_stack_index[i,j],0]=j

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

  End If

End Function



Function item_stack_destroy(stack)

  If item[stack]>0 Then

  If item_stack_count[stack]=1 Then

    Local item=item_stack_pick_first_item(stack)

    item_location_set(item,item_location[stack],item_location_index[stack],item_location_pos[stack,0],item_location_pos[stack,1],item_location_pos[stack,2])

    Return item

  End If

  End If

Return -1

End Function


Function item_stack_create(index)

  If item[index]>0 Then

	  Local i=item_new(item_type[index],item_location[index],item_location_index[index],item_location_pos[index,0],item_location_pos[index,1],item_location_pos[index,2],item_zustand[index])
	  If i>=0 Then
	
	    item_stack_count[i]=0

      item_location_set(i,item_location[index],item_location_index[index],item_location_pos[index,0],item_location_pos[index,1],item_location_pos[index,2],1)
	    item_location_set(index,location_item_stack,i,0,0,0,1)
	
	    Return i
	
	  End If

  End If


  Return -1

End Function





Function item_stack_pick_first_item(i,o=0,d=0)

  'get first item
  'del item
  'shift stack
  If item[i]>0 Then
	  If item_stack_count[i]>0 Then
	
	    Local l=0
	    While l<item_stack_max
	
	      If item_stack[i,l]>0 Then
	        Local k=item_stack_index[i,l]
			
			    item_location_set(k,location_none,0,0,0,0,o,d)
			
	        Return k
	      Else
	        l:+1
	      End If
	
	    Wend
	
	  Else
		  item_location_set(i,location_none,0,0,0,0,o,d)
	    Return i
	  End If
  End If

  Return -1

End Function




Function item_stack_get_first_item(i)

  'get first item

  If item[i]>0 Then
	  If item_stack_count[i]>0 Then
	
	    Local l=0
	    While l<item_stack_max
	
	      If item_stack[i,l]>0 Then
	        Return item_stack_index[i,l]
	      Else
	        l:+1
	      End If
	
	    Wend
	
	  Else
	    Return i
	  End If
  End If

  Return -1

End Function




Function item_stack_switch_item(i,k)

  'check count
  'get first item from i
  'check if space on k
  'pick first item from i
  'add item to k

  If item_type_stack[item_type[k]]>0 Then

      Local l=item_stack_get_first_item(i)

      If item_stack_check(k,l)=True Then

        Local l=item_stack_pick_first_item(i)

        If l>=0 Then

          If item_stack_count[k]=0 Then
            k=item_stack_create(k)
          End If

          k=item_stack_add_item(k,l)

          If k>=0 Then
            Return True
          End If
        End If

      End If

    End If

  Return False

End Function




Function item_stack_combine(i,k)

  'while count of i > 0 and count of k < stack max and space max
  'pick item from i
  'add item to k

  Local f=True


  If item_type_stack[item_type[i]]>0 And item_type_stack[item_type[k]]>0 Then

  If item_stack_count[i]=0 Then
    i=item_stack_create(i)
  End If

  If item_stack_count[k]=0 Then
    k=item_stack_create(k)
  End If


	  While f=True And item[i]>0
	
	    f=False
	
	    Local item=item_stack_get_first_item(i)
	
      If item>=0 Then

        If item_stack_check(k,item)=True Then
	
	        item=item_stack_pick_first_item(i,0,1)
	        k=item_stack_add_item(k,item)

          If k>=0 Then
            f=True
          End If

	      End If
	
	    End If
	
	  Wend
	
	    If item_stack_count[i]=1 Then
	      item_stack_destroy(i)
	    End If
	
	    If item_stack_count[k]=1 Then
	      item_stack_destroy(k)
	    End If
	
	  If f=True Then
	    Return True
	  End If

  End If

  Return False

End Function



Function item_stack_add_item(index,item)

   If item_stack_check(index,item)=True Then

    If item_stack_count[index]=0 Then
      index=item_stack_create(index)
    End If

    For Local i=0 To item_type_stack[item_type[index]]-1
      If item_stack[index,i]=0 Then

        item_location_set(item,location_item_stack,index,i)

        Return index

      End If
    Next

  End If

  Return -1

End Function




Function item_add_to_slot(index,slot,item)

  Local c=item_slot_get_room(index,slot)

  If c>=item_type_room[item_type[item]] Then

	  For Local i=0 To item_type_slot_capacity[item_type[index],slot]-1
	    If item_slot[index,slot,i]=0 Then
	
	      item_slot[index,slot,i]=1
	      item_slot_index[index,slot,i]=item
	
	      item_location[item]=location_item_slot
	      item_location_index[item]=index
	      item_location_pos[item,0]=slot
	      item_location_pos[item,1]=i
	
	      Return True
	
	    End If
	  Next

  End If

  Return False

End Function




Function item_add_to_heap(index,item)

  If item_stack_count[index]>0 Then

    'add to stack

    If item_stack_count[item]=0 Then

      'is solo item

      If item_stack_add_item(index,item)=index Then
        Return True
      End If

    Else

      'is stack item

      If item_stack_combine(index,item)=True Then
        Return True
      End If

    End If

  Else

    'new stack

      Local i=item_stack_create(index)
      If i>=0 Then
      If item_stack_add_item(i,item)=i Then
        Return True
      End If
      End If

  End If

  Return False

End Function



Function item_ammo_shift(i)

  If item_ammo_count[i]>0 Then

  Local e=False
  Local j=0
  Local f=False
  Local l=0

  While e=False And j<item_ammo_max-1

    If item_ammo[i,j]=0 Then

      f=False
      l=j+1

      While f=False And l<item_ammo_max-1
        If item_ammo[i,l]=1 Then

          item_ammo[i,j]=1
          item_ammo_index[i,j]=item_ammo_index[i,l]

          item_location[item_ammo_index[i,j]]=item_location[item_ammo_index[i,l]]
          item_location_index[item_ammo_index[i,j]]=i
          item_location_pos[item_ammo_index[i,j],0]=j

          item_ammo[i,l]=0
          f=True

        Else
          l:+1
        End If
      Wend

    End If

    If l=item_ammo_max-1 Then
      e=True
    Else
      j:+1
    End If

  Wend

  End If

End Function



Function item_ammo_pick(weapon)

  If item_ammo_count[weapon]>0 Then

  For Local i=0 To item_ammo_max-1

    If item_ammo[weapon,i]>0 Then
      
      Local k=item_ammo_index[weapon,i]

        item_location_set(k,location_none)

      Return k

    End If

  Next

  End If

  Return -1

End Function



Function item_ammo_add(item,bullet)

  If item_type_kaliber_type[item_type[item]]=item_type_kaliber_type[item_type[bullet]] Then
    If item_ammo_count[item]<item_type_ammo[item_type[item]] Then

      For Local i=0 To item_ammo_max-1

        If item_ammo[item,i]=0 Then

          item_ammo[item,i]=1
          item_ammo_index[item,i]=bullet

          item_ammo_count[item]:+1

          If item_group_check(item_type[item],group_weapon) Then
            item_location[bullet]=location_weapon
          Else
            If item_group_check(item_type[item],group_magazine) Then
              item_location[bullet]=location_magazine
            Else
              item_location[bullet]=location_none
            End If
          End If

          item_location_index[bullet]=item
          item_location_pos[bullet,0]=i

          Return i

        End If

      Next

    End If
  End If

  Return -1

End Function



Function item_stack_find_first_bullet(stack,cal)

  If item_stack_count[stack]=0 Then
      If item_type_kaliber_type[item_type[stack]]=cal Then
        Return True
      End If

  Else

  For Local i=0 To item_stack_max-1

    If item_stack[stack,i]=1 Then

      If item_type_kaliber_type[item_type[item_stack_index[stack,i]]]=cal Then

        Return True

      End If

    End If

  Next

  End If

  Return False

End Function




Function item_stack_pick_first_bullet(stack,cal)

  If item_stack_count[stack]=0 Then
      If item_type_kaliber_type[item_type[stack]]=cal Then
        item_location_set(stack,location_none)
        Return stack
      End If
  Else

  For Local i=0 To item_stack_max-1

    If item_stack[stack,i]=1 Then

      If item_type_kaliber_type[item_type[item_stack_index[stack,i]]]=cal Then

        Local k=item_stack_index[stack,i]

        item_location_set(k,location_none)

        Return k

      End If

    End If

  Next

  End If

  Return -1

End Function



Function item_stack_find_first_magazine(stack,weapon)

  If item_stack_count[stack]=0 Then

      If item_type_kaliber_type[item_type[stack]]=item_type_kaliber_type[item_type[weapon]] Then

      Local b1=item_group_check(item_type[stack],item_type_group[item_type[weapon],1]) And item_type_group[item_type[stack],1]<>group_none

      If b1=True Then

         Return True

      End If

      End If

  Else

  For Local i=0 To item_stack_max-1

    If item_stack[stack,i]=1 Then

      If item_type_kaliber_type[item_type[item_stack_index[stack,i]]]=item_type_kaliber_type[item_type[weapon]] Then

      Local b1=item_group_check(item_type[item_stack_index[stack,i]],item_type_group[item_type[weapon],1]) And item_type_group[item_type[item_stack_index[stack,i]],1]<>group_none

      If b1=True Then

        Return True

      End If

      End If

    End If

  Next

  End If

  Return False

End Function



Function item_stack_pick_first_magazine(stack,weapon)

  If item_stack_count[stack]=0 Then

      If item_type_kaliber_type[item_type[stack]]=item_type_kaliber_type[item_type[weapon]] Then

      Local b1=item_group_check(item_type[stack],item_type_group[item_type[weapon],1]) And item_type_group[item_type[stack],1]<>group_none

      If b1=True Then

        item_location_set(stack,location_none)
        Return stack

      End If

      End If
  Else

  For Local i=0 To item_stack_max-1

    If item_stack[stack,i]=1 Then

      If item_type_kaliber_type[item_type[item_stack_index[stack,i]]]=item_type_kaliber_type[item_type[weapon]] Then

      Local b1=item_group_check(item_type[item_stack_index[stack,i]],item_type_group[item_type[weapon],1]) And item_type_group[item_type[item_stack_index[stack,i]],1]<>group_none

      If b1=True Then

        Local k=item_stack_index[stack,i]

        item_location_set(k,location_none)

        Return k

      End If

      End If

    End If

  Next

  End If

  Return -1

End Function







Function item_location_set(item,location,index=0,pos0=0,pos1=0,pos2=0,delold=0,destroy=0)

  'delete old ref
  If delold=0 Then
	    Select item_location[item]
	
		    Case location_player_hand
	
		      Select item_location_pos[item,0]
		
		        Case player_lefthand
				      player_hand[item_location_index[item],player_lefthand]=0
		        Case player_righthand
		          player_hand[item_location_index[item],player_righthand]=0
		        Case player_dualhand
		          player_hand[item_location_index[item],player_lefthand]=0
		          player_hand[item_location_index[item],player_righthand]=0
		      End Select

        Case location_item_slot
          item_slot[item_location_index[item],item_location_pos[item,0],item_location_pos[item,1]]=0

        Case location_item_stack

          item_stack[item_location_index[item],item_location_pos[item,0]]=0
          item_stack_count[item_location_index[item]]:-1

	        If item_stack_count[item_location_index[item]]>0 Then
	          item_stack_shift(item_location_index[item])
	          item_stack_calc_zustand(item_location_index[item])
            item_stack_find_type(item_location_index[item])
	        Else
	          item_del(item_location_index[item])
	        End If

          If destroy=0 Then
          If item_stack_count[item_location_index[item]]=1 Then
            item_stack_destroy(item_location_index[item])
          End If
          End If
		
		    Case location_mouse
		
		      mouse_inventory=0
		
		    Case location_weapon
		
		      If item_group_check(item_type[item],group_magazine)=True Then
		          item_magazine[item_location_index[item]]=0
		      Else
		        If item_group_check(item_type[item],group_ammo)=True Then
		          item_ammo[item_location_index[item],item_location_pos[item,0]]=0
		          item_ammo_count[item_location_index[item]]:-1
		          If item_ammo_count[item_location_index[item]]>0 Then
		            item_ammo_shift(item_location_index[item])
		          End If
		        End If
		      End If
		
		
		    Case location_magazine

		        item_ammo[item_location_index[item],item_location_pos[item,0]]=0
		        item_ammo_count[item_location_index[item]]:-1
		        If item_ammo_count[item_location_index[item]]>0 Then
		          item_ammo_shift(item_location_index[item])
		        End If


	    End Select


  End If

	item_location[item]=location
	item_location_index[item]=index
	item_location_pos[item,0]=pos0
	item_location_pos[item,1]=pos1
  item_location_pos[item,2]=pos2


  'set new ref

	    Select item_location[item]
	
		    Case location_player_hand
	
		      Select item_location_pos[item,0]
		
		        Case player_lefthand
				      player_hand[item_location_index[item],player_lefthand]=1
              player_hand_index[item_location_index[item],player_lefthand]=item
		        Case player_righthand
		          player_hand[item_location_index[item],player_righthand]=1
		          player_hand_index[item_location_index[item],player_righthand]=item
		        Case player_dualhand
		          player_hand[item_location_index[item],player_lefthand]=1
		          player_hand[item_location_index[item],player_righthand]=1
		          player_hand_index[item_location_index[item],player_lefthand]=item
				      player_hand_index[item_location_index[item],player_righthand]=item
		      End Select

        Case location_item_slot
          item_slot[item_location_index[item],item_location_pos[item,0],item_location_pos[item,1]]=1
          item_slot_index[item_location_index[item],item_location_pos[item,0],item_location_pos[item,1]]=item

        Case location_item_stack
          item_stack[item_location_index[item],item_location_pos[item,0]]=1
		      item_stack_index[item_location_index[item],item_location_pos[item,0]]=item
          item_stack_count[item_location_index[item]]:+1
          item_stack_calc_zustand(item_location_index[item])
          item_stack_find_type(item_location_index[item])
		
		    Case location_mouse
		
		      mouse_inventory=1
		      mouse_inventory_index=item
		
		    Case location_weapon
		
		      If item_group_check(item_type[item],group_magazine)=True Then
		          item_magazine[item_location_index[item]]=1
		          item_magazine_index[item_location_index[item]]=item		
		      Else
		        If item_group_check(item_type[item],group_ammo)=True Then
		          item_ammo[item_location_index[item],item_location_pos[item,0]]=1
		          item_ammo_index[item_location_index[item],item_location_pos[item,0]]=item
		          item_ammo_count[item_location_index[item]]:+1
		        End If
		      End If
		
		
		    Case location_magazine
		        item_ammo[item_location_index[item],item_location_pos[item,0]]=1
		        item_ammo_index[item_location_index[item],item_location_pos[item,0]]=item
		        item_ammo_count[item_location_index[item]]:+1

	    End Select




End Function




