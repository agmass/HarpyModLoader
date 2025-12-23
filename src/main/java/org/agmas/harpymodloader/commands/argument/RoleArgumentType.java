package org.agmas.harpymodloader.commands.argument;

import com.google.gson.JsonObject;
import com.mojang.brigadier.StringReader;
import com.mojang.brigadier.arguments.ArgumentType;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import com.mojang.brigadier.exceptions.DynamicCommandExceptionType;
import com.mojang.brigadier.suggestion.Suggestions;
import com.mojang.brigadier.suggestion.SuggestionsBuilder;
import dev.doctor4t.wathe.api.Role;
import dev.doctor4t.wathe.api.WatheRoles;
import net.minecraft.command.CommandRegistryAccess;
import net.minecraft.command.CommandSource;
import net.minecraft.command.argument.serialize.ArgumentSerializer;
import net.minecraft.network.PacketByteBuf;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.Text;
import net.minecraft.util.Identifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import org.agmas.harpymodloader.Harpymodloader;

public class RoleArgumentType implements ArgumentType<Role> {
    public static final DynamicCommandExceptionType ROLE_EMPTY = new DynamicCommandExceptionType(input -> Text.translatable("argument.harpymodloader.role.notfound", input));
    public static final DynamicCommandExceptionType ROLE_MULTIPLE = new DynamicCommandExceptionType(input -> Text.translatable("argument.harpymodloader.role.found-multiple", input));
    private static final Collection<String> EXAMPLES = Arrays.asList("foo", "foo:bar", "012");

    private final boolean skipVanilla;

    public RoleArgumentType(final boolean skipVanilla) {
        this.skipVanilla = skipVanilla;
    }

    public static RoleArgumentType skipVanilla() {
        return new RoleArgumentType(true);
    }

    public static RoleArgumentType create() {
        return new RoleArgumentType(false);
    }

    public static RoleArgumentType create(boolean skipVanilla) {
        return new RoleArgumentType(skipVanilla);
    }

    public static Role getRole(CommandContext<ServerCommandSource> context, String name) {
        return context.getArgument(name, Role.class);
    }

    @Override
    public Role parse(final StringReader reader) throws CommandSyntaxException {
        Identifier roleId = null;
        String input = new StringReader(reader).readString();
        try {
            roleId = Identifier.fromCommandInput(reader);
        } catch (CommandSyntaxException ignored) {
        }
        List<Role> matchRoles = new ArrayList<>();
        for (final Role role : WatheRoles.ROLES) {
            if (skipVanilla && Harpymodloader.VANNILA_ROLES.contains(role)) {
                continue;
            }
            if (role.identifier().equals(roleId) || role.identifier().getPath().startsWith(input)) {
                matchRoles.add(role);
            }
        }
        if (matchRoles.isEmpty()) {
            throw ROLE_EMPTY.create(input);
        }
        if (matchRoles.size() > 1) {
            throw ROLE_MULTIPLE.create(input);
        }
        return matchRoles.getFirst();
    }

    @Override
    public <S> CompletableFuture<Suggestions> listSuggestions(final CommandContext<S> context, final SuggestionsBuilder builder) {
        return CommandSource.suggestFromIdentifier(
                WatheRoles.ROLES.stream().filter(role -> !skipVanilla || !Harpymodloader.VANNILA_ROLES.contains(role)),
                builder,
                Role::identifier,
                Harpymodloader::getRoleName
        );
    }

    @Override
    public Collection<String> getExamples() {
        return EXAMPLES;
    }

    public static class Serializer implements ArgumentSerializer<RoleArgumentType, Serializer.Properties> {

        @Override
        public void writePacket(final Properties properties, final PacketByteBuf buf) {
            buf.writeBoolean(properties.skipVanilla);
        }

        @Override
        public Properties fromPacket(final PacketByteBuf buf) {
            return new Properties(buf.readBoolean());
        }

        @Override
        public void writeJson(final Properties properties, final JsonObject json) {
            json.addProperty("skipVanilla", properties.skipVanilla);
        }

        @Override
        public Properties getArgumentTypeProperties(final RoleArgumentType argumentType) {
            return new Properties(argumentType.skipVanilla);
        }

        public class Properties implements ArgumentSerializer.ArgumentTypeProperties<RoleArgumentType> {
            private final boolean skipVanilla;

            public Properties(final boolean skipVanilla) {
                this.skipVanilla = skipVanilla;
            }

            @Override
            public RoleArgumentType createType(final CommandRegistryAccess commandRegistryAccess) {
                return new RoleArgumentType(skipVanilla);
            }

            @Override
            public ArgumentSerializer<RoleArgumentType, ?> getSerializer() {
                return Serializer.this;
            }
        }
    }
}
