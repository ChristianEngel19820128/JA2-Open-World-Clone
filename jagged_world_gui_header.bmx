

Global img_blood:TImage=LoadImage("gfx/world/gui/blood.png",0)
Global img_cross:TImage=LoadImage("gfx/world/gui/cross.png",0)
Global img_toxic:TImage=LoadImage("gfx/world/gui/toxic.png",0)
Global img_freeze:TImage=LoadImage("gfx/world/gui/freeze.png",0)
Global img_sick:TImage=LoadImage("gfx/world/gui/bio.png",0)


Global img_slot_minimized:TImage=LoadImage("gfx/world/gui/slot_minimized.png",0)

Global img_slot_tiny:TImage=LoadImage("gfx/world/gui/slot_tiny.png",0)
Global img_slot_small:TImage=LoadImage("gfx/world/gui/slot_small.png",0)
Global img_slot_mid:TImage=LoadImage("gfx/world/gui/slot_mid.png",0)
Global img_slot_big:TImage=LoadImage("gfx/world/gui/slot_big.png",0)

Global img_main_data:TImage=LoadImage("gfx/world/gui/main_data.png",0)

Global img_player_select:TImage=LoadImage("gfx/world/gui/player_select.png",0)
Global img_player_select_main:TImage=LoadImage("gfx/world/gui/player_select_main.png",0)

Global gui_main_data_x=0
Global gui_main_data_y=wy-ImageHeight(img_main_data)

Global gui_main_data_dx=ImageWidth(img_main_data)*group_player_max
Global gui_main_data_dy=wy



Global gui_inventar_open=0

Global gui_inventar_x=0
Global gui_inventar_y=wy-ImageHeight(img_main_data)-150-ImageHeight(img_slot_big)*player_inv_max

Global gui_inventar_dx=ImageWidth(img_slot_tiny)*item_slot_max*item_capacity_max+ImageWidth(img_slot_big)
Global gui_inventar_dy=wy-150-ImageHeight(img_main_data)

Global gui_inventar_minimized_dx=ImageWidth(img_slot_minimized)

Global gui_hand_open=0

Global gui_hand_x=0
Global gui_hand_y=wy-ImageHeight(img_main_data)-25-ImageHeight(img_slot_big)*player_hand_max

Global gui_hand_dx=ImageWidth(img_slot_big)
Global gui_hand_dy=wy-ImageHeight(img_main_data)-25

Global gui_hand_minimized_dx=ImageWidth(img_slot_minimized)