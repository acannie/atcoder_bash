#!/bin/bash

# 定数
YES="Yes"
NO="No"

# リストの要素をスペース区切りで出力
function print_with_space {
    local l=("$@")
    l_len="${#l[@]}"
    for i in "${!l[@]}"; do
        element=${l[i]}
        if [ ${i} -lt $((l_len - 1)) ]; then
            echo -n "${element}"
            echo -n " "
        else
            echo "${element}"
        fi
    done
}

function solution1 {
    # -----------
    #    設定
    # -----------

    # -----------
    #    入力
    # -----------

    # -----------
    #    計算
    # -----------

    echo "World"
}

function main {
    solution1
}

main
