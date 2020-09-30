module SessionsHelper

    #logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the current logged-in u+ser (if any)

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def logged_in? #listing 8.18
        !current_user.nil?
    end
# Logs out current user
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
