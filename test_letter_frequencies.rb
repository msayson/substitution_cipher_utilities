require_relative 'letter_frequencies'
require 'test/unit'

# Unit tests for letter_frequencies
class TestLetterFrequencies < Test::Unit::TestCase
  def test_letter_frequencies
    expected_freqs = [['l', 3], ['o', 2], ['h', 1], ['e', 1],
                      ['w', 1], ['r', 1], ['d', 1]]
    freqs = LetterFrequencies.letter_frequencies('HELLOWORLD')
    assert_equal(expected_freqs, freqs)
  end

  def test_nth_letter_frequencies_zero_offset
    expected_freqs = [['a', 2], ['c', 1]]
    freqs = LetterFrequencies.nth_letter_frequencies('ABCDAB', 2, 0)
    assert_equal(expected_freqs, freqs)
  end

  def test_nth_letter_frequencies_with_offset
    expected_freqs = [['e', 2], ['i', 1]]
    freqs = LetterFrequencies.nth_letter_frequencies('CIPHERTEXT', 3, 1)
    assert_equal(expected_freqs, freqs)
  end

  def test_nth_letter_frequencies_per_offset
    expected = [[['h', 1], ['l', 1]], # offset = 0
                [['e', 1], ['o', 1]], # offset = 1
                [['l', 1]]]           # offset = 2
    all_freqs = LetterFrequencies.nth_letter_frequencies_per_offset('HELLO', 3)
    assert_equal(expected, all_freqs)
  end

  def test_most_frequent_letters
    expected_letters = %w(l o h e w r d)
    letters = LetterFrequencies.most_frequent_letters('HELLOWORLD')
    assert_equal(expected_letters, letters)
  end
end
