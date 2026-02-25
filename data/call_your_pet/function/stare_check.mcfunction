execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{call_your_pet:{}}}}}] run scoreboard players set @s cyp.stare_timer 0
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{call_your_pet:{}}}}}] run return 0

tag @e remove cyp.target
tag @s add cyp.raycaster
function call_your_pet:raycast/start
tag @s remove cyp.raycaster

execute unless entity @e[tag=cyp.target] run scoreboard players set @s cyp.stare_timer 0
execute unless entity @e[tag=cyp.target] run return 0

execute unless data entity @e[tag=cyp.target,limit=1] CustomName run scoreboard players set @s cyp.stare_timer 0
execute unless data entity @e[tag=cyp.target,limit=1] CustomName run return 0

execute if entity @e[tag=cyp.target,type=#call_your_pet:has_owner,limit=1] run function call_your_pet:check_owner
execute if score #cyp.owner_fail cyp.temp matches 1 run scoreboard players set @s cyp.stare_timer 0
execute if score #cyp.owner_fail cyp.temp matches 1 run tellraw @s ["",{"text":"[Call Your Pet]","color":"gold"}," ",{"text":"This pet belongs to someone else!","color":"red"}]
execute if score #cyp.owner_fail cyp.temp matches 1 run tag @e remove cyp.target
execute if score #cyp.owner_fail cyp.temp matches 1 run return 0

execute if entity @e[tag=cyp.target,type=minecraft:iron_golem,limit=1,nbt={PlayerCreated:0b}] run scoreboard players set @s cyp.stare_timer 0
execute if entity @e[tag=cyp.target,type=minecraft:iron_golem,limit=1,nbt={PlayerCreated:0b}] run tellraw @s ["",{"text":"[Call Your Pet]","color":"gold"}," ",{"text":"This iron golem was not player-built!","color":"red"}]
execute if entity @e[tag=cyp.target,type=minecraft:iron_golem,limit=1,nbt={PlayerCreated:0b}] run tag @e remove cyp.target
execute if entity @e[tag=cyp.target,type=minecraft:iron_golem,limit=1,nbt={PlayerCreated:0b}] run return 0

execute if entity @e[tag=cyp.target,tag=cyp.registered,limit=1] run function call_your_pet:check_claimed
execute if score #cyp.claim_fail cyp.temp matches 1 run scoreboard players set @s cyp.stare_timer 0
execute if score #cyp.claim_fail cyp.temp matches 1 run tellraw @s ["",{"text":"[Call Your Pet]","color":"gold"}," ",{"text":"This pet is already claimed by another player!","color":"red"}]
execute if score #cyp.claim_fail cyp.temp matches 1 run tag @e remove cyp.target
execute if score #cyp.claim_fail cyp.temp matches 1 run return 0

scoreboard players add @s cyp.stare_timer 1

execute if score @s cyp.stare_timer matches 1..6 run title @s actionbar [{"text":"[","color":"gray"},{"text":"██","color":"green"},{"text":"░░░░░░░░░░░░░░░░░░","color":"dark_green"},{"text":"]","color":"gray"}]
execute if score @s cyp.stare_timer matches 7..12 run title @s actionbar [{"text":"[","color":"gray"},{"text":"████","color":"green"},{"text":"░░░░░░░░░░░░░░░░","color":"dark_green"},{"text":"]","color":"gray"}]
execute if score @s cyp.stare_timer matches 13..18 run title @s actionbar [{"text":"[","color":"gray"},{"text":"██████","color":"green"},{"text":"░░░░░░░░░░░░░░","color":"dark_green"},{"text":"]","color":"gray"}]
execute if score @s cyp.stare_timer matches 19..24 run title @s actionbar [{"text":"[","color":"gray"},{"text":"████████","color":"green"},{"text":"░░░░░░░░░░░░","color":"dark_green"},{"text":"]","color":"gray"}]
execute if score @s cyp.stare_timer matches 25..30 run title @s actionbar [{"text":"[","color":"gray"},{"text":"██████████","color":"green"},{"text":"░░░░░░░░░░","color":"dark_green"},{"text":"]","color":"gray"}]
execute if score @s cyp.stare_timer matches 31..36 run title @s actionbar [{"text":"[","color":"gray"},{"text":"████████████","color":"green"},{"text":"░░░░░░░░","color":"dark_green"},{"text":"]","color":"gray"}]
execute if score @s cyp.stare_timer matches 37..42 run title @s actionbar [{"text":"[","color":"gray"},{"text":"██████████████","color":"green"},{"text":"░░░░░░","color":"dark_green"},{"text":"]","color":"gray"}]
execute if score @s cyp.stare_timer matches 43..48 run title @s actionbar [{"text":"[","color":"gray"},{"text":"████████████████","color":"green"},{"text":"░░░░","color":"dark_green"},{"text":"]","color":"gray"}]
execute if score @s cyp.stare_timer matches 49..54 run title @s actionbar [{"text":"[","color":"gray"},{"text":"██████████████████","color":"green"},{"text":"░░","color":"dark_green"},{"text":"]","color":"gray"}]
execute if score @s cyp.stare_timer matches 55.. run title @s actionbar [{"text":"[","color":"gray"},{"text":"████████████████████","color":"green"},{"text":"]","color":"gray"}]

execute if score @s cyp.stare_timer matches 60 run function call_your_pet:register_pet