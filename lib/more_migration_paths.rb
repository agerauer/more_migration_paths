module ActiveRecord
  class Migrator
    
    class << self

      def migrate_with_extra_paths(migrations_path, target_version = nil)
        add_migration_path(migrations_path)
        migrate_without_extra_paths(nil, target_version)
      end
      alias_method_chain :migrate, :extra_paths
            
      # add a search path for migrations
      def add_migration_path(path)
        @migration_paths ||= []
        @migration_paths << path
      end
      
      # remove a search path for migrations
      def remove_migration_path(path)
        @migration_paths.delete(path)
      end
      
      # return the search path array
      def get_migration_paths
        @migration_paths || []
      end
      
    end

    # runs through all the supplied directories in search for migrations
    def migrations_with_extra_paths
      @migrations_with_extra_paths ||= begin
        all_migrations = []
        self.class.get_migration_paths.to_a.each do |path|
          @migrations_path = path
          all_migrations << migrations_without_extra_paths
          @migrations = nil
        end
        all_migrations.flatten!
        all_migrations = all_migrations.sort_by(&:version)
        down? ? all_migrations.reverse : all_migrations
      end
      
    end
    alias_method_chain :migrations, :extra_paths
    
    
    
  end
  
end
