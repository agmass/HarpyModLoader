
package org.agmas.harpymodloader.client.mixin;

import com.llamalad7.mixinextras.injector.wrapoperation.Operation;
import com.llamalad7.mixinextras.injector.wrapoperation.WrapOperation;
import dev.doctor4t.wathe.api.GameMode;
import dev.doctor4t.wathe.api.Role;
import dev.doctor4t.wathe.api.WatheGameModes;
import dev.doctor4t.wathe.api.WatheRoles;
import dev.doctor4t.wathe.cca.GameWorldComponent;
import dev.doctor4t.wathe.client.WatheClient;
import dev.doctor4t.wathe.game.GameFunctions;
import net.minecraft.client.MinecraftClient;
import net.minecraft.client.option.KeyBinding;
import net.minecraft.entity.Entity;
import net.minecraft.entity.player.PlayerEntity;
import org.agmas.harpymodloader.Harpymodloader;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

@Mixin(WatheClient.class)
public abstract class InstinctMixin {


    @Shadow public static KeyBinding instinctKeybind;

    @WrapOperation(method = "lambda$onInitializeClient$17", at = @At(value = "INVOKE", target = "Ldev/doctor4t/wathe/cca/GameWorldComponent;getGameMode()Ldev/doctor4t/wathe/api/GameMode;"))
    private static GameMode d(GameWorldComponent instance, Operation<GameMode> original) {
        GameMode or = original.call(instance);
        if (or.equals(Harpymodloader.SECRET_MODDED_GAMEMODE)) return WatheGameModes.SECRET_MURDER;
        return or;
    }

    @Inject(method = "getInstinctHighlight", at = @At("HEAD"), cancellable = true)
    private static void b(Entity target, CallbackInfoReturnable<Integer> cir) {
        GameWorldComponent gameWorldComponent = (GameWorldComponent) GameWorldComponent.KEY.get(MinecraftClient.getInstance().player.getWorld());
        if (target instanceof PlayerEntity && WatheClient.isInstinctEnabled()) {
            if (!(target).isSpectator()) {
                if (GameFunctions.isPlayerSpectatingOrCreative(MinecraftClient.getInstance().player)) {
                    Role role = gameWorldComponent.getRole((PlayerEntity) target);
                    if (role == null) {
                        cir.setReturnValue(WatheRoles.CIVILIAN.color());
                        cir.cancel();
                    } else {
                        cir.setReturnValue(role.color());
                        cir.cancel();
                    }
                }
            }
            if (gameWorldComponent.getGameMode().equals(Harpymodloader.SECRET_MODDED_GAMEMODE)) {
                if (WatheClient.SECRET_MURDER_FAKE_COHORTS.contains(target.getUuid())) {
                    cir.setReturnValue(0xDD0000);
                    cir.cancel();
                } else {
                    cir.setReturnValue(0x4EDD35);
                    cir.cancel();
                }
            }
        }

    }
}
