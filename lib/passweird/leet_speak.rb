# frozen_string_literal: true

module Passweird
  # The LeetSpeak class is responsible for converting a given string
  # into leet speak (1337 5p34k) and converting it back to normal text.
  #
  # Example usage:
  #   leet_speak = Passweird::LeetSpeak.new("example")
  #   leet_string = leet_speak.leet
  #   # => "3x4mpl3"
  #   normal_string = leet_speak.unleeted
  #   # => "example"
  class LeetSpeak
    attr_reader :given_string

    ALPHABET_TO_SIMPLE_LEET = {
      "A" => "4",
      "B" => "8",
      "C" => "(",
      "D" => "|)",
      "E" => "€",
      "F" => "|=",
      "G" => "6",
      "H" => "#",
      "I" => "1",
      "K" => "|<",
      "L" => "1",
      "M" => "^^",
      "N" => "И",
      "O" => "0",
      "P" => "|>",
      "R" => "|2",
      "S" => "5",
      "T" => "7",
      "U" => "U",
      "X" => "×",
      "Y" => "¥",
      "Z" => "2"
    }.freeze

    def self.leet(given_string)
      new(given_string).leet
    end

    def self.leet?(given_string)
      new(given_string).leet?
    end

    def self.leet_all(array_of_strings)
      raise ArgumentError, "array_of_strings must be an Array" unless array_of_strings.is_a?(Array)

      array_of_strings.map { |string| leet(string) }
    end

    def self.unleeted(given_string)
      new(given_string).unleeted
    end

    def self.unleet_all(array_of_strings)
      raise ArgumentError, "array_of_strings must be an Array" unless array_of_strings.is_a?(Array)

      array_of_strings.map { |string| unleeted(string) }
    end

    def initialize(given_string)
      raise ArgumentError, "given_string must be a String" unless given_string.is_a?(String)

      @given_string = given_string
    end

    # Converts the given_string to leet speak
    #
    # @return [String] the converted leet speak string
    def leet
      given_string.upcase.gsub(/[#{ALPHABET_TO_SIMPLE_LEET.keys.join}]/, ALPHABET_TO_SIMPLE_LEET)
    end

    def leet?
      given_string == leet
    end

    # Converts the leet speak string back to normal text
    #
    # @return [String] the converted normal text string
    def unleeted
      given_string.gsub(/[#{LEET_CHAR_EQUIVALENTS.values.join}]/, LEET_CHAR_EQUIVALENTS.invert)
    end
  end
end
