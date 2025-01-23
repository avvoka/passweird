# frozen_string_literal: true

module Passweird
  # The LeetSpeak class is responsible for converting a given string
  # into leet speak (1337 5p34k).
  #
  # Example usage:
  #   leet_speak = Passweird::LeetSpeak.new("example")
  #   leet_string = leet_speak.convert
  #   # => "3x4mpl3"
  class LeetSpeak
    attr_reader :original_string

    LEET_CHAR_EQUIVALENTS = {
      "T" => "7", "t" => "7",
      "E" => "3", "e" => "3",
      "I" => "1", "i" => "1",
      "L" => "1", "l" => "1",
      "O" => "0", "o" => "0",
      "S" => "5", "s" => "5",
      "A" => "4", "a" => "4",
      "G" => "6", "g" => "6",
      "B" => "8", "b" => "8"
    }.freeze

    def self.convert(original_string)
      new(original_string).convert
    end

    def self.convert_all(array_of_strings)
      raise ArgumentError, "array_of_strings must be an Array" unless array_of_strings.is_a?(Array)

      array_of_strings.map { |string| convert(string) }
    end

    def initialize(original_string)
      raise ArgumentError, "original_string must be a String" unless original_string.is_a?(String)

      @original_string = original_string
    end

    # Converts the original_string to leet speak
    #
    # @return [String] the converted leet speak string
    def convert
      original_string.gsub(/[#{LEET_CHAR_EQUIVALENTS.keys.join}]/, LEET_CHAR_EQUIVALENTS)
    end
  end
end
