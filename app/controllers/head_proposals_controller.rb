class HeadProposalsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @applicant_profiles = ApplicantProfile.all
      @head_proposals = HeadProposal.all
    end

    def show
      @head_proposal = HeadProposal.find(params[:id])
    end

    def new
      @head_proposal = HeadProposal.new
    end

    def create
      @head_proposal = HeadProposal.new(head_proposal_params)
            
      if @head_proposal.save
        redirect_to @head_proposal
      else
        flash.now[:alert] = 'Favor preencher todos os campos'  
        render :new 
      end
    end

    def edit
      @head_proposal = HeadProposal.find(params[:id])
    end  

    def update
      @head_proposal = HeadProposal.find(params[:id])
      @head_proposal.update(head_proposal_params)
      redirect_to @proposal
    end

    def destroy
      @head_proposal = HeadProposal.find(params[:id])
      @head_proposal.destroy 
      redirect_to root_path
    end

    private

    def head_proposal_params
      params.require(:head_proposal).permit(:title, :body,)
    end

end
