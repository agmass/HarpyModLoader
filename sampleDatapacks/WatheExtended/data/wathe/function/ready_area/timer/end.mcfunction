# Stop/reset timer and temporaly lock ready state so the timer doesn't restart immediately
scoreboard players set timer wathe_timer 0
scoreboard players set lock wathe_lock_timer 1

# Start a 10 seconds (200 ticks) countdown until the timer can be re-activated
# This is to prevent immediate re-activation of the timer while the game is starting
scoreboard players set timer_lock_timer wathe_lock_timer_timer 200

# Ensure ready flag is off and that assignment flag and assigned slots are reset
scoreboard players set ready wathe_ready 0

scoreboard players set @a wathe_assigned 0
scoreboard players set @a wathe_assigned_slot 0
scoreboard players set @a wathe_rand 0
