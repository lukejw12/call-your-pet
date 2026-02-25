scoreboard players add #next cyp.next_id 1
scoreboard players operation @e[tag=cyp.target,limit=1] cyp.pet_id = #next cyp.next_id

tag @e[tag=cyp.target,limit=1] add cyp.registered

data modify storage call_your_pet:root pet_uuid set from entity @e[tag=cyp.target,limit=1] UUID
data modify storage call_your_pet:root pet_name set from entity @e[tag=cyp.target,limit=1] CustomName

execute store result storage call_your_pet:root pet_id int 1 run scoreboard players get #next cyp.next_id

execute unless data entity @e[tag=cyp.target,limit=1] CustomName run data modify storage call_your_pet:root pet_name set value '"Pet"'

function call_your_pet:give_horn_macro with storage call_your_pet:root

tellraw @s ["",{"text":"[Call Your Pet]","color":"gold"}," ",{"text":"Pet registered! Use the goat horn to call it.","color":"green"}]

tag @e remove cyp.target