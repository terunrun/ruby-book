class WordSynth
  def initialize
    # effectを格納する配列を用意
    @effects = []
  end

  def add_effect(effect)
    # 引数のオブジェクトを@effects配列の末尾に格納
    @effects << effect
  end

  def play(original_words)
    # 引数のoriginal_wordsをwordsの初期値として、wordsに@effects配列の各要素を適用する
    @effects.inject(original_words) do |words, effect|
      effect.call(words)
    end
  end
end
