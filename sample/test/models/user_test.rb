require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

# 新しいUserインスタンス設定
  def setup
    @user = User.new(name:"Example User",email:"user@example.com")
  end

# @userが使用可能か検証
  test "should be valid" do
    assert @user.valid?
  end

# 存在性の検証
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

# データ長の検証
test "name should not be too long over 50" do
  @user.name = "a"*51
  assert_not @user.valid?
end
test "email should not be too long over 256" do
  @user.email = "a"*244 + "@example.com"
  assert_not @user.valid?
end

# メールフォーマットの検証
test "email validation should accept valid addresses" do
  valid_addresses = %w[user@example.com USER@foo.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
  valid_addresses.each do |valid_address|
    @user.email = valid_address
    assert @user.valid?,"#{valid_address.inspect} should be valid"
  end
end


end
