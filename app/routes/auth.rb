module SinatraBootstrap
  module Routes
    class Auth < Base

      # Warden Configuration
      use Warden::Manager do |config|
        config.serialize_into_session{|user| user.id }
        config.serialize_from_session{|id| User.get(id) }

        config.scope_defaults :default,
          strategies: [:password],
          action: '/unauthenticated'
        config.failure_app = self
      end

      Warden::Manager.before_failure do |env,opts|
        env['REQUEST_METHOD'] = 'POST'
      end

      Warden::Strategies.add(:password) do
        def valid?
          params['user'] && params['user']['email'] && params['user']['password']
        end

        def authenticate!
          user = User.first(email: params['user']['email'])

          if !user.nil? && user.authenticate(params['user']['password'])
            success! user
          else
            fail! "The email & password combination you entered could not be found."
          end
        end
      end

      # Authentication routes.
      get '/login' do
        redirect '/' if warden.authenticated?
          
        haml :login
      end

      post '/login' do
        warden.authenticate!

        flash[:success] = warden.message

        if session[:return_to].nil?
          redirect '/'
        else
          redirect session[:return_to]
        end
      end

      get '/logout' do
        warden.raw_session.inspect
        warden.logout
        flash[:success] = 'Successfully logged out'
        redirect '/'
      end

      post '/unauthenticated' do
        session[:return_to] = env['warden.options'][:attempted_path]
        puts env['warden.options'][:attempted_path]
        flash[:error] = warden.message || "Please log in before continuing."
        redirect '/login'
      end

    end
  end
end