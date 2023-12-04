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

# 最小公倍数を計算
function calc_lcm {
    local n_list=("$@")
    local lcm=${n_list[0]}

    for i in "${n_list[@]:1}"; do
        calc_gcd ${lcm} ${i}
        gcd=$?
        lcm=$((lcm * i / gcd))
    done

    return $lcm
}

# 2つの数の最大公約数を計算
function calc_gcd {
    local num1=$1
    local num2=$2

    while [ $num2 -ne 0 ]; do
        local remainder=$((num1 % num2))
        num1=$num2
        num2=$remainder
    done

    return $num1
}

# 配列の最大公約数を計算
function calc_array_gcd {
    local n_list=("$@")
    local gcd=${n_list[0]}

    for i in "${n_list[@]:1}"; do
        calc_gcd $gcd $i
        gcd=$?
    done

    return $gcd
}

# DP （最小化問題）用
function chmin {
    local -n dp=$1
    local i=$2
    local candidate=$3

    if ((dp[i] > candidate)); then
        dp[i]=$candidate
        return 0
    fi
    return 1
}

# DP （最大化問題）用
function chmax {
    local -n dp=$1
    local i=$2
    local candidate=$3

    if ((dp[i] < candidate)); then
        dp[i]=$candidate
        return 0
    fi
    return 1
}

# 再帰処理
function recurcive {
    i=$1
    if [ $i -eq 0 ]; then
        return 0
    fi
    recurcive $((i - 1))
    return $?
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
