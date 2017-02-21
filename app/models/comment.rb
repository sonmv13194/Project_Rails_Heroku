class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates  :content,presence:true, length:{ minimum:1}
end
