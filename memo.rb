require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

# ユーザーの入力を取得し、数値に変換
memo_type = gets.to_i

# ユーザーの入力が1の場合の処理
if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください"
  new_file_name = gets
  
  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl + Dを押してください"
  
  # openメソッドのwriteモードで、指定したcsvファイルを開く（指定したファイルが存在しない時は新規作成）
  CSV.open("#{new_file_name}.csv", 'w') do |f|
    
    # ユーザーの入力を、ファイルのデータに上書きする
    f << readlines
  end
  
# ユーザの入力が2の場合の処理  
elsif memo_type == 2
  puts "拡張子を除いたファイル名を入力してください"
  edit_file_name = gets
  
  puts "メモの内容を編集してください"
  puts "完了したらCtrl + Dを押してください"
  
  # openメソッドのappendモードで、指定したcsvファイルを開く
  CSV.open("#{edit_file_name}.csv", 'a') do |f|
    
    # ユーザーの入力を、ファイルのデータ最後尾から追加する
    f << readlines
  end
  
  puts "----------------------"
  puts "編集結果を以下に表示します"
  puts "----------------------"
  
  #openメソッドのread onlyモードで、指定したcsvファイルを開く
  CSV.open("#{edit_file_name}.csv", 'r') do |f|
    
    # ファイルのデータを1要素区切りで取り出して、出力することを繰り返す
    f.each do |element|
      puts element
    end
  end
  
end