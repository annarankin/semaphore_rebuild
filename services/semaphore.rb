module Semaphore
  # Using the Semaphoreapp gem for gets
  class << self
    def projects
      Semaphoreapp::Project.all
    end

    def project(id)
      Semaphoreapp::Project.find id
    end

    def branch(project_id, branch_id)
      Branch.find(project_id, branch_id)
    end

    class Branch < Semaphoreapp::Branch
      def rebuild
        # POST /api/v1/projects/:project_hash_id/:branch_id/build
        HTTParty.post(rebuild_url)
      end

      private

      def rebuild_url
        "https://semaphoreci.com/api/v1/projects/#{project_hash_id}/#{id}/build?auth_token=#{Semaphoreapp.auth_token}"
      end
    end

  end
end
