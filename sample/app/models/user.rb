class User < ApplicationRecord

  # セーブ前にemailを全て小文字にする
  before_save {email.downcase!}
  # before_save {self.email = email.downcase}

  # validateの検証
  validates(
    :name,
    presence:true,
    length:{maximum: 50}
  )

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(
    :email,
    presence:true,
    length:{maximum: 255},
    format:{with:VALID_EMAIL_REGEX},
    uniqueness:{case_sensitive:false},
    # uniqueness:true
    # ↑では大文字小文字を区別しない
  )

  # セキュアなパスワードの作成
  has_secure_password
  validates(
    :password,
    presence:true,
    length:{minimum:6}
  )

  end
