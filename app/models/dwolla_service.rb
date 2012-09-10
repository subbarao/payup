class DwollaService
  @@api_key     = 'uGe9VihK1TZ2jGUAsnEgYtafhkgmLEO09mBLgF4Mc2glJvnxAT'
  @@secret_key  = 'ORmp8bJQmMUyHa1URVzRjs5ptTFjsSJnySRUnTs3QiCNUv7x2K'
  @@client      = Dwolla::Client.new @@api_key, @@secret_key 

  class << self

    delegate :user, :auth_url, :request_token, to: :client

    def from_token(token)
      Dwolla::User.me(token).fetch
    end

    private

      def client
        @@client
      end
  end
end
