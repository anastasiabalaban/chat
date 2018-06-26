class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'comments_channel'
  end

  def send_comment(data)
    Comment.create(body: data['comment'], article_id: data['article_id'], user_id: current_user.id)
    # current_user.comments.create(body: data['comment'], article_id: data['article_id'])
  end
end
