# If wathe_ready==1 -> start timer
execute if score ready wathe_ready matches 1 run scoreboard players add timer wathe_timer 1

# If wathe_ready==0 -> stop and reset timer
execute if score ready wathe_ready matches 0 run scoreboard players set timer wathe_timer 0

# When timer reaches 200 ticks -> start position assignment randomization and teleport players to stored train positions
# : You can adjust this value to adjust it to the waiting time before the game starts (default is 10s)
# : Make sure to keep it in ticks (1 second = 20 ticks)
execute if score timer wathe_timer matches 200 run function wathe:ready_area/timer/end

# When non-zero, decrement each tick, when it reaches 0 clear the ready lock
execute if score timer_lock_timer wathe_lock_timer_timer matches 1.. run scoreboard players remove timer_lock_timer wathe_lock_timer_timer 1
execute if score timer_lock_timer wathe_lock_timer_timer matches 0 run execute if score lock wathe_lock_timer matches 1 run scoreboard players set lock wathe_lock_timer 0

# Starts the loop for assigning unique random positions to players in the ready area
# Get called when the Lock Timer hits 7 seconds (140 ticks) to teleport players while their screen fades out to black
execute if score timer_lock_timer wathe_lock_timer_timer matches 140 run function wathe:rtp/loop
execute if score timer_lock_timer wathe_lock_timer_timer matches 140 run function viridis:start_distribution