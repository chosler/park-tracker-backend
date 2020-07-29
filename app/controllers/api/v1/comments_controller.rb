class Api::V1::CommentsController < ApplicationController

    def index
        comments=Comment.all
        render json: comments
    end

    def create
        comment = Comment.new(comment_params)
        comment.save!
        # options = {include: [:user, :park]}
        render json: CommentSerializer.new(comment)
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :park_id, :comment_content)
    end
end
