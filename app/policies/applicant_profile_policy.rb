class ApplicantProfilePolicy < ApplicationPolicy

  def index?
    user.applicant?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end

end
