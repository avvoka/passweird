# frozen_string_literal: true

module Passweird
  # The Checker class is responsible for checking if a password is blacklisted
  # by generating possible terms from substrings and leet speak conversions.
  #
  # Example usage:
  #   checker = Passweird::Checker.new("password")
  #   checker.blacklisted?
  class Checker
    attr_reader :password

    def self.blacklisted?(password)
      new(password).blacklisted?
    end

    def initialize(password)
      raise ArgumentError, "password must be a String" unless password.is_a?(String)

      @password = password
    end

    # Checks if the password is blacklisted
    #
    # @return [Boolean] true if the password is blacklisted, false otherwise
    def blacklisted?
      @blacklisted ||= BlacklistedTerm.exists?(term: possible_terms)
    end

    # Retrieves the blacklisted terms that match the possible terms
    #
    # @return [ActiveRecord::Relation] a collection of blacklisted terms
    def blacklisted_terms
      @blacklisted_terms ||= BlacklistedTerm.where("LOWER(term) IN ?", possible_terms)
    end

    # Generates all possible terms from substrings and leet speak equivalents
    #
    # @return [Array<String>] an array of unique possible terms
    def possible_terms
      @possible_terms ||= (substrings + unleeted_substrings).uniq
    end

    private

    def unleeted_substrings
      @unleeted_substrings ||= LeetSpeak.unleet_all(substrings)
    end

    def substrings
      @substrings ||= Substringer.substrings(password)
    end
  end
end
