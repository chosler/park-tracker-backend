class CommentSerializer
    include FastJsonapi::ObjectSerializer
    attributes :user_id, :park_id, :comment_content
    belongs_to :user
    belongs_to :park
  end