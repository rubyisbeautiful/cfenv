require 'minitest/test_helper'

class TestCfenvServices < Minitest::Test


  def test_that_services_calls_bracket_name_on_vcap_services
    vcap_services = {'some_service' => ['foo']}
    Cfenv.stub :vcap_services, vcap_services do
      assert_equal ['foo'], Cfenv.services('some_service')
    end
  end

  def test_that_service_calls_bracket_name_on_services
    vcap_services = {'some_service' => ['foo']}
    Cfenv.stub :vcap_services, vcap_services do
      assert_equal 'foo', Cfenv.service('some_service')
    end
  end


end