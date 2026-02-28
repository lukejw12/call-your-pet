scoreboard players set #cyp.owner_fail cyp.temp 0

execute unless data entity @e[tag=cyp.target,limit=1] Owner run return 0

data modify storage call_your_pet:root owner_check set from entity @s UUID
execute store success score #cyp.owner_check cyp.temp run data modify storage call_your_pet:root owner_check set from entity @e[tag=cyp.target,limit=1] Owner

execute if score #cyp.owner_check cyp.temp matches 1 run scoreboard players set #cyp.owner_fail cyp.temp 1

data remove storage call_your_pet:root owner_check