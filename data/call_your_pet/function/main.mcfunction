scoreboard players enable @a cyp.help

execute as @a[scores={cyp.help=1..}] run function call_your_pet:trigger_help

execute as @a[predicate=call_your_pet:sneaking_with_horn] at @s run function call_your_pet:stare_check
execute as @a[predicate=!call_your_pet:sneaking_with_horn] run scoreboard players set @s cyp.stare_timer 0
execute as @a[predicate=!call_your_pet:sneaking_with_horn] run scoreboard players set @s cyp.msg_shown 0

execute as @a[scores={cyp.use_horn=1..}] at @s run function call_your_pet:horn_tick

execute as @e[tag=cyp.registered] at @s run function call_your_pet:save_position