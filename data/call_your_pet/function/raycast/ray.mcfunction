execute as @e[type=#call_your_pet:pets,distance=..1,limit=1,tag=!cyp.raycaster] run return run function call_your_pet:raycast/hit
scoreboard players remove @s cyp.ray_steps 1
execute if score @s cyp.ray_steps matches 1.. positioned ^ ^ ^0.1 run function call_your_pet:raycast/ray