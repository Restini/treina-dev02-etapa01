class HeadProfilesController < ApplicationController

    def index
      @head_profiles = HeadProfile.all
    end

    def show
      @head_profile = HeadProfile.find(params[:id])
    end

    def new
      @head_profile = HeadProfile.new
      set_collections
    end

    def create
      @head_profile = HeadProfile.new(head_profile_params)
            
      if @head_profile.save
        redirect_to @head_profile
      else
        flash.now[:alert] = 'Favor preencher todos os campos'  
        render :new 
      end
    end

    def edit
      @head_profile = HeadProfile.find(params[:id])
    end  

    def update
      @head_profile = HeadProfile.find(params[:id])
      @head_profile.update(head_profile_params)
      redirect_to @head_profile
    end

    def destroy
      head_profile = HeadProfile.find(params[:id]) 
      head_profile.destroy 
      redirect_to root_path
    end
    
    def set_collections
      #@jobs = Job.all
    end
    
    private

    def head_profile_params
      params.require(:head_profile).permit(:name, :company)
    end
end
