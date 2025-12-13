package org.agmas.harpymodloader.commands;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.arguments.BoolArgumentType;
import com.mojang.brigadier.arguments.StringArgumentType;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import com.mojang.brigadier.exceptions.SimpleCommandExceptionType;
import dev.doctor4t.trainmurdermystery.api.Role;
import dev.doctor4t.trainmurdermystery.api.TMMRoles;
import net.fabricmc.loader.impl.util.log.Log;
import net.fabricmc.loader.impl.util.log.LogCategory;
import net.minecraft.command.argument.IdentifierArgumentType;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.Text;
import org.agmas.harpymodloader.commands.suggestions.RoleSuggestionProvider;
import org.agmas.harpymodloader.config.HarpyModLoaderConfig;

public class SetEnabledRoleCommand {
    public static final SimpleCommandExceptionType INVALID_ROLE_EXCEPTION = new SimpleCommandExceptionType(Text.translatable("commands.setenabledrole.invalid"));
    public static final SimpleCommandExceptionType ROLE_UNCHANGED_EXCEPTION = new SimpleCommandExceptionType(Text.translatable("commands.setenabledrole.unchanged"));


    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(CommandManager.literal("setEnabledRole")
                .requires(serverCommandSource -> serverCommandSource.hasPermissionLevel(2))
                .then(CommandManager.argument("role", IdentifierArgumentType.identifier()).suggests(new RoleSuggestionProvider())
                .then(CommandManager.argument("enabled", BoolArgumentType.bool())
                .executes(context -> execute(context.getSource(), IdentifierArgumentType.getIdentifier(context, "role").toString(), BoolArgumentType.getBool(context, "enabled"))))));
    }
    private static int execute(ServerCommandSource source, String roleName, boolean enabled) throws CommandSyntaxException {
        HarpyModLoaderConfig.HANDLER.save();
        for (Role role : TMMRoles.ROLES) {
            if (role.identifier().toString().equals(roleName)) {
                boolean disabled = HarpyModLoaderConfig.HANDLER.instance().disabled.contains(roleName);
                Text roleText = Text.literal(roleName).withColor(role.color());

                if (disabled && enabled) {
                    HarpyModLoaderConfig.HANDLER.instance().disabled.remove(roleName);
                    source.sendFeedback(() -> Text.translatable("commands.setenabledrole.enable.success", roleText), true);
                } else if (!disabled && !enabled) {
                    HarpyModLoaderConfig.HANDLER.instance().disabled.add(roleName);
                    source.sendFeedback(() -> Text.translatable("commands.setenabledrole.disable.success", roleText), true);
                } else throw ROLE_UNCHANGED_EXCEPTION.create();

                HarpyModLoaderConfig.HANDLER.save();
                return 1;
            }
        }
        throw INVALID_ROLE_EXCEPTION.create();
    }
}
