class CommentsController < ApplicationController
	def create
		@comment=current_user.comment.build(comment_params)
	end

	def destroy
		@comment=Comment.find(params[:id])
	    @comment.destroy
	    respond_to do |format|
	      format.html { redirect_to request.referrer, notice: 'Comment was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end

  	
	private
	
	def comment_params
		params.require(:comment).permit(:content)
	end
end
