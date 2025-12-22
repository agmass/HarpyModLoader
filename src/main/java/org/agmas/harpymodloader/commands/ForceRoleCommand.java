package org.agmas.harpymodloader.commands;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import dev.doctor4t.wathe.api.Role;
import net.minecraft.command.argument.EntityArgumentType;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.server.network.ServerPlayerEntity;
import net.minecraft.text.Text;
import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.commands.argument.RoleArgumentType;

public class ForceRoleCommand {
    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(CommandManager.literal("forceRole")
                .requires(serverCommandSource -> serverCommandSource.hasPermissionLevel(2))
                .then(CommandManager.argument("player", EntityArgumentType.player())
                        .executes(ForceRoleCommand::query)
                        .then(CommandManager.argument("role", RoleArgumentType.skipVanilla())
                                .executes(ForceRoleCommand::execute))));
    }

    private static int query(CommandContext<ServerCommandSource> context) throws CommandSyntaxException {
        ServerPlayerEntity targetPlayer = EntityArgumentType.getPlayer(context, "player");
        if (!Harpymodloader.FORCED_MODDED_ROLE_FLIP.containsKey(targetPlayer.getUuid())) {
            context.getSource().sendFeedback(() -> Text.translatable("commands.forcerole.query.none", targetPlayer.getDisplayName()), false);
            return 0;
        }
        Role role = Harpymodloader.FORCED_MODDED_ROLE_FLIP.get(targetPlayer.getUuid());
        Text roleText = Harpymodloader.getRoleName(role).withColor(role.color());
        context.getSource().sendFeedback(() -> Text.translatable("commands.forcerole.query", targetPlayer.getDisplayName(), roleText), false);
        return 1;
    }

    private static int execute(CommandContext<ServerCommandSource> context) throws CommandSyntaxException {
        ServerPlayerEntity targetPlayer = EntityArgumentType.getPlayer(context, "player");
        Role role = RoleArgumentType.getRole(context, "role");
        Harpymodloader.addToForcedRoles(role, targetPlayer);
        context.getSource().sendFeedback(() -> Text.translatable("commands.forcerole.success", Harpymodloader.getRoleName(role).withColor(role.color()), targetPlayer.getDisplayName()), true);
        return 1;
    }
}