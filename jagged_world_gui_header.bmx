
Global img_gui_time:TImage=LoadImage("gfx/world/gui/time.png",0)
MidHandleImage(img_gui_time)

Global img_gui_minimap:TImage=LoadImage("gfx/world/gui/minimap.png",0)
MidHandleImage(img_gui_minimap)


Global img_blood:TImage=LoadImage("gfx/world/gui/blood.png",0)
Global img_cross:TImage=LoadImage("gfx/world/gui/cross.png",0)
Global img_toxic:TImage=LoadImage("gfx/world/gui/toxic.png",0)
Global img_freeze:TImage=LoadImage("gfx/world/gui/freeze.png",0)
Global img_sick:TImage=LoadImage("gfx/world/gui/bio.png",0)




Global img_slot_end:TImage=LoadImage("gfx/world/gui/slot_end.png",0)

Global img_slot_minimized:TImage=LoadImage("gfx/world/gui/slot_minimized.png",0)

Global img_slot_tiny:TImage=LoadImage("gfx/world/gui/slot_tiny.png",0)
Global img_slot_small:TImage=LoadImage("gfx/world/gui/slot_small.png",0)
Global img_slot_mid:TImage=LoadImage("gfx/world/gui/slot_mid.png",0)
Global img_slot_big:TImage=LoadImage("gfx/world/gui/slot_big.png",0)
Global img_slot_hand:TImage=LoadImage("gfx/world/gui/slot_hand.png",0)

Global img_slot_tiny_blocked:TImage=LoadImage("gfx/world/gui/slot_tiny_blocked.png",0)
Global img_slot_small_blocked:TImage=LoadImage("gfx/world/gui/slot_small_blocked.png",0)
Global img_slot_mid_blocked:TImage=LoadImage("gfx/world/gui/slot_mid_blocked.png",0)
Global img_slot_big_blocked:TImage=LoadImage("gfx/world/gui/slot_big_blocked.png",0)
Global img_slot_hand_blocked:TImage=LoadImage("gfx/world/gui/slot_hand_blocked.png",0)



Global img_main_data:TImage=LoadImage("gfx/world/gui/main_data.png",0)

Global img_player_mouseover:TImage=LoadImage("gfx/world/gui/player_mouseover.png",0)
Global img_player_select:TImage=LoadImage("gfx/world/gui/player_select.png",0)
Global img_player_select_main:TImage=LoadImage("gfx/world/gui/player_select_main.png",0)



Global gui_main_data_x=0
Global gui_main_data_y=wy-ImageHeight(img_slot_hand)*2-ImageHeight(img_main_data)

Global gui_main_data_dx=ImageWidth(img_main_data)*group_player_max
Global gui_main_data_dy=wy-ImageHeight(img_slot_hand)*2


Global gui_hand_x=0
Global gui_hand_y=wy-ImageHeight(img_slot_hand)*2

Global gui_hand_dx=ImageWidth(img_slot_hand)*group_player_max
Global gui_hand_dy=wy





Global gui_inventar_open=0

Global gui_inventar_x=0
Global gui_inventar_y=wy-40-ImageHeight(img_main_data)-ImageHeight(img_slot_hand)*2-ImageHeight(img_slot_big)*player_inv_max-ImageHeight(img_slot_big)*2

Global gui_inventar_dx=ImageWidth(img_slot_tiny)*item_slot_max*item_capacity_max+ImageWidth(img_slot_big)
Global gui_inventar_dy=wy-40-ImageHeight(img_main_data)-ImageHeight(img_slot_hand)*2-ImageHeight(img_slot_big)*2

Global gui_inventar_minimized_dx=ImageWidth(img_slot_minimized)



Global gui_hand2_open=0

Global gui_hand2_x=0
Global gui_hand2_y=wy-20-ImageHeight(img_main_data)-ImageHeight(img_slot_hand)*2-ImageHeight(img_slot_big)*2

Global gui_hand2_dx=ImageWidth(img_slot_tiny)*item_slot_max*item_capacity_max+ImageWidth(img_slot_big)
Global gui_hand2_dy=wy-20-ImageHeight(img_main_data)-ImageHeight(img_slot_hand)*2

Global gui_hand2_minimized_dx=ImageWidth(img_slot_minimized)

