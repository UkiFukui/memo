# ruby memo.rb

require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
puts "（数字は半角で入力してください）"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
def seletct_new_old(memo_type)
  if memo_type == 1
    puts "1が入力されました" ##デバッグ
  elsif memo_type == 2
    puts "2が入力されました" ##デバッグ
  else
    until [1, 2].include?(memo_type)
      puts "半角で1か2を入力してください"
      memo_type = gets.to_i
    end
    seletct_new_old(memo_type)
  end
end

seletct_new_old(memo_type)
