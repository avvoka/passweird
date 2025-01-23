# frozen_string_literal: true

require "passweird"
require "active_record"
require "database_cleaner/active_record"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before(:suite) do
    ActiveRecord::Schema.define do
      create_table :passweird_blacklisted_terms, force: true do |t|
        t.string :term, index: { unique: true }

        t.timestamps
      end
    end
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    ActiveRecord::Base.connection.close
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
