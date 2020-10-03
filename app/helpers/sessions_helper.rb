module SessionsHelper

    #logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end

    # Remembers user in a persistent session
    def remember(user)
        user.remember
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    # Returns the user corresponding to the remember token cookie.
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
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
