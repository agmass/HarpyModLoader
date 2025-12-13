package org.agmas.harpymodloader.commands.suggestions;

import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import com.mojang.brigadier.suggestion.SuggestionProvider;
import com.mojang.brigadier.suggestion.Suggestions;
import com.mojang.brigadier.suggestion.SuggestionsBuilder;
import dev.doctor4t.trainmurdermystery.api.Role;
import dev.doctor4t.trainmurdermystery.api.TMMRoles;
import net.minecraft.command.CommandSource;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.util.Identifier;
import org.agmas.harpymodloader.Harpymodloader;

import java.util.concurrent.CompletableFuture;

public class RoleSuggestionProvider implements SuggestionProvider<ServerCommandSource> {
    @Override
    public CompletableFuture<Suggestions> getSuggestions(CommandContext<ServerCommandSource> context, SuggestionsBuilder builder) throws CommandSyntaxException {
        // suggest all roles
        if (TMMRoles.ROLES.isEmpty()) return Suggestions.empty();

        for (Role role : TMMRoles.ROLES) {
            if (Harpymodloader.VANNILA_ROLES.contains(role)) continue;
            if (role != null && CommandSource.shouldSuggest(builder.getRemaining(), role.identifier().toString())) {
                builder.suggest(role.identifier().toString());
            }
        }
        return builder.buildFuture();
    }
}
