require 'minitest/test_helper'

class TestCfenvApplication < Minitest::Test

  def test_all_whitelisted_symbols_invoke_vcap_application
    Cfenv::Application::WHITELISTED_SYMBOLS.each do |sym|
      vcap_app = Minitest::Mock.new
      vcap_app.expect sym, 'foo'
      Cfenv.stub :vcap_application, vcap_app do
        Cfenv.send(sym)
        vcap_app.verify
      end
    end
  end


  def test_vcap_name_returns_application_name_if_set
    ENV['VCAP_APPLICATION'] = MultiJson.dump({ 'name' => nil, 'application_name' => 'foo' })
    assert_equal 'foo', Cfenv.vcap_name
  end

  def test_vcap_version_returns_application_version_if_set
    ENV['VCAP_APPLICATION'] = MultiJson.dump({ 'version' => nil, 'application_version' => '123' })
    assert_equal '123', Cfenv.vcap_version
  end

end