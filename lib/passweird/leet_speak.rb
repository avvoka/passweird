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

    def self.leet(given_string)
      new(given_string).leet
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
      given_string.gsub(/[#{LEET_CHAR_EQUIVALENTS.keys.join}]/, LEET_CHAR_EQUIVALENTS)
    end

    # Converts the leet speak string back to normal text
    #
    # @return [String] the converted normal text string
    def unleeted
      given_string.gsub(/[#{LEET_CHAR_EQUIVALENTS.values.join}]/, LEET_CHAR_EQUIVALENTS.invert)
    end
  end
end
