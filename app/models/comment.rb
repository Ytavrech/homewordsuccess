class Comment < ApplicationRecord
  has_many :comments
  validates :commenter, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
