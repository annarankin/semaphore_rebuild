module App
  class RebuildController < App::Server
    post '/' do

      # lol
      build_repeats.times do
        Semaphore.branch(params[:project_id], params[:branch_id]).rebuild
      end

      "OK"
    end

    private

    def build_repeats
      params[:build_repeats].to_i > 0 ? params[:build_repeats].to_i : 1
    end
  end
end