module App
  class Server < Sinatra::Base

    register Sinatra::Reloader

    get '/' do
      return render :erb, :no_auth if !Semaphoreapp.auth_token
      @projects = Semaphore.projects
      
      render :erb, :index
    end

    post '/token' do
      Semaphoreapp.auth_token = params['api-token']
      redirect '/'
    end
  end
end