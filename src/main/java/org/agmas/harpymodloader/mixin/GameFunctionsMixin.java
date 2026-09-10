package org.agmas.harpymodloader.mixin;

import com.llamalad7.mixinextras.injector.wrapmethod.WrapMethod;
import com.llamalad7.mixinextras.injector.wrapoperation.Operation;
import dev.doctor4t.wathe.api.GameMode;
import dev.doctor4t.wathe.api.MapEffect;
import dev.doctor4t.wathe.api.WatheGameModes;
import dev.doctor4t.wathe.cca.GameWorldComponent;
import dev.doctor4t.wathe.game.GameFunctions;
import net.minecraft.server.world.ServerWorld;
import org.agmas.harpymodloader.Harpymodloader;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@Mixin(GameFunctions.class)
public class GameFunctionsMixin {
    @WrapMethod(method = "startGame")
    private static void secretModdedMurder(ServerWorld world, GameMode gameMode, MapEffect mapEffect, int time, Operation<Void> original) {
        GameWorldComponent game = GameWorldComponent.KEY.get(world);

        if (gameMode == Harpymodloader.MODDED_GAMEMODE && world.random.nextFloat() <= game.getSecretMurderRoundChance()) {
            original.call(world,Harpymodloader.SECRET_MODDED_GAMEMODE,mapEffect,time);
        } else {
            original.call(world,gameMode,mapEffect,time);
        }
    }
    @Inject(method = "initializeGame", at = @At("HEAD"))
    private static void a(ServerWorld serverWorld, CallbackInfo ci) {
        GameWorldComponent gameComponent = (GameWorldComponent)GameWorldComponent.KEY.get(serverWorld);
        if (gameComponent.getGameMode().equals(WatheGameModes.MURDER) && !Harpymodloader.wantsToStartVannila) {
            gameComponent.setGameMode(Harpymodloader.MODDED_GAMEMODE);
        }
        Harpymodloader.wantsToStartVannila = false;
    }
}
