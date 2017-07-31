require "minitest/autorun"
require_relative "hangman.rb"

class TestHangman < Minitest::Test

	def test_assert_that_1_equals_1()
		assert_equal(1, 1)
	end

	def test_assert_that_fox_equals_word(word)
		word = "fox"
		assert_equal("fox", get_word(word))
	end
end
