# frozen_string_literal: true

module Passweird
  # The Substringer class is responsible for generating all unique substrings
  # of a given root string with a specified minimum length.
  #
  # Example usage:
  #   substringer = Passweird::Substringer.new("example")
  #   substrings = substringer.substrings(min_length: 3)
  #   # => ["exa", "exam", "examp", "exampl", "example", "xam", "xamp", "xampl", "xample", ...]
  class Substringer
    attr_reader :root_string

    def self.substrings(root_string, min_length: 3)
      new(root_string).substrings(min_length: min_length)
    end

    def initialize(root_string)
      raise ArgumentError, "root_string must be a String" unless root_string.is_a?(String)

      @root_string = root_string
    end

    # Generates all unique substrings of the root_string with a minimum length
    #
    # @param min_length [Integer] the minimum length of the substrings
    # @return [Array<String>] an array of unique substrings
    def substrings(min_length: 3)
      raise ArgumentError, "min_length must be an Integer" unless min_length.is_a?(Integer)
      raise ArgumentError, "min_length must be greater than 0" if min_length <= 0

      return [root_string] if root_string.length < min_length

      ([root_string] + get_substrings(min_length)).uniq
    end

    private

    def get_substrings(min_length)
      (0..root_string.length - min_length).flat_map do |start|
        (min_length..root_string.length - start).map do |length|
          root_string[start, length]
        end
      end.uniq
    end
  end
end
