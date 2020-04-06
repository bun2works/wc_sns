class Post < ApplicationRecord
  belongs_to :team
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {maximum: 50}
  validates :body, presence: true, length: {maximum: 1000}

end
