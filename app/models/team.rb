class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length: {maximum: 30}, uniqueness: true
  validates :representative, presence: true, length: {maximum: 20}
  validates :homepage, length: {maximum: 100}
  validates :location_and_day, presence: true, length: {maximum: 50}
  validates :introduction, presence: true, length: {maximum: 100}
  validate :image_check

  def image_check
    if image.present?
      unless image.content_type.in?(%(image/jpeg image/png))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください。')
      end
    end
  end

end
