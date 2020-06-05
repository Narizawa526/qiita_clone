require 'rails_helper'

RSpec.describe User, type: :model do

  context "emailを指定しているとき" do
    it "ユーザーがつくられる" do
      user = create(:user)
      expect(user).to be_valid
    end
  end

  context "emailがブランクのとき" do
    it "エラーする" do
      user = build(:user , email: nil )
      user.valid?
      expect(user.errors.messages[:email]).to include "is invalid"
    end
  end

  context "同じemailが存在するとき" do
    it "エラーする" do
      create(:user , email: "hiroakinomail@test.com")
      user = build(:user ,email: "hiroakinomail@test.com")
      user.valid?
      expect(user.errors.messages[:email]).to include "has already been taken"
    end
  end

  context "文字列が,メールアドレスではないとき" do
    it "エラーする" do
      user = build(:user, email:"hiroakinomail" )
      user.valid?
      expect(user.errors.messages[:email]).to include "is not an email"
    end
  end

end