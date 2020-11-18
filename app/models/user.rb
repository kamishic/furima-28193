class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX, message: '：メールアドレスは@マークを入れてご入力ください。' }

  VALID_PASSWORD_REGEX = /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: '：パスワードは半角英数字混合でご入力ください。' }

  validates :nickname, presence: { message: '：ニックネームをご入力ください。' }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :lastname, presence: { message: '：姓をご入力ください。' }
  validates :lastname, format: { with: VALID_NAME_REGEX, message: '：姓は全角漢字・ひらがな・カタカナでご入力ください。' }
  validates :firstname, presence: { message: '：名をご入力ください。' }
  validates :firstname, format: { with: VALID_NAME_REGEX, message: '：名は全角漢字・ひらがな・カタカナでご入力ください。' }

  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :kana_lastname, presence: { message: '：カナ(姓)を入力してください。' }
  validates :kana_lastname, format: { with: VALID_KANA_REGEX, message: '：カナ(姓)は全角カタカナでご入力ください。' }
  validates :kana_firstname, presence: { message: '：カナ(名)を入力してください。' }
  validates :kana_firstname, format: { with: VALID_KANA_REGEX, message: '：カナ(名)は全角カタカナでご入力ください。' }

  validates :birthday, presence: { message: '：生年月日を入力してください。' }
end
