class ApplicationController < ActionController::API
    before_action :authorized
    # BE SURE TO RUN 'source secrets.sh' WITH EVERY NEW TERMINAL SESSION!!
    # https://github.com/sf-wdi-31/how-to-hide-secrets
    def encode_token(payload)
        JWT.encode(payload, ENV['AUTH_KEY'])
    end

    def auth_header
        request.headers["Authorization"]
    end
    def decode(token)
        JWT.decode(token, ENV['AUTH_KEY'], true, algorithm: 'HS256')
    end

    def decoded_token
        if auth_header
            token = auth_header
            begin
                JWT.decode(token, ENV['AUTH_KEY'], true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end   
        end
    end

    def current_user 
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = Owner.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: "Please log in" }, status: :unauthorized unless logged_in?
    end

end
