#> asset_manager:container/register/register.m
# @input args
#   ID: int
# @within function world_manager:nexus_loader/try_load_asset/m
# @patch

# PosとIdのみ別で取得
    $function asset:container/$(ID)/register
    # 読み込まれていなければキャンセル
        execute unless data storage asset:container ID run return fail
    data modify storage randomizer: Block set from storage asset:container Block
    data modify storage randomizer: Pos set from storage asset:container Pos

# もうデータがなければキャンセル
    execute unless data storage randomizer: Container[-1] run return fail

# pop
    data modify storage randomizer: Args.ID set from storage randomizer: Container[-1]
    data remove storage randomizer: Container[-1]

# ランダムなIDからデータを取得
    function asset_manager:container/register/register_random.m with storage randomizer: Args

# リセット
    data remove storage randomizer: Args
    data remove storage randomizer: Block
    data remove storage randomizer: Pos
