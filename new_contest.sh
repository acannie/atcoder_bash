#!/bin/bash

TRUE=1
FALSE=0

SUBMISSION_TEMPLATE_PATH="templates/template.sh"
TEST_TEMPLATE_PATH="templates/test_template.sh"

# テンプレート中のtemplateを問題名で置換
function replace_question_index {
    # 引数
    file_path=$1
    contest_name=$2
    question_index=$3

    # 小文字
    question_index_lower=$(echo $question_index | tr 'A-Z' 'a-z')
    old_string="template"
    new_string="${contest_name}_${question_index_lower}"
    sed -i "s/$old_string/$new_string/g" $file_path

    # 大文字
    question_index_upper=$(echo $question_index | tr 'a-z' 'A-Z')
    old_string="TEMPLATE"
    new_string="${contest_name}_${question_index_upper}"
    sed -i "s/$old_string/$new_string/g" $file_path
}

# 作成したファイルの概要を表示する
function print_created_files_info_summary {
    # 引数
    submissions_n=$1
    tests_n=$2

    # 作成数情報
    text=""
    if [ $submissions_n -eq 1 ]; then
        text+="a submission file"
    elif [ $submissions_n -lt 1 ]; then
        text+="$submissions_n submission files"
    fi

    if [ ${submissions_n} -gt 0 ] && [ ${tests_n} -gt 0 ]; then
        text+=" and "
    fi

    if [ $tests_n -eq 1 ]; then
        text+="a test file"
    elif [ $tests_n -lt 1 ]; then
        text+="$tests_n test files"
    fi

    # 「作成された」
    if [ $((submissions_n + tests_n)) -eq 1 ]; then
        text+=" was"
    elif [ $((submissions_n + tests_n)) -gt 1 ]; then
        text+=" were"
    fi
    text+=" created."

    # 作成されなかった場合
    if [ ${submissions_n} -eq 0 ] && [ ${tests_n} -eq 0 ]; then
        text="No files were created."
    fi

    echo "$text"
}

function main {
    # コンテスト名を取得
    read -p "コンテスト名 --> " CONTEST_NAME
    CONTEST_NAME_PATH="src/${CONTEST_NAME}"

    # 問題数が数値であるか確認
    while [ $TRUE ]; do
        read -p "問題数 --> " QUESTION_NUMBER
        if [[ $QUESTION_NUMBER =~ ^[0-9]+$ ]]; then
            break
        fi

        echo "問題数は数値で入力してください。"
    done

    # ディレクトリの存在確認と作成
    if [ ! -d ${CONTEST_NAME_PATH} ]; then
        mkdir ${CONTEST_NAME_PATH}
    fi

    # 提出用プログラムを作成
    created_submission_files=()
    for ((i=0; i<${QUESTION_NUMBER}; i++)); do
        # パス作成
        letter=$(printf "\x$(printf %x $((97 + i)))")
        QUESTION_SUBMISSION_PATH=${CONTEST_NAME_PATH}/${CONTEST_NAME}_${letter}.sh
        # 存在確認
        if [ -d ${QUESTION_SUBMISSION_PATH} ]; then
            continue
        fi
        # ファイル作成
        cp ${SUBMISSION_TEMPLATE_PATH} ${QUESTION_SUBMISSION_PATH}
        created_submission_files+=("$QUESTION_SUBMISSION_PATH")
    done

    # テストプログラムを作成
    created_test_files=()
    for ((i=0; i<${QUESTION_NUMBER}; i++)); do
        # パス作成
        letter=$(printf "\x$(printf %x $((97 + i)))")
        QUESTION_TEST_PATH=${CONTEST_NAME_PATH}/test_${CONTEST_NAME}_${letter}.sh
        # 存在確認
        if [ -d ${QUESTION_TEST_PATH} ]; then
            continue
        fi
        # ファイル作成
        cp ${TEST_TEMPLATE_PATH} ${QUESTION_TEST_PATH}
        replace_question_index ${QUESTION_TEST_PATH} ${CONTEST_NAME} ${letter}
        created_test_files+=("$QUESTION_TEST_PATH")
    done

    # 作成したファイルの情報を表示
    echo ""
    print_created_files_info_summary ${#created_submission_files[@]} ${#created_test_files[@]}
    for created_file in ${created_submission_files[@]}; do
        echo "${created_file}"
    done
    for created_file in ${created_test_files[@]}; do
        echo "${created_file}"
    done
}

main
