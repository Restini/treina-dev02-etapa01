class HeadCommentsController < ApplicationController
   
    def create
        @head_proposal = HeadProposal.find(params[:head_proposal_id])
        @head_comment = @head_proposal.head_comments.create(head_comment_params)
        redirect_to head_proposal_path(@head_proposal)
    end

    def destroy
        @head_proposal = HeadProposal.find(params[:head_proposal_id]) 
        @head_comment = @head_proposal.head_comments.find(params[:id]) 
        @head_comment.destroy 
        redirect_to head_proposal_path(@head_proposal)
    end
    
    private

    def head_comment_params
        params.require(:head_comment).permit(:username, :body)
    end

end
