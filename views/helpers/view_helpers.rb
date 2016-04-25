module App
  module ViewHelpers
    def details_for(branch)
      @branch_details.find { |deets| branch.name == deets.branch_name }
    end

    def date_for(build)
      build.finished_at.nil? ? '--' : format_date(DateTime.parse(build.finished_at))
    end

    def format_date(date)
      date.strftime("%l:%M %P, %b. %e, %Y")
    end
  end
end