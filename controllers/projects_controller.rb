module App
  class ProjectsController < App::Server
    get '/' do
      redirect '/'
    end

    get '/:id' do
      @project = Semaphore.project(params[:id])
      @branches = @project.get_branches
      @branch_details = @project.branches
      render :erb, :project
    end

    get '/:project_id/branches' do
      redirect "/projects/#{params[:project_id]}"
    end

    get '/:project_id/branches/:branch_id' do
      @branch = Semaphore.branch(params[:project_id], params[:branch_id])
      @builds = @branch.get_builds
      render :erb, :branch
    end
  end
end