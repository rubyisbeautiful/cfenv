require 'minitest/test_helper'

class TestCfenv < Minitest::Test


  def test_that_vcap_returns_false_when_not_vcap
    ENV.delete('VCAP_APPLICATION')
    assert_equal false, Cfenv.vcap?
  end


  def test_that_vcap_returns_true_when_vcap
    ENV['VCAP_APPLICATION'] = MultiJson.dump({ 'instance_id' => '12345' })
    assert_equal true, Cfenv.vcap?
  end


end