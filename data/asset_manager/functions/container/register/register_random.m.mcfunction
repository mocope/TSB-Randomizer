#> asset_manager:container/resister/resister_random.m
#
#
#
# @within function asset_manager:container/register/register.m
# @patch

# データを取得
    $function asset:container/$(ID)/register

# 座標を上書き
    data modify storage asset:container Pos set from storage randomizer: Pos

# 両方chestかbarrelならブロック状態を維持する
    # 元のcontainerを取得(barrel→chest)
        data modify storage randomizer: BlockTypeA set string storage randomizer: Block 10 15
        execute if data storage randomizer: {BlockTypeA: "barre"} run data modify storage randomizer: BlockTypeA set value "chest"
    # ランダムに取得したcontainerを取得(barrel→chest)
        data modify storage randomizer: BlockTypeB set string storage asset:container Block 10 15
        execute if data storage randomizer: {BlockTypeB: "barre"} run data modify storage randomizer: BlockTypeB set value "chest"
    execute if data storage randomizer: {BlockTypeA: "chest"} if data storage randomizer: {BlockTypeB: "chest"} run data modify storage asset:container Block set from storage randomizer: Block

# reset
    data remove storage randomizer: BlockTypeA
    data remove storage randomizer: BlockTypeB
