#> randomizer:tick
#
#
#
# @within tag/function minecraft:tick

# バージョンが違えばエラーを出す
    execute unless data storage global {GameVersion: "v1.0.5"} run function randomizer:error_version
