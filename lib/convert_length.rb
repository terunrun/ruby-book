#グローバル定数として定義
UNITS = {m: 1.0, ft: 3.28, in: 39.37}

# 引数をキーワード引数とする（初期値なし）
def convert_length(length:, from: :m, to: :m)
  # キーがシンボルのハッシュを作成
  # units = {m: 1.0, ft: 3.28, in: 39.37}
  ((length / UNITS[from]) * UNITS[to]).round(2)
end
