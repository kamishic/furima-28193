class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)/
  validates :password,format: {with: VALID_PASSWORD_REGEX ,message: '：パスワードは半角英数字を混合で６文字以上でご入力ください。' }

  validates :nickname, presence: { message: '：ニックネームをご入力ください' }
  
  VALID_NAME_REGEX = /\A[ぁ-ゔァ-ヴ一-龥]/
  validates :lastname, presence: { message: '：姓をご入力ください' }
  validates :lastname,format: {with: VALID_NAME_REGEX ,message: '：姓は全角漢字・ひらがな・カタカナでご入力下さい。' }
  validates :firstname, presence: { message: '：名を入力してください' }
  validates :firstname,format: {with: VALID_NAME_REGEX ,message: '：名は全角漢字・ひらがな・カタカナでご入力下さい。' }

  VALID_KANA_REGEX = /\A[ァ-ヴ]/
  validates :kana_lastname, presence: { message: '：カナ(姓)を入力してください' }
  validates :kana_lastname,format: {with: VALID_KANA_REGEX ,message: '：カナ(姓)は全角カタカナでご入力下さい。' }
  validates :kana_firstname, presence: { message: '：カナ(名)を入力してください' }
  validates :kana_firstname,format: {with: VALID_KANA_REGEX ,message: '：カナ(名)は全角カタカナでご入力下さい。' }

  validates :birthday, presence: { message: '：生年月日を入力してください' }

end
