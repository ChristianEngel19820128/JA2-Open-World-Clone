

Const group_act_rest=0
Const group_act_move=1
Const group_act_search=2
Const group_act_camp=3
Const group_act_fishing=4
Const group_act_hunt=5
Const group_act_scout=6



Const fraction_max=5

Const fraction_player=0
Const fraction_militia=1
Const fraction_enemy=2
Const fraction_neutral=3
Const fraction_bandit=4


Const group_max=128
Global group_count_max=10
Const group_player_max=8

Const mx_waypoints=16


'player group data

Global group_count
Global group_player_count[group_max]

Global group[group_max]

Global group_selected

Global group_fraction[group_max]

Global group_map_x[group_max]
Global group_map_y[group_max]

Global group_position[group_max]
Global group_position_set[group_max]

Global group_map_have_tar[group_max]

Global group_map_tar[group_max,mx_waypoints]
Global group_map_tar_x[group_max,mx_waypoints]
Global group_map_tar_y[group_max,mx_waypoints]

Global group_map_find_new_way[group_max]

Global group_map_new_tar[group_max,mx_waypoints]
Global group_map_new_tar_x[group_max,mx_waypoints]
Global group_map_new_tar_y[group_max,mx_waypoints]

Global group_move_t[group_max]
Global group_move_s[group_max]


Global group_action[group_max]
Global group_action_t[group_max]
Global group_action_s[group_max]

'group single player actions

Global group_player[group_max,group_player_max]
Global group_player_index[group_max,group_player_max]

Global group_scout[group_max]
Global group_leader[group_max]


Const c_leader=1
Const c_scout=2
Const c_sani=3
Const c_mech=4

Global group_player_role[group_max,group_player_max]

Global group_player_action[group_max,group_player_max]
Global group_player_action_t[group_max,group_player_max]
Global group_player_action_s[group_max,group_player_max]



