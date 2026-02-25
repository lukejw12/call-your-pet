$data modify storage call_your_pet:positions "$(save_id).x" set from storage call_your_pet:root save_x
$data modify storage call_your_pet:positions "$(save_id).z" set from storage call_your_pet:root save_z
$data modify storage call_your_pet:positions "$(save_id).dim" set from storage call_your_pet:root save_dim
data remove storage call_your_pet:root save_x
data remove storage call_your_pet:root save_z
data remove storage call_your_pet:root save_id
data remove storage call_your_pet:root save_dim