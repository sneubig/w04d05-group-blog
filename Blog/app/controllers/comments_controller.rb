class CommentsController < ApplicationController
#	before_action: authenticate_user!, except: [:show, :index]

	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def show 
		@comment = Comment.find(params[:id])

	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to @comment
		end
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to @comment
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to comments_url
	end


	private

	def comment_params
		params.require(:comment).permit(:title, :body, :image)
	end

end
