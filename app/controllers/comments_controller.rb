class CommentsController < ApplicationController
	before_action :find_post


	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to root_path, notice: "You commentted the hell outta the post😁!"
		else
			render root_path, alert: "Something went horribly wrong. Try again😱!"
		end
  end

	def destroy
		@comment = @post.comments.find(params[:id])

		@comment.destroy
		redirect_to root_path, notice: "Comment destroyed successfully!"
	end

	private

	def find_post
		@post = Post.find(params[:post_id])
	end

	def comment_params
		params.require(:comment).permit(:content)
	end
end
