class HeadProfilesController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @comments = Comment.all
      @proposals = Proposal.all
      @head_profiles = HeadProfile.all
    end

    def show
      @head_profile = HeadProfile.find(params[:id])
    end

    def new
      @head_profile = HeadProfile.new
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
    
    private

    def head_profile_params
      params.require(:head_profile).permit(:name, :company)
    end

end
