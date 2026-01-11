#> asset_manager:spawner/register/register.m
# @input args
#   ID: int
# @within function world_manager:nexus_loader/try_load_asset/m
# @patch

# PosとIdのみ別で取得
    $function asset:spawner/$(ID)/register
    # 読み込まれていなければキャンセル
        execute unless data storage asset:spawner ID run return fail
    # 座標のデータだけ残しデータを削除
        data modify storage randomizer: Pos set from storage asset:spawner Pos
        function asset_manager:spawner/register/reset

# もうデータがなければキャンセル
    execute unless data storage randomizer: Spawner[-1] run return fail

# pop
    data modify storage randomizer: Args.ID set from storage randomizer: Spawner[-1]
    data remove storage randomizer: Spawner[-1]

# ランダムなIDからデータを取得
    function asset_manager:spawner/register/register_random.m with storage randomizer: Args

# リセット
    data remove storage randomizer: Args
    data remove storage randomizer: Block
    data remove storage randomizer: Pos
