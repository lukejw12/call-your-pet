tellraw @a ["",{"text":"Call Your Pet","color":"gold"},{"text":" loaded - "},{"text":"[1.21.11]","color":"green"},{"text":" v1.0.0","color":"dark_green"}]

scoreboard objectives add cyp.help trigger
scoreboard objectives add cyp.pet_id dummy
scoreboard objectives add cyp.next_id dummy
scoreboard objectives add cyp.use_horn minecraft.used:minecraft.goat_horn
scoreboard objectives add cyp.horn_timer dummy
scoreboard objectives add cyp.temp dummy
scoreboard objectives add cyp.pos_x dummy
scoreboard objectives add cyp.pos_z dummy
scoreboard objectives add cyp.ray_steps dummy
scoreboard objectives add cyp.stare_timer dummy
scoreboard objectives add cyp.msg_shown dummy

scoreboard players add #next cyp.next_id 0