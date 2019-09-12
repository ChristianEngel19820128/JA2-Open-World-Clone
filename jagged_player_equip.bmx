





Function player_add_item(index,item:String,location)

  Local t=item_get_type_index(item)
  If t>=0 Then

    Local i=item_new(t,location,index)
    If i>=0 Then

    Else

    End If
  Else
    Print "item "+item+" not found"
  End If

End Function





Function player_add_custom_equip(index)

  'item code from item_list.txt

  'player_add_item(index,"m4coltcommando",location_player_hand)
  player_add_item(index,"remington870",location_player_hand)
  player_add_item(index,"hunting_backpack",location_player_inventory)
  player_add_item(index,"tragetaschen",location_player_inventory)
  player_add_item(index,"taschenweste",location_player_inventory)
  player_add_item(index,"30mag556x45mm",location_player_bag)
  player_add_item(index,"556x45mm",location_player_bag)
  player_add_item(index,"556x45mm",location_player_bag)
  player_add_item(index,"556x45mm",location_player_bag)
  player_add_item(index,"556x45mm",location_player_bag)
  player_add_item(index,"556x45mm",location_player_bag)
  player_add_item(index,"556x45mm",location_player_bag)
  player_add_item(index,"9mm",location_player_bag)
  player_add_item(index,"9mm",location_player_bag)
  player_add_item(index,"9mm",location_player_bag)
  player_add_item(index,"9mm",location_player_bag)
  player_add_item(index,"9mm",location_player_bag)
  player_add_item(index,"9mm",location_player_bag)
  player_add_item(index,"9mm",location_player_bag)
  player_add_item(index,"9mm",location_player_bag)
  player_add_item(index,"12x70schrot",location_player_bag)
  player_add_item(index,"12x70schrot",location_player_bag)
  player_add_item(index,"12x70slug",location_player_bag)
  player_add_item(index,"12x70slug",location_player_bag)
  player_add_item(index,"mp5k",location_player_bag)
  player_add_item(index,"swgrizzly",location_player_bag)
  player_add_item(index,"beretta92f",location_player_bag)
  player_add_item(index,"30mpmag9mm",location_player_bag)
  player_add_item(index,"15mpmag9mm",location_player_bag)
  player_add_item(index,"15mpmag9mm",location_player_bag)
  player_add_item(index,"15pistolmag9mm",location_player_bag)
  player_add_item(index,"15pistolmag9mm",location_player_bag)
  player_add_item(index,"canteen",location_player_bag)

End Function