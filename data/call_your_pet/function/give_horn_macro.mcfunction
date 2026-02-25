$give @s goat_horn[custom_name='$(pet_name)',custom_data={call_your_pet:{pet_id:$(pet_id),pet_uuid:$(pet_uuid)}},enchantment_glint_override=true,instrument="minecraft:ponder_goat_horn"] 1

data remove storage call_your_pet:root pet_uuid
data remove storage call_your_pet:root pet_name
data remove storage call_your_pet:root pet_id