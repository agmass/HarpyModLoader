package org.agmas.harpymodloader.commands;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.context.CommandContext;
import dev.doctor4t.wathe.api.WatheRoles;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.ClickEvent;
import net.minecraft.text.HoverEvent;
import net.minecraft.text.MutableText;
import net.minecraft.text.Text;
import net.minecraft.text.Texts;
import net.minecraft.util.Identifier;
import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.config.HarpyModLoaderConfig;
import org.agmas.harpymodloader.modifiers.HMLModifiers;

public class ListRolesCommand {
    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(CommandManager.literal("listRoles").executes((ListRolesCommand::execute)));
    }

    private static int execute(CommandContext<ServerCommandSource> context) {
        HarpyModLoaderConfig.HANDLER.save();
        final MutableText message = Text.empty();
        message.append(Text.translatable("commands.listroles.role.title")).append("\n");
        message.append(Texts.join(WatheRoles.ROLES, Text.literal("\n"), role -> {
            final boolean disabled = HarpyModLoaderConfig.HANDLER.instance().disabled.contains(role.identifier().toString());
            final MutableText status = createStatus(context.getSource(), disabled, "/setEnabledRole " + role.identifier() + " " + disabled);
            return buildElementText(Harpymodloader.getRoleName(role).withColor(role.color()), role.identifier(), status);
        }));
        message.append("\n\n");
        message.append(Text.translatable("commands.listroles.modifier.title")).append("\n");
        message.append(Texts.join(HMLModifiers.MODIFIERS, Text.literal("\n"), modifier -> {
            final boolean disabled = HarpyModLoaderConfig.HANDLER.instance().disabledModifiers.contains(modifier.identifier().toString());
            final MutableText status = createStatus(context.getSource(), disabled, "/setEnabledModifier " + modifier.identifier() + " " + disabled);
            return buildElementText(modifier.getName(true), modifier.identifier(), status);
        }));

        context.getSource().sendMessage(message);
        return 1;
    }

    private static MutableText buildElementText(Text name, Identifier identifier, Text status) {
        return Text.empty().append(name.copy()).append(" ").append(Text.literal("(" + identifier + ")")).append(" ").append(status);
    }

    private static MutableText createStatus(ServerCommandSource source, boolean disabled, String cmd) {
        String key = disabled ? "disabled" : "enabled";
        return Text.translatable("commands.listroles.status." + key + ".text").styled(style -> {
            if (source.hasPermissionLevel(2)) {
                return style.withHoverEvent(new HoverEvent(HoverEvent.Action.SHOW_TEXT, Text.translatable("commands.listroles.status." + key + ".hover", cmd))).withClickEvent(new ClickEvent(ClickEvent.Action.RUN_COMMAND, cmd));
            } else {
                return style;
            }
        });
    }
}
