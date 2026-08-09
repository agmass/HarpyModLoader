package org.agmas.harpymodloader.commands;

import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.commands.argument.RoleArgumentType;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.arguments.IntegerArgumentType;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;

import dev.doctor4t.wathe.api.Role;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.Text;

public class GuaranteeRoleCommand {
    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(CommandManager.literal("guaranteeRole")
                .requires(serverCommandSource -> serverCommandSource.hasPermissionLevel(2))
                        .then(CommandManager.argument("role", RoleArgumentType.create())
                            .then(CommandManager.argument("count", IntegerArgumentType.integer())
                                .executes(GuaranteeRoleCommand::execute))));
    }

    private static int execute(CommandContext<ServerCommandSource> context) throws CommandSyntaxException {
        Role role = RoleArgumentType.getRole(context, "role");
        int count = IntegerArgumentType.getInteger(context, "count");
        Harpymodloader.addToGuaranteedRoles(role, count);
        Text roleName = Harpymodloader.getRoleName(role);
        context.getSource().sendFeedback(() -> Text.translatable("commands.guaranteeRole.success", roleName), true);
        return 1;
    }
}
