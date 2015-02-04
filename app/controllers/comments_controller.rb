class CommentsController < ApplicationController

	before_filter :authenticate_user!, except: [:destroy]
	def create
		@comment= Comment.new(comment_params)
		@comment.article_id= params[:article_id]
		@comment.save
			redirect_to article_path(@comment.article)
	end

	def comment_params
		params.require(:comment).permit(:body, :author_name)
	end
end
