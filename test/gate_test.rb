require "minitest/autorun"
require "./lib/gate"
require "./lib/ticket"

class GateTest < Minitest::Test

  # setupメソッドでgateオブジェクトを作成しておく
  def setup
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  def test_umeda_to_juso
    # umeda = Gate.new(:umeda)
    # juso = Gate.new(:juso)

    ticket = Ticket.new(150)
    @umeda.enter(ticket)
    # assert：処理の結果が真かどうかを検証するメソッド
    assert @juso.exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_not_enough
    # umeda = Gate.new(:umeda)
    # mikuni = Gate.new(:mikuni)

    ticket = Ticket.new(150)
    @umeda.enter(ticket)
    # refute：処理の結果が偽かどうかを検証するメソッド
    refute @mikuni.exit(ticket)
  end

  def test_umeda_to_ikuni_when_fare_is_enough
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    assert @mikuni.exit(ticket)
  end

  def test_juso_to_ikuni
    ticket = Ticket.new(150)
    @juso.enter(ticket)
    assert @mikuni.exit(ticket)
  end
end
