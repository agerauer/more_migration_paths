class Migration3 < ActiveRecord::Migration
  def self.up
    $migration3 = true
  end

  def self.down
    $migration3 = true
  end
end