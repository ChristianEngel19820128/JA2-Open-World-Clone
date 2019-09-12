


Function player_check_hand(index)

  If player_hand[index,player_lefthand]=1 And player_hand[index,player_righthand]=1 Then
    If item_type_dual[item_type[player_hand_index[index,player_righthand]]]=1 Then
      If item_group_check(item_type[player_hand_index[index,player_righthand]],group_weapon)=True Then
        Return 1
      End If
    Else
      If item_group_check(item_type[player_hand_index[index,player_lefthand]],group_weapon)=True And item_group_check(item_type[player_hand_index[index,player_righthand]],group_weapon)=True Then
        Return 3
      Else
        If item_group_check(item_type[player_hand_index[index,player_lefthand]],group_weapon)=True Or item_group_check(item_type[player_hand_index[index,player_righthand]],group_weapon)=True Then
          Return 2
        End If
      End If
    End If
  Else
    If player_hand[index,player_lefthand]=1 Then
      If item_group_check(item_type[player_hand_index[index,player_lefthand]],group_weapon)=True
        Return 2
      End If
    Else
      If player_hand[index,player_righthand]=1 Then
        If item_group_check(item_type[player_hand_index[index,player_righthand]],group_weapon)=True
          Return 2
        End If
      End If
    End If
  End If

  Return 0
End Function



Function player_hand_item_add(index,i,typ)

  If item_type_dual[typ]>0 Then
    If player_hand[index,player_lefthand]=0 And player_hand[index,player_righthand]=0 Then
      player_hand[index,player_righthand]=1
      player_hand[index,player_lefthand]=1
      player_hand_index[index,player_righthand]=i
      player_hand_index[index,player_lefthand]=i
      item_location[i]=location_player_hand
      item_location_index[i]=index
      item_location_pos[i,0]=player_dualhand
      Return True
    Else
      Return False
    End If
  Else

    Select player_handed[index]

      Case player_lefthand

        If player_hand[index,player_lefthand]=0 Then
          player_hand[index,player_lefthand]=1
          player_hand_index[index,player_lefthand]=i
          item_location[i]=location_player_hand
          item_location_index[i]=index
          item_location_pos[i,0]=player_lefthand
          Return True
        Else
          If player_hand[index,player_righthand]=0 Then
            player_hand[index,player_righthand]=1
            player_hand_index[index,player_righthand]=i
            item_location[i]=location_player_hand
            item_location_index[i]=index
            item_location_pos[i,0]=player_righthand
            Return True
          Else
            Return False
          End If
        End If

      Default

        If player_hand[index,player_righthand]=0 Then
          player_hand[index,player_righthand]=1
          player_hand_index[index,player_righthand]=i
          item_location[i]=location_player_hand
          item_location_index[i]=index
          item_location_pos[i,0]=player_righthand
          Return True
        Else
          If player_hand[index,player_lefthand]=0 Then
            player_hand[index,player_lefthand]=1
            player_hand_index[index,player_lefthand]=i
            item_location[i]=location_player_hand
            item_location_index[i]=index
            item_location_pos[i,0]=player_lefthand
            Return True
          Else
            Return False
          End If
        End If

    End Select

  End If

End Function



Function player_inventory_item_add(index,i,typ)

  If item_type_inv_slot[typ]>player_inv_none Then
    If player_inventory[index,item_type_inv_slot[typ]]=0 Then
      player_inventory[index,item_type_inv_slot[typ]]=1
      player_inventory_index[index,item_type_inv_slot[typ]]=i
      item_location[i]=location_player_inventory
      item_location_index[i]=index
      item_location_pos[i,0]=item_type_inv_slot[typ]
      Return True
    Else
      Return False
    End If
  Else
    Return False
  End If

End Function



Function player_bag_item_add(index,item,typ)

  'find stack to add
  For Local inv=0 To player_inv_max-1
    If player_inventory[index,inv]=1 Then
      If item_type_slots[item_type[player_inventory_index[index,inv]]]>0 Then

        Local heap=item_find_heap(player_inventory_index[index,inv],typ)
        If heap>=0 Then
          If item_add_to_heap(heap,item)=True Then
            Return True
          End If
        End If

      End If
    End If
  Next

  'find slot to add
  For Local inv=0 To player_inv_max-1
    If player_inventory[index,inv]=1 Then
      If item_type_slots[item_type[player_inventory_index[index,inv]]]>0 Then

        Local slot=item_find_free_slot(player_inventory_index[index,inv],item_type_room[typ])
        If slot>=0 Then
          If item_add_to_slot(player_inventory_index[index,inv],slot,item)=True Then
            Return True
          End If
        End If

      End If
    End If
  Next

  Return False

End Function





