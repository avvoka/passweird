# frozen_string_literal: true

module Passweird
  module Leet
    # The LeetSpeak class is responsible for converting a given string
    # into leet speak (1337 5p34k) and converting it back to normal text.
    #
    # Example usage:
    #   leet_speak = Passweird::LeetSpeak.new("example")
    #   leet_string = leet_speak.leet
    #   # => "3x4mpl3"
    #   normal_string = leet_speak.unleet
    #   # => "example"
    class Translate
      attr_reader :given_string

      CIPHER = {
        "4" => "A",
        "8" => "B",
        "{" => "C",
        "(" => "C",
        "3" => "E",
        "6" => "G",
        "0" => "O",
        "5" => "S",
        "7" => "T",
        "2" => "Z"
      }.freeze

      # Pattern to check if string is either:
      # - String + Numbers
      # - String + Special Characters
      # - String + Numbers + Special Characters
      MIXED_CHAR_REGEX = /^(?=.*[a-zA-Z])(?=.*[\d\W]).+$/.freeze

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
        given_string.upcase.gsub(inverted_cipher_regex, inverted_cipher)
      end

      def leet?
        mixed_characters?(given_string) && given_string != leet
      end

      # Converts the leet speak string back to normal text
      #
      # @return [String] the converted normal text string
      def unleet
        given_string.upcase.gsub(cipher_regex, cipher)
      end

      def cipher
        @cipher ||= ExtendedCipher::CIPHER.merge(CIPHER)
      end

      def inverted_cipher
        @inverted_cipher ||= cipher.invert
      end

      def cipher_regex
        @cipher_regex ||= Regexp.union(cipher.keys)
      end

      def inverted_cipher_regex
        @inverted_cipher_regex ||= Regexp.union(inverted_cipher.keys)
      end

      private

      def mixed_characters?(string)
        !string.match(MIXED_CHAR_REGEX).nil?
      end
    end
  end
end
