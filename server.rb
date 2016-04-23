module App
  class Server < Sinatra::Base
    include App::ViewHelpers

    register Sinatra::Reloader

    get '/' do
      @projects = Semaphore.projects
      render :erb, :index
    end
  end
end