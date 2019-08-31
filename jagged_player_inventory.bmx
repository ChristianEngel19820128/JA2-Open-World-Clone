


Function player_hand_item_add(index,i,typ)

  If item_type_dual[typ]>0 Then
    If player_hand[index,player_lefthand]=0 And player_hand[index,player_righthand]=0 Then
      player_hand[index,player_righthand]=1
      player_hand[index,player_lefthand]=1
      player_hand_index[index,player_righthand]=i
      player_hand_index[index,player_lefthand]=i
      item_location[i]=location_player_hand
      item_location_index[i]=index
      item_location_pos[i]=player_dualhand
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
          item_location_pos[i]=player_lefthand
          Return True
        Else
          If player_hand[index,player_righthand]=0 Then
            player_hand[index,player_righthand]=1
            player_hand_index[index,player_righthand]=i
            item_location[i]=location_player_hand
            item_location_index[i]=index
            item_location_pos[i]=player_righthand
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
          item_location_pos[i]=player_righthand
          Return True
        Else
          If player_hand[index,player_lefthand]=0 Then
            player_hand[index,player_lefthand]=1
            player_hand_index[index,player_lefthand]=i
            item_location[i]=location_player_hand
            item_location_index[i]=index
            item_location_pos[i]=player_lefthand
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
      item_location_pos[i]=item_type_inv_slot[typ]
      Return True
    Else
      Return False
    End If
  Else
    Return False
  End If

End Function



Function player_bag_item_add(index,i,typ)

  For Local i=0 To player_inv_max-1
    If player_inventory[index,i]=1 Then
      If item_type_slots[item_type[player_inventory[index,i]]]>0 Then
        For Local k=0 To item_type_slots[item_type[player_inventory[index,i]]]-1
          If item_type_slot_capacity[item_type[player_inventory[index,i]],k]>0 Then
            For Local l=0 To item_type_slot_capacity[item_type[player_inventory[index,i]],k]-1
              Local c=item_type_slot_capacity[item_type[player_inventory[index,i]],k]
              If item_slot[player_inventory_index[index,i],k,l]=0 Then
                If c>=item_type_room[typ] Then
                  item_slot[player_inventory_index[index,i],k,l]=1
                  item_slot_index[player_inventory_index[index,i],k,l]=i
                  item_location[i]=location_player_bag
                  item_location_index[i]=index
                  item_location_pos_1[item_max]=k
                  item_location_pos_2[item_max]=l
                  Return True
                End If
              Else
                c:-item_type_room[item_type[item_slot_index[player_inventory_index[index,i],k,l]]]
              End If
            Next
         End If
       Next
      End If
    End If
  Next
  Return False
End Function





