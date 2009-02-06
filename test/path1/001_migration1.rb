class Migration1 < ActiveRecord::Migration
  def self.up
    $migration1 = true
  end

  def self.down
    $migration1 = true
  end
end