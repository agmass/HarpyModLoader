# Wathe Extended Datapack
# Author: @rezeral
# License: GPL-3.0 License
# Version: beta-2.3.130

# Remove all scoreboard objectives
# : Even though the unload function does the same, it's needed to ensure a clean state of the objectives before re-adding them
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

# Remove all scoreboard scores
# : Just in case any score remained after objective removal
scoreboard players reset *

# Objectives variables initialization
# : Do not edit or delete these lines unless you know what you are doing
scoreboard objectives add wathe_playercount dummy {"text":"Players Counter","color":"yellow"}
scoreboard objectives add wathe_playercount_cache dummy {"text":"(Cache) Players Counter","color":"yellow"}

scoreboard objectives add wathe_ready dummy {"text":"Ready State","color":"dark_green"}
scoreboard objectives add wathe_ready_cache dummy {"text":"(Cache) Ready State","color":"dark_green"}

scoreboard objectives add wathe_timer dummy {"text":"Timer","color":"aqua"}
scoreboard objectives add wathe_timer_cache dummy {"text":"(Cache) Timer","color":"aqua"}

scoreboard objectives add wathe_lock_timer dummy {"text":"Timer Lock","color":"dark_purple"}
scoreboard objectives add wathe_lock_timer_cache dummy {"text":"(Cache) Timer Lock","color":"dark_purple"}
scoreboard objectives add wathe_lock_timer_timer dummy {"text":"Timer Lock Cooldown","color":"dark_purple"}

scoreboard objectives add wathe_debug dummy {"text":"Debug","color":"red"}
scoreboard objectives add wathe_debug_ui dummy {"text":"WatheExt Debug","color":"white"}

scoreboard objectives add wathe_handler minecraft.used:minecraft.carrot_on_a_stick {"text":"Interaction Handler","color":"dark_red"}
scoreboard objectives add wathe_handler_cache dummy {"text":"(Cache) Interaction Handler","color":"dark_red"}

scoreboard objectives add wathe_assigned dummy {"text":"Assigned Flag","color":"gold"}
scoreboard objectives add wathe_assigned_slot dummy {"text":"Assigned Slot","color":"gold"}
scoreboard objectives add wathe_rand dummy {"text":"Randomizer","color":"aqua"}
scoreboard objectives add wathe_attempts dummy {"text":"Assignment Attempts","color":"red"}

scoreboard objectives add wathe_yawp dummy {"text":"YAWP State","color":"light_purple"}

# Load complete message
tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"Datapack enabled!","color":"green"}]

# Enable world protection by default on load
# : This is to ensure that world protection is always enabled when the datapack is loaded or reloaded
# : Can be disabled again by calling the wathe:debug/yawp/disable function
function wathe:debug/yawp/enable
