require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
puts "（数字は半角で入力してください）"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# 「memo_type」の値（1 or 2）によって処理を分岐させるメソッド
def seletct_new_old(memo_type)
  if memo_type == 1
    edit_new_file
  elsif memo_type == 2
    edit_old_file
  else
    until [1, 2].include?(memo_type) # 1,2が入力されるまで処理を繰り返す
      puts "半角で1か2を入力してください"
      memo_type = gets.to_i
    end
    seletct_new_old(memo_type)
  end
end

# 新規ファイルを作成し書き込みを行うメソッド
def edit_new_file
  puts "作成したいファイル名（拡張子は除く）を入力してください"
    file_name = gets.to_s.chomp!
  puts "メモしたい内容を記入してください"
  puts "完了したら、最後に改行をしてからCtrl + Dを押してください"
    text = []
    while line = gets
      text << line.chomp
    end
    CSV.open("#{file_name}.csv","w") do |csv|
      csv << text
    end
  puts "新規ファイル[#{file_name}.csv]を作成しました"
end

# 既存ファイルに追記するメソッド
def edit_old_file
  puts "編集したいファイル名（拡張子は除く）を入力してください"
    file_name = gets.to_s.chomp!
  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl + Dを押してください"
    text = []
    while line = gets
      text << line.chomp
    end
    CSV.open("#{file_name}.csv","a") do |csv|
      csv << text
  end
puts "入力内容を[#{file_name}.csv]に追記しました"
end

seletct_new_old(memo_type)