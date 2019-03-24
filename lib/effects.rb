module Effects
  def self.reverse
    ->(words) do
      # $:reverseについて再学習すること
      words.split(" ").map(&:reverse).join(" ")
    end
  end

  def self.echo(rate)
    ->(words) do
      # wordsを各文字に分割し（charsメソッド）
      # そのそれぞれ（c）について空白ならそのまま、空白でなければ引数rate倍して（mapメソッド）
      # そのまま結合する（引数なしjoinメソッド）
      words.chars.map{ |c| c == " " ? c : c * rate }.join
    end
  end

  def self.loud(level)
    ->(words) do
      # wordsを各文字に分割し（charsメソッド）
      # そのそれぞれ（word）について文字を大文字にして引数level個の!を足して（mapメソッド）
      # スペースで結合する（joinメソッド）
      words.split(" ").map{|word| word.upcase + "!" * level}.join(" ")
    end
  end

end
