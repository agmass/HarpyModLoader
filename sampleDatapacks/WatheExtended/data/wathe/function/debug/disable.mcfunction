# Disable debug
scoreboard players set debug wathe_debug 0

# Remove debug sidebar display
scoreboard objectives setdisplay sidebar

# Hide interaction safeguards bondaries
yawp hide all
kill @e[type=minecraft:block_display]

# Notify that debug has been disabled
title @a actionbar {"text":"Debug mode disabled","color":"red"}
