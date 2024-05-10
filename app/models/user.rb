class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶー一-龠]+\z/.freeze
  validates :firstname_kanji, presence: true, format: { with: VALID_NAME_REGEX }
  validates :lastname_kanji, presence: true, format: { with: VALID_NAME_REGEX }

  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー]+\z/.freeze
  validates :firstname_katakana, presence: true, format: { with: VALID_KANA_NAME_REGEX }
  validates :lastname_katakana, presence: true, format: { with: VALID_KANA_NAME_REGEX }
  
  validates :birth_day, presence: true
  validates :nickname, presence: true

end
