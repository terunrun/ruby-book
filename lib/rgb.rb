def to_hex(r = 0, g = 0, b = 0)
  # to_s(X)でx進数の文字列に変換、rjust(X,Y)でx桁右詰めで空桁をYで埋める
  # r = r.to_s(16).rjust(2,"0")
  # b = b.to_s(16).rjust(2,"0")
  # g = g.to_s(16).rjust(2,"0")
  # rgb = "#" + r + g + b

  # each文でリファクタリング
  # hex = "#"
  # [r,g,b].each do |c|
  #   hex += c.to_s(16).rjust(2,"0")
  # end
  # hex

  # injectメソッドでリファクタリング
  [r,g,b].inject("#") { |result, c| result += c.to_s(16).rjust(2,"0") }
end

def to_ints(hex = "#000000")
  # r = hex[1..2]
  # g = hex[3..4]
  # b = hex[5..6]

  # 多重代入でリファクタリング
  # r, g, b = hex[1..2], hex[3..4], hex[5..6]

  # scanメソッド（正規表現にマッチしたものを返す）でリファクタリング
  # r, g, b = hex.scan(/\w\w/)

  # ints = []
  # [r,g,b].each do |c|
  #   ints << c.hex
  # end
  # ints

  # mapメソッドでリファクタリング
  # [r,g,b].map { |c| c.hex }

  # シンボルを使用してリファクタリング
  hex.scan(/\w\w/).map(&:hex)
end
