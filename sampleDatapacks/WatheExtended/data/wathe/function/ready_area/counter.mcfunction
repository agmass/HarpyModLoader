# This function is called every tick through wathe:tick 

# Resets player counter (so it doesn't accumulate over ticks)
scoreboard players set counter wathe_playercount 0

# Count players in the ready area
# : You might want to adjust the coordinates to match your ready area if you've changed it
# : Here's how distance coordinates works: https://i.imgur.com/Ee46y6d.png
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6] run scoreboard players add counter wathe_playercount 1

# Check how many players are in the ready area
# If 6 or more, set ready flag to 1, wich will start the timer
# If fewer than 6, set ready flag to 0, wich will stop the timer
# : 6 players is the minimum required for the Wathe mod to start a game, so avoid changing this number
execute if score counter wathe_playercount matches 6.. if score lock wathe_lock_timer matches 0 run scoreboard players set ready wathe_ready 1
execute if score counter wathe_playercount matches 6.. if score lock wathe_lock_timer matches 0 run execute unless score ready wathe_ready_cache matches 1 run scoreboard players set ready wathe_ready_cache 1

execute unless score counter wathe_playercount matches 6.. run scoreboard players set ready wathe_ready 0
execute unless score counter wathe_playercount matches 6.. run execute if score ready wathe_ready_cache matches 1 run scoreboard players set ready wathe_ready_cache 0
