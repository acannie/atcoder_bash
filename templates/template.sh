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

    # read S
    # read N
    # read H W
    # declare -a S_LIST
    # for ((i=0; i<H; i++)); do
    #     read S
    #     S_LIST+=("$S")
    # done
    # read -ra N_LIST
    # declare -A HW_LIST
    # for ((i=0; i<H; i++)); do
    #     declare -a N_LIST
    #     read -ra N_LIST
    #     for ((j=0; j<W; j++)); do
    #         HW_LIST[$i,$j]=${N_LIST[j]}
    #     done
    # done

    # -----------
    #    計算
    # -----------

    echo "World"
}

function main {
    solution1
}

main
