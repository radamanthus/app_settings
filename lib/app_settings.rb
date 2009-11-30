module AppSettings
    
    module MigrateMethods
      # Create the AppSettings tables
      # To be used during migration, but can also be used in other places
      def create_app_settings_tables(options = {})      
        # app_settings
        self.connection.create_table(:app_settings_data) do |t|
          t.string        :name, :value, :data_type
          t.timestamps
        end
      end

      # Drop the AppSettings tables. 
      # To be used during migration, but can also be used in other places
      def drop_app_settings_tables(options = {})
        self.connection.drop_table :app_settings_data
      end      
    end
  
end