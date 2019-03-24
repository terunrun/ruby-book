puts "【文字列について】"
  puts "・%記法"

    puts "%q!!でシングルクォート囲みと同じ"
      puts %q!Hello 'Otani'!
      puts "\n"

    puts "%Q!!,%!!,%??,%<>（任意の記号ペア）などでダブルクォート囲みと同じ"
      something = "Hello."
      puts %Q! He said, "#{something}"!
      puts "\n"

    # 途中で!が来るとエラーになる
    # puts %Q!He said "Hi!"!

  puts "・ヒアドキュメント（行志向文字列リテラル）"

    # <<-とすることで、閉じ識別子のインデントが可能（<<だけだとエラーになる）
    # <<~とすることで、前方のスペースが無視される
    name = "Yusuke"
    hear_document = <<~TEXT
      識別子で囲まれた文字列は
      改行しても
      一つの文字列として扱われる
      識別子は文字列内に含まれないものであれば任意で設定可能
      おわかりですか、#{name}さん
    TEXT
    puts hear_document
    puts "\n"

  puts "・フォーマットを指定した文字列の作成"

    p "第２引数を第１引数（小数点以下第３位まで）で指定したフォーマットにする"
    puts sprintf('%0.3f', 1.2)
    puts "\n"


puts "【数値について】"
  p "・10進数以外のリテラル 0b～で2進数、0～で8進数、0x～で16進数"
    puts 0b11111111
    puts 0377
    puts 0xff
    puts "\n"

  puts "・指数表現"
    # 2の10^-3
    puts 2e-3


puts "【条件分岐】"
  puts "・条件子の戻り値を直接変数に格納できる"
    status = ""
    message =
      if status == "ok"
        "正常"
      elsif status == "ng"
        "異常"
      else
        "不明"
      end
    puts message
    puts "\n"

  puts "・修飾子としての条件分岐"
    message = "正常ではありません" unless status == "ok"
    puts message
    puts "\n"

  puts "・case文 whenの条件には複数指定可能"
    status = "異常"
    case status
    when "ok", "正常"
      puts "case文：OK"
    when "ng", "異常"
      puts "case文：NG"
    else
      puts "case文：unknown"
    end
    puts "\n"

  puts "・3項演算子"
    status = "ng"
    message = status == "ok" ? "正常です" : "異常です"
    puts "三項演算子：" + message
    puts "\n"


puts "【ライブラリ】"
  puts "・組み込みでないライブラリを使用する場合"
    require "date"
    d = Date.today
    puts d
    puts "\n"

  puts "・自作ライブラリを使用する場合"
  # require "./fizz_buzz.rb" # 一回だけ読み込み、ruby実行位置からのパスで読み込み
  # load "./fizz_buzz.rb" # loadだと毎回読み込み、拡張子必須
  require_relative "fizz_buzz.rb" # loadだと毎回読み込み # 自ファイルからのパスで読み込み

puts "【配列】"
  puts "・基本：要素には異なる型を混在させられる、末尾要素でも,で区切ることができる"
    array = ["a",1,nil,[1,2,3],]
    p array
    puts "\n"

  puts "・要素の追加"
    puts "存在しない要素番号を指定すると要素が追加される　間がある場合はnilになる"
    puts "ただし存在しない要素番号を後ろから指定するとエラーとなる"
    array[5] = "add"
    p array
    puts "\n"

    puts "pushメソッドまたは<<で末尾に追加、pushメソッドは引数に複数をセット可能"
    array << "<<"
    p array
    puts "\n"

  puts "・要素の削除"
    puts "delete_atメソッドで指定したインデックスの要素を削除"
    array.delete_at(4)
    p array
    puts "deleteメソッドで引数に一致する要素を削除"
    array.delete(1)
    p array
    puts "\n"

  puts "・配列を使った多重代入"
    quatient, remainder = 14.divmod(3) # divmodは呼び出し元を引数で割った商と余りを配列で返す
    p quatient, remainder
    puts "\n"

  puts "・指定したインデックスの要素を操作"
    puts "インデックス1から3つ分（インデックス1,2,3）の要素を取得"
    p array[1, 3]
    puts "インデックス0,2,4の要素を取得"
    p array.values_at(0, 2, 4)
    puts "\n"

  puts "・firstメソッドに引数を渡して先頭から引数個分の要素を取得"
    p array.first(3)
    puts "\n"

  puts "・末尾から要素を取得"
    puts "マイナスのインデックス指定で末尾から"
    p array[-2, 2]
    puts "lastメソッドに引数を渡して末尾から引数個分の要素を取得"
    p array.last(2)
    puts "\n"

  puts "要素を複数指定して代入すると、その範囲の要素は代入された値の一つの要素になる"
    p array = [1,2,3,4,5]
    array[1,3] = 100
    p array
    puts "\n"

puts "【ブロック】"
  puts "・each do |x| - end もしくは each { |x} - }　　|x|は必ずしもなくてもよい"
    numbers = [1,2,3,4,5,6,7,8,9,]
    sum = 0
    numbers.each { |n| sum += n }
    puts sum
    puts "\n"

  puts "・ブロックの戻り値をメソッドに渡す"
  puts "メソッドの戻り値がtrue（配列の各要素が奇数）なら配列から要素を削除する"
    numbers.delete_if do |n|
      n.odd?
    end
    p numbers
    puts "\n"

  puts "・ブロックとともによく使うメソッド"
    numbers = [1,2,3,4,5,6,7,8,9,]

    puts "map/collectメソッド ブロックの戻り値を各要素持つ配列を返す"
      new_numbers = numbers.map { |n| n*10 }
      p "map:" + new_numbers.to_s
      puts "\n"

    puts "select/find_allメソッド　ブロックの返り値が真の各要素を持つ配列を返す"
      new_numbers = numbers.select { |n| n.odd? }
      p "select:" + new_numbers.to_s
      puts "\n"

    puts "rejectメソッド selectの逆"
      new_numbers = numbers.reject { |n| n.odd? }
      p "reject:" + new_numbers.to_s
      puts "\n"

    puts "find/detectメソッド　ブロックの返り値が最初にtrueになった要素を返す"
      new_number = numbers.find { |n| n % 3 == 0 }
      p "find:" + new_number.to_s
      puts "\n"

    puts "inject/reduceメソッド　ブロックの第一変数の初期値に引数をセットし、ブロックの返り値を返す"
      sum = numbers.inject(0) { |result, n| result + n }
      p "inject:" + sum.to_s
      puts "\n"


puts "【範囲オブジェクト】"
  puts "・不等号判定やcase文の条件に用いられることが多い"
    numbers = [1,2,3,4,5,6,7,8,9,]
    p numbers[0..3] # 後ろを含む
    p numbers[4...6] # 後ろを含まない
    puts "\n"

  puts "・範囲オブジェクトを使用した配列の作成"
    p (1..5).to_a
    p ("a".."e").to_a
    p ("bed"..."beg").to_a
    p [*1..5]
    puts "\n"

  puts "・範囲オブジェクトで繰り返し処理"
    sum = 0
    # stepでnの増え幅を指定
    (1..10).step(2) { |n| sum += n}
    p sum
    puts "\n"

# 4.7.3までは記載
