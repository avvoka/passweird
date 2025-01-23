# frozen_string_literal: true

require "active_record"

module Passweird
  # ActiveRecord model that represents a term that is blacklisted in the database.
  class BlacklistedTerm < ActiveRecord::Base
    self.table_name = "passweird_blacklisted_terms"

    validates :term, presence: true, uniqueness: true
  end
end
