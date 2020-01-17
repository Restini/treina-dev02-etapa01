class AppliesController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @applies = Apply.all
      @users = User.all
    end

    def show
      @apply = Apply.find(params[:id])
    end

    def new
      @apply = Apply.new
      set_collections
    end

    def create
      @jobs = Job.all
      @apply = Apply.new(apply_params)
            
      if @apply.save
        redirect_to @apply
      else
        flash.now[:alert] = 'Favor preencher todos os campos'  
        render :new 
      end
    end

    def edit
      @apply = Apply.find(params[:id])
    end  

    def update
      @apply = Apply.find(params[:id])
      @apply.update(apply_params)
      redirect_to @apply
    end

    def destroy
      apply = Apply.find(params[:id]) 
      apply.destroy 
      redirect_to root_path
    end
    
    def set_collections
      @jobs = Job.all
    end
    
    private

    def apply_params
      params.require(:apply).permit(:applicant_name, :email, :job_id)
    end
end
