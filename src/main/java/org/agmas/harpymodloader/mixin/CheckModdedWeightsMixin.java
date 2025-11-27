package org.agmas.harpymodloader.mixin;

import dev.doctor4t.trainmurdermystery.api.Role;
import dev.doctor4t.trainmurdermystery.api.TMMRoles;
import dev.doctor4t.trainmurdermystery.cca.ScoreboardRoleSelectorComponent;
import dev.doctor4t.trainmurdermystery.client.gui.RoleAnnouncementTexts;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.server.network.ServerPlayerEntity;
import net.minecraft.text.MutableText;
import net.minecraft.text.Text;
import net.minecraft.util.Formatting;
import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.modded_murder.ModdedWeights;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

import java.util.HashMap;
import java.util.UUID;

@Mixin(ScoreboardRoleSelectorComponent.class)
public class CheckModdedWeightsMixin {
    @Inject(method = "checkWeights", at = @At("HEAD"), cancellable = true)
    public void a(ServerCommandSource source, CallbackInfo ci) {

        Harpymodloader.refreshRoles();

        HashMap<Role, Double> roleTotals = new HashMap<>();

        for (Role role : TMMRoles.ROLES) {
            if (Harpymodloader.SPECIAL_ROLES.contains(role)) continue;
            for (ServerPlayerEntity player : source.getWorld().getPlayers()) {
                if (!roleTotals.containsKey(role)) roleTotals.put(role, 0.0);
                double playerTotal = Math.exp((double) (-ModdedWeights.roleRounds.get(role).getOrDefault(player.getUuid(), 0) * 4));
                roleTotals.put(role, roleTotals.get(role) + playerTotal);
            }
        }

        MutableText text = Text.literal("Role Weights:").formatted(Formatting.GRAY);

        for(ServerPlayerEntity player : source.getWorld().getPlayers()) {
            text = text.append("\n").append(player.getDisplayName());
            for (Role role : TMMRoles.ROLES) {
                if (Harpymodloader.SPECIAL_ROLES.contains(role)) continue;
                Integer roleRounds = ModdedWeights.roleRounds.get(role).getOrDefault(player.getUuid(), 0);
                double roleWeight = Math.exp((-roleRounds * 4));
                double rolePercentage = roleWeight / roleTotals.getOrDefault(role,1.0) * (double) 100.0F;
                text.append(Text.literal("\n  ").append(role.identifier()+"").append(Text.literal(" (")).withColor(role.color()).append(Text.literal("%d".formatted(roleRounds)).withColor(8421504)).append(Text.literal("): ").withColor(role.color())).append(Text.literal("%.2f%%".formatted(rolePercentage)).withColor(8421504)));
            }
        }

        source.sendMessage(text);
        ci.cancel();
    }
}
