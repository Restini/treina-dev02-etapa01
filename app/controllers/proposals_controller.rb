class ProposalsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @proposals = Proposal.all
    end

    def show
      @proposal = Proposal.find(params[:id])
    end

    def new
      @proposal = Proposal.new
    end

    def create
      @proposal = Proposal.new(proposal_params)
            
      if @proposal.save
        redirect_to @proposal
      else
        flash.now[:alert] = 'Favor preencher todos os campos'  
        render :new 
      end
    end

    def edit
      @proposal = Proposal.find(params[:id])
    end  

    def update
      @proposal = Proposal.find(params[:id])
      @proposal.update(proposal_params)
      redirect_to @proposal
    end

    def destroy
      @proposal = Proposal.find(params[:id])
      @proposal.destroy 
      redirect_to root_path
    end

    private

    def proposal_params
      params.require(:proposal).permit(:title, :body,)
    end

end