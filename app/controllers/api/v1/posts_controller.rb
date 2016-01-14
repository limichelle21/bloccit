class Api::V1::PostsController < Api::V1::BaseController

	before_action :authenticate_user, except: [:index, :show]
	before_action :authorize_user, except: [:index, :show]


	def update
		post = Post.find(params[:id])
		if post.update_attributes(post_params)
			render json: post.to_json, status: 200
		else
			render json: {error: "Post update failed", status: 400}, status: 400
		end
	end

	def create
		topic = Topic.find(params[:topic_id])
		post = topic.posts.build(post_params)
		if post.valid?
			post.save!
			render json: post.to_json, status: 201
		else
			render json: {error: "Post creation failed", status: 400}, status: 400
		end
	end

	def destroy
		post = Post.find(params[:id])

		if post.destroy
			render json: {message: "Post deleted", status: 200}, status: 200
		else
			render json: {error: "Post delete failed", status: 400}, status: 400
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
		end
	end
