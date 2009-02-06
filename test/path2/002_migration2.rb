class Migration2 < ActiveRecord::Migration
  def self.up
    $migration2 = true
  end

  def self.down
    $migration2 = true
  end
end