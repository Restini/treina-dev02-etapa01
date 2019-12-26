class HeadProfilePolicy < ApplicationPolicy

    def index?
      user.headhunter?
    end
    
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  
end
  