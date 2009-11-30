class AppSettingsData < ActiveRecord::Base

  CACHE_KEY = 'APP_SETTINGS_VALUES'
  
  set_table_name :app_settings_data
  
  def self.reload_values
    @@values = Rails.cache.read('APP_SETTINGS_VALUES')  
    if @@values.nil?
      @@values = find(:all)    
      Rails.cache.write('APP_SETTINGS_VALUES', @@values)
    end  
    @@values.each do |instance|
      const = instance.name.gsub(/\s+/, '_').upcase
      unless const_defined?(const)
        case instance.data_type
        when 'Boolean'
          const_set(const, instance.value.eql?('true') ? true : false)
        when 'Float'
          const_set(const, instance.value.to_f)
        when 'Integer'
          const_set(const, instance.value.to_i)
        when 'String'
          const_set(const, instance.value)
        end
      end
    end    
  end
end

AppSettingsData.reload_values