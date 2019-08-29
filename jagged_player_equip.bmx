





Function player_add_item(index,item:String,location)

  Local t=item_get_type_index(item)
  If t>=0 Then
    Local i=item_new(t,location,index)
    If i>=0 Then

    Else

    End If
  Else

  End If

End Function





Function player_add_custom_equip(index)

  player_add_item(index,"swgrizzly",location_player_hand)
  player_add_item(index,"hunting_backpack",location_player_inventory)

End Function