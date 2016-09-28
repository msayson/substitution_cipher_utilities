# Utility class for analyzing message character frequencies
class LetterFrequencies
  class << self
    # Return frequency of each letter in msg,
    # sorted from highest to lowest frequency
    def letter_frequencies(msg)
      characters = msg.downcase.scan(/./)
      count_frequencies(characters)
    end

    # Return letter frequencies for the set
    # of every nth character in the message,
    # sorted from highest to lowest frequency
    def nth_letter_frequencies(msg, n, offset)
      lowercase_msg = msg.downcase
      nth_letters = (offset..(msg.size - 1))
                    .step(n)
                    .map { |i| lowercase_msg[i] }
      count_frequencies(nth_letters)
    end

    # Returns the list of letter frequencies for
    # each "every nth character" message subset
    # possible for the given key phrase length
    #
    # Eg. [nth_letter_freqs_offset_0, nth_letter_freqs_offset_1,...]
    def nth_letter_frequencies_per_offset(msg, key_phrase_length)
      (0..(key_phrase_length - 1)).map do |offset|
        nth_letter_frequencies(msg, key_phrase_length, offset)
      end
    end

    # Returns unique letters from msg, sorted
    # from highest to lowest frequency
    def most_frequent_letters(msg)
      letter_frequencies(msg)
        .map { |count| count[0] }
    end

    private

    # Return frequencies of each character,
    # sorted from highest to lowest frequency
    def count_frequencies(char_arr)
      counts = Hash.new 0
      char_arr.each { |char| counts[char] += 1 }
      counts.sort { |a, b| b[1] <=> a[1] }
    end
  end
end
