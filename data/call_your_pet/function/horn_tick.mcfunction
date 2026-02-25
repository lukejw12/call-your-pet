scoreboard players add @s cyp.horn_timer 1

execute if score @s cyp.horn_timer matches 1 if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{call_your_pet:{}}}}}] run function call_your_pet:begin_call

execute if score @s cyp.horn_timer matches 6 if entity @s[tag=cyp.calling] run function call_your_pet:do_teleport_tick

execute if score @s cyp.horn_timer matches 9 if entity @s[tag=cyp.calling] run function call_your_pet:end_call

execute if score @s cyp.horn_timer matches 10.. run scoreboard players set @s cyp.use_horn 0
execute if score @s cyp.horn_timer matches 10.. run scoreboard players set @s cyp.horn_timer 0
execute if score @s cyp.horn_timer matches 10.. run tag @s remove cyp.calling