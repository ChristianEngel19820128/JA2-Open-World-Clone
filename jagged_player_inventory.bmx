


Function player_hand_item_add(index,i,typ)

  If item_type_dual[typ]>0 Then
    If player_hand[index,player_lefthand]=0 And player_hand[index,player_righthand]=0 Then
      player_hand[index,player_righthand]=1
      player_hand[index,player_lefthand]=1
      player_hand_index[index,player_righthand]=i
      player_hand_index[index,player_lefthand]=i
      item_location[i]=location_player_hand
      item_location_index[i]=index
      item_location_pos[item_max]=0
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
          item_location_pos[item_max]=player_lefthand
          Return True
        Else
          If player_hand[index,player_righthand]=0 Then
            player_hand[index,player_righthand]=1
            player_hand_index[index,player_righthand]=i
            item_location[i]=location_player_hand
            item_location_index[i]=index
            item_location_pos[item_max]=player_righthand
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
          item_location_pos[item_max]=player_righthand
          Return True
        Else
          If player_hand[index,player_lefthand]=0 Then
            player_hand[index,player_lefthand]=1
            player_hand_index[index,player_lefthand]=i
            item_location[i]=location_player_hand
            item_location_index[i]=index
            item_location_pos[item_max]=player_lefthand
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
      item_location_pos[item_max]=0

      Return True
    Else
      Return False
    End If
  Else
    Return False
  End If

End Function



Function player_bag_item_add(index,i,typ)



End Function