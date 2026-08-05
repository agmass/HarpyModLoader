# Clears every stored data and scoreboard objectives created by the Wathe Extended datapack
# Useful when testing and making modifications to the datapack
# Instead of using /datapack disable, just run this function using /function wathe:unload

# Remove all scoreboard objectives
scoreboard objectives remove wathe_playercount
scoreboard objectives remove wathe_playercount_cache

scoreboard objectives remove wathe_ready
scoreboard objectives remove wathe_ready_cache
scoreboard objectives remove wathe_timer
scoreboard objectives remove wathe_timer_cache

scoreboard objectives remove wathe_lock_timer
scoreboard objectives remove wathe_lock_timer_timer
scoreboard objectives remove wathe_lock_timer_cache

scoreboard objectives remove wathe_debug
scoreboard objectives remove wathe_debug_ui

scoreboard objectives remove wathe_handler
scoreboard objectives remove wathe_handler_cache

scoreboard objectives remove wathe_assigned
scoreboard objectives remove wathe_assigned_slot
scoreboard objectives remove wathe_rand
scoreboard objectives remove wathe_attempts

scoreboard objectives remove wathe_yawp

# Remove all scoreboard scores
scoreboard players reset *

# Unload complete message
tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"Datapack disabled!","color":"red"}]

# Actually disable the datapack
datapack disable "file/WatheExtended"
