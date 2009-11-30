require File.dirname(__FILE__) + '/test_helper.rb'

class AppSettingsTest < Test::Unit::TestCase

  context "A boolean" do
    setup do
      @bool_constant = AppSettingsData.new
      @bool_constant.name = 'test_bool'
      @bool_constant.data_type = 'Boolean'
      @bool_constant.value = true.to_s
      @bool_constant.save
      Rails.cache.clear
      AppSettingsData.reload_values
    end
    
    teardown do
      @bool_constant.destroy
      Rails.cache.clear
    end

    should "should be stored and retreived correctly" do
      assert_equal true, AppSettingsData::TEST_BOOL
    end
  end
    
  context "A float" do
    setup do
      @float_constant = AppSettingsData.new
      @float_constant.name = 'test_float'
      @float_constant.data_type = 'Float'
      @float_constant.value = 1.5
      @float_constant.save
      Rails.cache.clear
      AppSettingsData.reload_values
    end
    
    teardown do
      @float_constant.destroy
      Rails.cache.clear
    end

    should "should be stored and retreived correctly" do
      assert_equal 1.5, AppSettingsData::TEST_FLOAT
    end
  end
  
  context "An integer" do
    setup do
      @int_constant = AppSettingsData.new
      @int_constant.name = 'test_integer'
      @int_constant.data_type = 'Integer'
      @int_constant.value = 20
      @int_constant.save
      Rails.cache.clear
      AppSettingsData.reload_values
    end
    
    teardown do
      @int_constant.destroy
      Rails.cache.clear
    end

    should "should be stored and retreived correctly" do
      assert_equal 20, AppSettingsData::TEST_INTEGER
    end
  end  
  
  context "A string" do
    setup do
      @string_constant = AppSettingsData.new
      @string_constant.name = 'test_string'
      @string_constant.data_type = 'String'
      @string_constant.value = "asdf"
      @string_constant.save
      Rails.cache.clear
      AppSettingsData.reload_values
    end
    
    teardown do
      @string_constant.destroy
      Rails.cache.clear
    end

    should "should be stored and retreived correctly" do
      assert_equal "asdf", AppSettingsData::TEST_STRING
    end
  end  
end
