execute store result storage call_your_pet:root save_x int 1 run data get entity @s Pos[0]
execute store result storage call_your_pet:root save_z int 1 run data get entity @s Pos[2]
execute store result storage call_your_pet:root save_id int 1 run scoreboard players get @s cyp.pet_id
data modify storage call_your_pet:root save_dim set from entity @s Dimension
function call_your_pet:save_position_to_storage with storage call_your_pet:root