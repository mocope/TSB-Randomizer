#> asset_manager:spawner/resister/resister_random.m
#
#
#
# @within function asset_manager:spawner/register/register.m
# @patch

# データを取得
    $function asset:spawner/$(ID)/register

# 座標を上書き
    data modify storage asset:spawner Pos set from storage randomizer: Pos
