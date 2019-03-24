require "minitest/autorun"

class SampleTest < Minitest::Test

  def test_sample
    # 第２引数が第１引数と等しいか
    assert_equal "RUBY", "ruby".upcase
  end

end
