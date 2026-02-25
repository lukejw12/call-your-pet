scoreboard players set #cyp.claim_fail cyp.temp 0

execute store result storage call_your_pet:root check_pet_id int 1 run scoreboard players get @e[tag=cyp.target,limit=1] cyp.pet_id

execute unless entity @e[tag=cyp.target,tag=cyp.registered] run return 0

function call_your_pet:load_owner with storage call_your_pet:root

data modify storage call_your_pet:root claim_check set from entity @s UUID
execute store success score #cyp.claim_check cyp.temp run data modify storage call_your_pet:root claim_check set from storage call_your_pet:root loaded_owner

execute if score #cyp.claim_check cyp.temp matches 1 run scoreboard players set #cyp.claim_fail cyp.temp 1

data remove storage call_your_pet:root claim_check
data remove storage call_your_pet:root loaded_owner
data remove storage call_your_pet:root check_pet_id