class Comment < ApplicationRecord
  belongs_to :post, touch: true
  belongs_to :team, touch: true

  validates :response, presence: true, length: {maximum: 500}
end
