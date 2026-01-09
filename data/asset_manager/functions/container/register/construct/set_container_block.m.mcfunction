#> asset_manager:container/register/construct/set_container_block.m
#
#
#
# @input args
#   Block
# @within function asset_manager:container/register/construct/
# @patch

# loot_tableが設定されたブロックに違う種類のブロックを設置しようとすると中身が弾け跳ぶので対策
    function asset_manager:container/register/construct/force_remove_loot_table/

# ブロックを設置
    $setblock ~ ~ ~ $(Block)
