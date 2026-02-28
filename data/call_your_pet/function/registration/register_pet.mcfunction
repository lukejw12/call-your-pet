scoreboard players set @s cyp.stare_timer 0

scoreboard players add #next cyp.next_id 1
execute unless entity @e[tag=cyp.target,tag=cyp.registered] run scoreboard players operation @e[tag=cyp.target,limit=1] cyp.pet_id = #next cyp.next_id
tag @e[tag=cyp.target,limit=1] add cyp.registered

execute store result storage call_your_pet:root temp_pet_id int 1 run scoreboard players get @e[tag=cyp.target,limit=1] cyp.pet_id

data modify storage call_your_pet:root temp_owner_uuid set from entity @s UUID
function call_your_pet:registration/save_owner with storage call_your_pet:root

data remove storage call_your_pet:root temp_pet_id
data remove storage call_your_pet:root temp_owner_uuid

execute as @e[tag=cyp.target,limit=1] at @s run function call_your_pet:position/save_position

execute store result storage call_your_pet:root save_id int 1 run scoreboard players get @e[tag=cyp.target,limit=1] cyp.pet_id
data modify storage call_your_pet:root save_dim set from entity @s Dimension
function call_your_pet:position/save_dim_to_storage with storage call_your_pet:root

summon item_display ~ ~ ~ {Tags:["cyp.temp_item"]}

data modify entity @e[tag=cyp.temp_item,limit=1] item set value {id:"minecraft:goat_horn",count:1,components:{}}

data modify entity @e[tag=cyp.temp_item,limit=1] item.components."minecraft:instrument" set from entity @s SelectedItem.components."minecraft:instrument"

data modify entity @e[tag=cyp.temp_item,limit=1] item.components."minecraft:item_name" set from entity @e[tag=cyp.target,limit=1] CustomName

data modify entity @e[tag=cyp.temp_item,limit=1] item.components."minecraft:enchantment_glint_override" set value 1b

data modify entity @e[tag=cyp.temp_item,limit=1] item.components."minecraft:custom_data" set value {call_your_pet:{}}
data modify entity @e[tag=cyp.temp_item,limit=1] item.components."minecraft:custom_data".call_your_pet.pet_uuid set from entity @e[tag=cyp.target,limit=1] UUID
data modify entity @e[tag=cyp.temp_item,limit=1] item.components."minecraft:custom_data".call_your_pet.owner_uuid set from entity @s UUID
execute store result storage call_your_pet:root temp_pet_id int 1 run scoreboard players get @e[tag=cyp.target,limit=1] cyp.pet_id
data modify entity @e[tag=cyp.temp_item,limit=1] item.components."minecraft:custom_data".call_your_pet.pet_id set from storage call_your_pet:root temp_pet_id

item replace entity @s weapon.mainhand from entity @e[tag=cyp.temp_item,limit=1] contents

kill @e[tag=cyp.temp_item]

item modify entity @s weapon.mainhand call_your_pet:add_owner_lore

data remove storage call_your_pet:root temp_pet_id

playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1
tellraw @s ["",{"text":"[Call Your Pet]","color":"gold"}," ",{"text":"Pet registered! Use the goat horn to call it.","color":"green"}]

tag @e remove cyp.target