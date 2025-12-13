package org.agmas.harpymodloader.commands;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.arguments.StringArgumentType;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import com.mojang.brigadier.exceptions.SimpleCommandExceptionType;
import dev.doctor4t.trainmurdermystery.api.Role;
import dev.doctor4t.trainmurdermystery.api.TMMRoles;
import net.minecraft.command.argument.EntityArgumentType;
import net.minecraft.command.argument.IdentifierArgumentType;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.server.network.ServerPlayerEntity;
import net.minecraft.text.Text;
import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.commands.suggestions.RoleSuggestionProvider;

public class ForceRoleCommand {
    public static final SimpleCommandExceptionType INVALID_ROLE_EXCEPTION = new SimpleCommandExceptionType(Text.translatable("commands.forcerole.invalid"));

    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(CommandManager.literal("forceRole")
                .requires(serverCommandSource -> serverCommandSource.hasPermissionLevel(2))
                .then(CommandManager.argument("player", EntityArgumentType.player())
                        .executes(context -> query(context.getSource(), EntityArgumentType.getPlayer(context, "player")))
                .then(CommandManager.argument("role", IdentifierArgumentType.identifier())
                        .suggests(new RoleSuggestionProvider())
                        .executes(context -> execute(context.getSource(), EntityArgumentType.getPlayer(context,"player"), IdentifierArgumentType.getIdentifier(context,"role").toString())))));
    }
    private static int query(ServerCommandSource source, ServerPlayerEntity targetPlayer) {
        if (!Harpymodloader.FORCED_MODDED_ROLE_FLIP.containsKey(targetPlayer.getUuid())) {
            source.sendFeedback(() -> Text.translatable("commands.forcerole.query.none", targetPlayer.getDisplayName()), false);
            return 1;
        }
        Role role = Harpymodloader.FORCED_MODDED_ROLE_FLIP.get(targetPlayer.getUuid());
        Text roleText = Text.literal(role.identifier().getPath()).withColor(role.color());
        source.sendFeedback(() -> Text.translatable("commands.forcerole.query", targetPlayer.getDisplayName(), roleText), false);
        return 1;
    }
    private static int execute(ServerCommandSource source, ServerPlayerEntity targetPlayer, String roleName) throws CommandSyntaxException {
        for (Role role : TMMRoles.ROLES) {
            if (role.identifier().toString().equals(roleName)) {
                Harpymodloader.addToForcedRoles(role,targetPlayer);
                source.sendFeedback(() -> Text.translatable("commands.forcerole.success", Text.literal(roleName).withColor(role.color()), targetPlayer.getDisplayName()), true);
                return 1;
            }
        }

        throw INVALID_ROLE_EXCEPTION.create();
    }
}