# Yet Another World Protection interaction safeguards control
scoreboard players set yawp wathe_yawp 1

# Show/Hide interaction safeguards boundaries if debug mode is enabled/disabled
execute if score debug wathe_debug matches 1 run yawp show near 500 Frame
execute unless score debug wathe_debug matches 1 run yawp hide all

# Notify that safeguards have been enabled
tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"World Protection Enabled, run this command to disable it: ","color":"green","extra": [{"text":"/function wathe:debug/yawp/disable","color":"dark_green","clickEvent":{"action":"run_command","value":"/function wathe:debug/yawp/disable"},"underlined": true}]}]
title @a actionbar {"text":"World Protection enabled","color":"green"}

# Enable PARENT: Lobby
yawp local minecraft:overworld lobby state enable true
## Enable CHILD: Lobby Train Horn
yawp local minecraft:overworld lobbyTrainHorn state enable true
## Enable CHILD: Lobby Furnitures
yawp local minecraft:overworld lobbyFurniture1 state enable true
yawp local minecraft:overworld lobbyFurniture2 state enable true
yawp local minecraft:overworld lobbyFurniture3 state enable true
yawp local minecraft:overworld lobbyFurniture4 state enable true
yawp local minecraft:overworld lobbyFurniture5 state enable true
## Enable CHILD: Lobby Train Doors
yawp local minecraft:overworld lobbyTrainDoor1 state enable true
yawp local minecraft:overworld lobbyTrainDoor2 state enable true
yawp local minecraft:overworld lobbyTrainDoor3 state enable true
yawp local minecraft:overworld lobbyTrainDoor4 state enable true
yawp local minecraft:overworld lobbyTrainDoor5 state enable true
yawp local minecraft:overworld lobbyTrainDoor6 state enable true
yawp local minecraft:overworld lobbyTrainDoor7 state enable true
yawp local minecraft:overworld lobbyTrainDoor8 state enable true
yawp local minecraft:overworld lobbyTrainDoor9 state enable true
yawp local minecraft:overworld lobbyTrainDoor10 state enable true
yawp local minecraft:overworld lobbyTrainDoor11 state enable true
yawp local minecraft:overworld lobbyTrainDoor12 state enable true
yawp local minecraft:overworld lobbyTrainDoor13 state enable true
## Enable CHILD: Lobby Train Furnitures
yawp local minecraft:overworld lobbyTrainFurniture1 state enable true
yawp local minecraft:overworld lobbyTrainFurniture2 state enable true
yawp local minecraft:overworld lobbyTrainFurniture3-FIX state enable true
yawp local minecraft:overworld lobbyTrainFurniture4 state enable true
yawp local minecraft:overworld lobbyTrainFurniture5 state enable true
yawp local minecraft:overworld lobbyTrainFurniture6 state enable true
yawp local minecraft:overworld lobbyTrainFurniture7 state enable true
yawp local minecraft:overworld lobbyTrainFurniture8 state enable true
yawp local minecraft:overworld lobbyTrainFurniture9 state enable true
yawp local minecraft:overworld lobbyTrainFurniture10 state enable true
yawp local minecraft:overworld lobbyTrainFurniture11 state enable true
yawp local minecraft:overworld lobbyTrainFurniture12-FIX state enable true

# Enable PARENT: playTrain
yawp local minecraft:overworld playTrain state enable true
## Enable CHILD: playTrain Horn
yawp local minecraft:overworld playTrainHorn state enable true
## Enable CHILD: playTrain Restrictions
yawp local minecraft:overworld playTrainRestriction1 state enable true
yawp local minecraft:overworld playTrainRestriction2 state enable true
yawp local minecraft:overworld playTrainRestriction3 state enable true
yawp local minecraft:overworld playTrainRestriction4 state enable true
yawp local minecraft:overworld playTrainRestriction5-FIX state enable true
yawp local minecraft:overworld playTrainRestriction6 state enable true
yawp local minecraft:overworld playTrainRestriction7 state enable true
yawp local minecraft:overworld playTrainRestriction8 state enable true
yawp local minecraft:overworld playTrainRestriction9 state enable true
yawp local minecraft:overworld playTrainRestriction10 state enable true
yawp local minecraft:overworld playTrainRestriction11 state enable true
yawp local minecraft:overworld playTrainRestriction12 state enable true
yawp local minecraft:overworld playTrainRestriction13 state enable true
yawp local minecraft:overworld playTrainRestriction14 state enable true
yawp local minecraft:overworld playTrainRestriction15 state enable true
yawp local minecraft:overworld playTrainRestriction16-FIX state enable true
yawp local minecraft:overworld playTrainRestriction17-FIX state enable true