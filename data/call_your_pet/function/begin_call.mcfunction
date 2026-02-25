tag @s add cyp.calling

data modify storage call_your_pet:root uuid_check set from entity @s UUID
execute store success score #uuid_match cyp.temp run data modify storage call_your_pet:root uuid_check set from entity @s SelectedItem.components."minecraft:custom_data".call_your_pet.owner_uuid

execute if score #uuid_match cyp.temp matches 1 run tellraw @s ["",{"text":"[Call Your Pet]","color":"gold"}," ",{"text":"This horn doesn't belong to you!","color":"red"}]
execute if score #uuid_match cyp.temp matches 1 run tag @s remove cyp.calling
execute if score #uuid_match cyp.temp matches 1 run return 0

data remove storage call_your_pet:root uuid_check

execute store result storage call_your_pet:root call_id int 1 run data get entity @s SelectedItem.components."minecraft:custom_data".call_your_pet.pet_id
execute store result score #call_pet_id cyp.temp run data get entity @s SelectedItem.components."minecraft:custom_data".call_your_pet.pet_id

data modify storage call_your_pet:root player_dim set from entity @s Dimension
execute store result storage call_your_pet:root player_x int 1 run data get entity @s Pos[0]
execute store result storage call_your_pet:root player_y int 1 run data get entity @s Pos[1]
execute store result storage call_your_pet:root player_z int 1 run data get entity @s Pos[2]

function call_your_pet:load_pet_position with storage call_your_pet:root
function call_your_pet:forceload_add with storage call_your_pet:root