# TODO: Redo or delete - Not very efficient/working very well but keeping it as reference

# Protect player from being selected twice while assigning slots
# 1) Set player in "processing" state (2)
# 2) Run the random assignment
# 3) If still unassigned after random function, clears the processing state so they can be retried later
scoreboard players set @s wathe_assigned 2
function wathe:rtp/random

# If random function (or force_assign) succeeded it sets wathe_assigned to 1; only clear processing if still in processing state
execute if score @s wathe_assigned matches 2 run scoreboard players set @s wathe_assigned 0
