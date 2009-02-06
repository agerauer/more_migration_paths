require 'test/unit'
require 'test_helper'
gem 'activerecord', '>=2.3.0'
require 'active_record'
require 'more_migration_paths'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")

class MoreMigrationPathsTest < Test::Unit::TestCase

  def test_migrations
    $migration1 = false
    $migration2 = false
    $migration3 = false

    ActiveRecord::Migrator.add_migration_path('test/path1')
    ActiveRecord::Migrator.add_migration_path('test/path2')
    ActiveRecord::Migrator.migrate('test/path3')

    assert $migration1
    assert $migration2
    assert $migration3
  end
  
end
