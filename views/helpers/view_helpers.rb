module App
  module ViewHelpers
    def details_for(branch)
      @branch_details.find { |deets| branch.name == deets.branch_name }
    end
  end
end