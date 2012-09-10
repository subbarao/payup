require 'test_helper'

class DwollaServiceTest < ActiveRecord::TestCase
  test "should fetch user info" do
    VCR.use_cassette('userinfo-id') do
      user = DwollaService.user('812-626-8794') 
    end
  end

  test "should fetch user info by email" do
    VCR.use_cassette('userinfo-email') do
      user = DwollaService.user('subbarao.pasupuleti@gmail.com')

      assert_equal "venkata pasupuleti", user.name
    end
  end
end
