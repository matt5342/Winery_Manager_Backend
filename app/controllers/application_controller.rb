class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, '74CGUtGNb8eUmVhQcJSAB2MZATPTnV')
    end

    def auth_header
        request.headers["Authorization"]
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, '74CGUtGNb8eUmVhQcJSAB2MZATPTnV')[0]
            rescue JWT::DecodeError
                nil
            end   
        end
    end
end
