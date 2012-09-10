class HomeController < ApplicationController
  def index
  end

  def dwolla_return
    token = DwollaService.request_token(params['code'], "#{request.base_url}/dwolla_return")
    @user = DwollaService.from_token(token)
  end
end
