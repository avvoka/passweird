# frozen_string_literal: true

module Passweird
  # The LeetSpeak class is responsible for converting a given string
  # into leet speak (1337 5p34k) and converting it back to normal text.
  #
  # Example usage:
  #   leet_speak = Passweird::LeetSpeak.new("example")
  #   leet_string = leet_speak.leet
  #   # => "3x4mpl3"
  #   normal_string = leet_speak.unleet
  #   # => "example"
  class LeetSpeak
    attr_reader :given_string

    ALPHABET_TO_SIMPLE_LEET = {
      # Uppercase
      "A" => "4",
      "B" => "8",
      "C" => "(",
      "E" => "3",
      "F" => "ƒ",
      "G" => "6",
      "H" => "#",
      "I" => "1",
      "N" => "И",
      "O" => "0",
      "R" => "Я",
      "S" => "5",
      "T" => "7",
      "U" => "U",
      "Y" => "¥",
      "Z" => "2",
      # Downcase
      "a" => "4",
      "b" => "8",
      "c" => "(",
      "e" => "3",
      "f" => "ƒ",
      "g" => "6",
      "h" => "#",
      "i" => "1",
      "n" => "и",
      "o" => "0",
      "r" => "я",
      "s" => "5",
      "t" => "7",
      "u" => "u",
      "y" => "¥",
      "z" => "2"
    }.freeze

    # Reference: https://en.wikipedia.org/wiki/Leet#Table_of_leet-speak_substitutes_for_normal_letters
    # Excluded leet speak equivalents that has 3 or more characters
    LEET_TO_ALPHABET = {
      "4" => "A", "@" => "A", "Д" => "A",
      "8" => "B", "ß" => "B",
      "(" => "C", "{" => "C",
      "3" => "E", "£" => "E", "€" => "E",
      "ƒ" => "F",
      "6" => "G", "9" => "G",
      "#" => "H",
      "1" => "I", "!" => "I",
      "И" => "N", "ท" => "N",
      "0" => "O", "Ø" => "O",
      "Я" => "R",
      "5" => "S", "$" => "S",
      "7" => "T",
      "พ" => "W", "₩" => "W", "ω" => "W",
      "¥" => "Y",
      "2" => "Z"
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

    def self.unleet(given_string)
      new(given_string).unleet
    end

    def self.unleet_all(array_of_strings)
      raise ArgumentError, "array_of_strings must be an Array" unless array_of_strings.is_a?(Array)

      array_of_strings.map { |string| unleet(string) }
    end

    def initialize(given_string)
      raise ArgumentError, "given_string must be a String" unless given_string.is_a?(String)

      @given_string = given_string
    end

    # Converts the given_string to leet speak
    #
    # @return [String] the converted leet speak string
    def leet
      given_string.gsub(/[#{ALPHABET_TO_SIMPLE_LEET.keys.join}]/, ALPHABET_TO_SIMPLE_LEET)
    end

    def leet?
      given_string != leet
    end

    # Converts the leet speak string back to normal text
    #
    # @return [String] the converted normal text string
    def unleet
      given_string.upcase.gsub(/[#{LEET_TO_ALPHABET.keys.join}]/, LEET_TO_ALPHABET)
    end
  end
end
