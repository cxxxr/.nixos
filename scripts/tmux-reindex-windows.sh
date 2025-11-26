#!/usr/bin/env bash


# 現在のセッション名を取得
session=$(tmux display-message -p '#S')


# ウィンドウ番号の一覧を昇順で取得
window_ids=($(tmux list-windows -t "$session" -F '#I' | sort -n))


# 再配置用の一時番号（衝突を避けるため1000以上にする）
temp_base=1000


# ステップ1: 衝突を避けるためすべてのウィンドウを一時番号に移動
for i in "${!window_ids[@]}"; do
  tmux move-window -s "${session}:${window_ids[i]}" -t "${session}:$((temp_base + i))"
done


# ステップ2: 一時番号から0番から順に再配置
for i in "${!window_ids[@]}"; do
  tmux move-window -s "${session}:$((temp_base + i))" -t "${session}:$((i + 1))"
done

