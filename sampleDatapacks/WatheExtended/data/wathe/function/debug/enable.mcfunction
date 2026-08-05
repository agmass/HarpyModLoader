# Enable debug
scoreboard players set debug wathe_debug 1

# Set debug sidebar display
scoreboard objectives setdisplay sidebar wathe_debug_ui

# Tellraw about world protection toggle command
tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"If you wish to disable World Protection, run this command: ","color":"yellow","extra": [{"text":"/function wathe:debug/yawp/disable","color":"gold","clickEvent":{"action":"run_command","value":"/function wathe:debug/yawp/disable"},"underlined": true}]}]

# Show/hide interaction safeguards boundaries
execute if score yawp wathe_yawp matches 1 run yawp show near 500 Frame
execute unless score yawp wathe_yawp matches 1 run yawp hide all

# Notify that debug has been enabled
title @a actionbar {"text":"Debug mode enabled","color":"green"}
