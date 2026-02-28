function call_your_pet:horn/do_teleport_macro with storage call_your_pet:root

execute store result storage call_your_pet:root save_id int 1 run data get storage call_your_pet:root call_id
data modify storage call_your_pet:root save_dim set from storage call_your_pet:root player_dim
function call_your_pet:position/save_dim_to_storage with storage call_your_pet:root

data modify storage call_your_pet:root save_x set from storage call_your_pet:root player_x
data modify storage call_your_pet:root save_z set from storage call_your_pet:root player_z
data modify storage call_your_pet:root save_id set from storage call_your_pet:root call_id
function call_your_pet:position/save_position_to_storage with storage call_your_pet:root