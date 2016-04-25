module App
  class Server < Sinatra::Base

    register Sinatra::Reloader

    get '/' do
      @projects = Semaphore.projects
      render :erb, :index
    end
  end
end