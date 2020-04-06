class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :team

  validates :response, presence: true, length: {maximum: 500}
end
