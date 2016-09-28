# Utility class for shifting messages by n characters
# Assumes all characters are lowercase, alphabetic letters
class ShiftByN
  CHAR_CODE_A = 97 # code for lowercase 'a'

  class << self
    # Return the byte code difference between
    # the first characters of two strings
    def get_shift_value(init_char, end_char)
      end_char.bytes[0] - init_char.bytes[0]
    end

    # Shift character by n letters in the alphabet
    # Assumes byte code is for a lowercase letter
    def shift_char_code_by_n(byte_code, n)
      offset = (byte_code - CHAR_CODE_A + n) % 26
      offset + CHAR_CODE_A
    end

    # Shift each character in the message
    # by n letters, with Z -> A -> B -> ...
    # Assumes message is all lowercase letters,
    # with no punctuation or spacing
    def shift_all_chars_by_n(msg, n)
      shifted_bytes = msg.bytes.map { |b| shift_char_code_by_n(b, n) }
      byte_array_to_string(shifted_bytes)
    end

    def shift_letter_instances_by_n(msg, letter, n)
      byte_code = letter.bytes[0]
      shifted_code = shift_char_code_by_n(byte_code, n)
      updated_byte_codes = msg.bytes.map { |b| b == byte_code ? shifted_code : b }
      byte_array_to_string(updated_byte_codes)
    end

    def shift_every_nth_char(msg, start_index, step_size, shift_amount)
      next_index_for_shift = start_index
      msg_bytes = msg.downcase.bytes
      (0..(msg_bytes.size - 1)).each do |i|
        if i == next_index_for_shift
          next_index_for_shift += step_size
          msg_bytes[i] = shift_char_code_by_n(msg_bytes[i], shift_amount)
        end
      end
      byte_array_to_string(msg_bytes)
    end

    private

    def byte_array_to_string(bytes)
      bytes.pack('C*').force_encoding('utf-8')
    end
  end
end
