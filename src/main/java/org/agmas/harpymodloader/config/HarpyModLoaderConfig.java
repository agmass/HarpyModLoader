package org.agmas.harpymodloader.config;

import dev.isxander.yacl3.config.v2.api.ConfigClassHandler;
import dev.isxander.yacl3.config.v2.api.SerialEntry;
import dev.isxander.yacl3.config.v2.api.serializer.GsonConfigSerializerBuilder;
import net.fabricmc.loader.api.FabricLoader;
import net.minecraft.util.Identifier;
import org.agmas.harpymodloader.Harpymodloader;

import java.util.List;

public class HarpyModLoaderConfig {
    public static ConfigClassHandler<HarpyModLoaderConfig> HANDLER = ConfigClassHandler.createBuilder(HarpyModLoaderConfig.class)
            .id(Identifier.of(Harpymodloader.MOD_ID, "config"))
            .serializer(config -> GsonConfigSerializerBuilder.create(config)
                    .setPath(FabricLoader.getInstance().getConfigDir().resolve( Harpymodloader.MOD_ID + ".json5"))
                    .setJson5(true)
                    .build())
            .build();

    @SerialEntry(comment = "Disables roles from being in the role pool. use /listRoles to get role names, use /enableRoles to ban/unban them in-game (saves here).")
    public List<String> disabled = List.of();

}