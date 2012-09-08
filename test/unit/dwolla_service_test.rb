require 'test_helper'

class DwollaServiceTest < ActiveRecord::TestCase
  setup do
    @client = DwollaService.client
  end

  test "should fetch user info" do
    VCR.use_cassette('userinfo') do
      @client.user('812-626-8794') 
    end
  end
end
