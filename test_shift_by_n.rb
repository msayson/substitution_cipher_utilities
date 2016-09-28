require_relative 'shift_by_n'
require 'test/unit'

# Unit tests for shift_by_n
class TestShiftByN < Test::Unit::TestCase
  def test_get_shift_value
    shift_val = ShiftByN.get_shift_value('e', 'm')
    assert_equal(8, shift_val)
  end

  def test_shift_by_n
    cipher_text = 'TEXQHFKALCZXHBPELRIATBEXSB'.downcase
    expected_plain_text = 'whatkindofcakeshouldwehave'

    plain_text = ShiftByN.shift_all_chars_by_n(cipher_text, 3)
    assert_equal(expected_plain_text, plain_text)
  end

  def test_shift_letter_instances_by_n
    cipher_text = 'hennofenno'
    plain_text = ShiftByN.shift_letter_instances_by_n(cipher_text, 'n', 26 - 2)
    assert_equal('hellofello', plain_text)
  end

  def test_shift_every_nth_char
    start_index = 1
    step_size = 2
    shift_amount = 3
    shifted_msg = ShiftByN.shift_every_nth_char('ABCDEFG', start_index, step_size, shift_amount)
    assert_equal('aecgeig', shifted_msg)
  end
end
