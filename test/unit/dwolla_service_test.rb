require 'test_helper'

class DwollaServiceTest < ActiveRecord::TestCase

  test "fetch user info from oauth token" do
    token = 'WROHQReKuAskqbPNLp2XpS5xiZ0Sq/IR+Gvl8mkYqf29xG3cFe'

    VCR.use_cassette('userinfo-from-token') do
      user = DwollaService.from_token(token)
      assert_equal 'venkata pasupuleti', user.name
    end
  end

  test "should construct client with redirect url" do
    assert DwollaService.auth_url('http://localhost:3000/callback') 
  end

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
