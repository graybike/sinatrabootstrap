module SinatraBootstrap
  module Routes
    class Client < Base
      
      get '/' do
        haml :index
      end

    end
  end
end