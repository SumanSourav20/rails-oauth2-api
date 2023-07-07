module CustomTokenResponse
    def body
      additional_data = {
        'email' => User.find(token.resource_owner_id).email
      }
      super.merge(additional_data)
    end
end