class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
