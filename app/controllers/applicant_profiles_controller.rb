class ApplicantProfilesController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @applicant_profiles = ApplicantProfile.all
    end

    def show
      @applicant_profile = ApplicantProfile.find(params[:id])
    end

    def new
      @applicant_profile = ApplicantProfile.new
    end

    def create
      @applicant_profile = ApplicantProfile.new(applicant_profile_params)
            
      if @applicant_profile.save
         redirect_to @applicant_profile
      else
         flash.now[:alert] = 'Favor preencher todos os campos'  
         render :new 
      end
    end

    def edit
      @applicant_profile = ApplicantProfile.find(params[:id])
    end  

    def update
      @applicant_profile = ApplicantProfile.find(params[:id])
      @applicant_profile.update(applicant_profile_params)
      redirect_to @applicant_profile
    end

    def destroy
      applicant_profile = ApplicantProfile.find(params[:id]) 
      applicant_profile.destroy 
      redirect_to root_path
    end

    private

    def applicant_profile_params
      params.require(:applicant_profile).permit(:name, :social_name, :date_of_birth,
                                                :education, :applicant_description,
                                                :experience)
    end
end
