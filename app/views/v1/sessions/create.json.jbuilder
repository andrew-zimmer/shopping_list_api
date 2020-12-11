json.data do
    json.user do
        json.call(
            @user,
            :email,
            :id,
            :username,
            :authentication_token,
            :quick_picks
        )
    end
end
