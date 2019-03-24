require "minitest/autorun"
require "./lib/word_synth"
require "./lib/effects"

class WordSynthTest < Minitest::Test
  def test_play
    synth = WordSynth.new

    synth.add_effect(Effects.reverse)
    assert_equal "ybuR si !nuf", synth.play("Ruby is fun!")

    synth.add_effect(Effects.echo(2))
    assert_equal "yybbuuRR ssii !!nnuuff", synth.play("Ruby is fun!")

    synth.add_effect(Effects.loud(3))
    assert_equal "YYBBUURR!!! SSII!!! !!NNUUFF!!!", synth.play("Ruby is fun!")
  end
end
