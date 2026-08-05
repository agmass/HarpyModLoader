# This function is called every tick through wathe:tick 

# Train door teleportation handling
# If there are players near the train door (from outside), teleport them inside the train
execute if entity @p[gamemode=!spectator,x=-884.5,dx=0,y=0,dy=0,z=-356.5,dz=0] run tp @p[gamemode=!spectator,x=-884.5,dx=0,y=0,dy=0,z=-356.5,dz=0] -884.5 1 -358.5
execute if entity @p[gamemode=!spectator,x=-886.5,dx=0,y=0,dy=0,z=-356.5,dz=0] run tp @p[gamemode=!spectator,x=-886.5,dx=0,y=0,dy=0,z=-356.5,dz=0] -886.5 1 -358.5
execute if entity @p[gamemode=!spectator,x=-908.5,dx=0,y=0,dy=0,z=-356.5,dz=0] run tp @p[gamemode=!spectator,x=-908.5,dx=0,y=0,dy=0,z=-356.5,dz=0] -908.5 1 -358.5
execute if entity @p[gamemode=!spectator,x=-910.5,dx=0,y=0,dy=0,z=-356.5,dz=0] run tp @p[gamemode=!spectator,x=-910.5,dx=0,y=0,dy=0,z=-356.5,dz=0] -910.5 1 -358.5
execute if entity @p[gamemode=!spectator,x=-932.5,dx=0,y=0,dy=0,z=-356.5,dz=0] run tp @p[gamemode=!spectator,x=-932.5,dx=0,y=0,dy=0,z=-356.5,dz=0] -932.5 1 -358.5
execute if entity @p[gamemode=!spectator,x=-934.5,dx=0,y=0,dy=0,z=-356.5,dz=0] run tp @p[gamemode=!spectator,x=-934.5,dx=0,y=0,dy=0,z=-356.5,dz=0] -934.5 1 -358.5
execute if entity @p[gamemode=!spectator,x=-956.5,dx=0,y=0,dy=0,z=-356.5,dz=0] run tp @p[gamemode=!spectator,x=-956.5,dx=0,y=0,dy=0,z=-356.5,dz=0] -956.5 1 -358.5
execute if entity @p[gamemode=!spectator,x=-958.5,dx=0,y=0,dy=0,z=-356.5,dz=0] run tp @p[gamemode=!spectator,x=-958.5,dx=0,y=0,dy=0,z=-356.5,dz=0] -958.5 1 -358.5
execute if entity @p[gamemode=!spectator,x=-980.5,dx=0,y=0,dy=0,z=-356.5,dz=0] run tp @p[gamemode=!spectator,x=-980.5,dx=0,y=0,dy=0,z=-356.5,dz=0] -980.5 1 -358.5
# If there are players near the train door (from inside), teleport them outside the train
execute if entity @p[gamemode=!spectator,x=-884.5,dx=0,y=1,dy=0,z=-358,dz=0] run tp @p[gamemode=!spectator,x=-884.5,dx=0,y=1,dy=0,z=-358,dz=0] -884.5 0 -354.5
execute if entity @p[gamemode=!spectator,x=-886.5,dx=0,y=1,dy=0,z=-358,dz=0] run tp @p[gamemode=!spectator,x=-886.5,dx=0,y=1,dy=0,z=-358,dz=0] -886.5 0 -354.5
execute if entity @p[gamemode=!spectator,x=-908.5,dx=0,y=1,dy=0,z=-358,dz=0] run tp @p[gamemode=!spectator,x=-908.5,dx=0,y=1,dy=0,z=-358,dz=0] -908.5 0 -354.5
execute if entity @p[gamemode=!spectator,x=-910.5,dx=0,y=1,dy=0,z=-358,dz=0] run tp @p[gamemode=!spectator,x=-910.5,dx=0,y=1,dy=0,z=-358,dz=0] -910.5 0 -354.5
execute if entity @p[gamemode=!spectator,x=-932.5,dx=0,y=1,dy=0,z=-358,dz=0] run tp @p[gamemode=!spectator,x=-932.5,dx=0,y=1,dy=0,z=-358,dz=0] -932.5 0 -354.5
execute if entity @p[gamemode=!spectator,x=-934.5,dx=0,y=1,dy=0,z=-358,dz=0] run tp @p[gamemode=!spectator,x=-934.5,dx=0,y=1,dy=0,z=-358,dz=0] -934.5 0 -354.5
execute if entity @p[gamemode=!spectator,x=-956.5,dx=0,y=1,dy=0,z=-358,dz=0] run tp @p[gamemode=!spectator,x=-956.5,dx=0,y=1,dy=0,z=-358,dz=0] -956.5 0 -354.5
execute if entity @p[gamemode=!spectator,x=-958.5,dx=0,y=1,dy=0,z=-358,dz=0] run tp @p[gamemode=!spectator,x=-958.5,dx=0,y=1,dy=0,z=-358,dz=0] -958.5 0 -354.5
execute if entity @p[gamemode=!spectator,x=-980.5,dx=0,y=1,dy=0,z=-358,dz=0] run tp @p[gamemode=!spectator,x=-980.5,dx=0,y=1,dy=0,z=-358,dz=0] -980.5 0 -354.5
