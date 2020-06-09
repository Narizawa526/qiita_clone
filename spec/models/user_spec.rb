require "rails_helper"

RSpec.describe User, type: :model do
  describe "正常系のテスト" do
    context "email,name,passwordを指定しているとき" do
      let(:user) { create(:user) }

      it "ユーザーを作成できる" do
        expect(user).to be_valid
      end
    end
  end

  describe "異常系のテスト" do
    context "email,name,passwordがブランクのとき" do
      let(:user) { build(:user, email: nil, name: nil, password: nil) }

      it "emailがブランクのときエラーする" do
        user.valid?
        expect(user.errors.messages[:email]).to include "is invalid"
      end

      it "nameがブランクのときエラーする" do
        user.valid?
        expect(user.errors.messages[:name]).to include "can't be blank"
      end

      it "passwordがブランクのときエラーする" do
        user.valid?
        expect(user.errors.messages[:encrypted_password]).to include "can't be blank"
      end
    end

    context "同じemailの値が存在するとき" do
      before do
        create(:user, email: "hiroakinomail@test.com")
      end

      let(:user) { build(:user, email: "hiroakinomail@test.com") }

      it "エラーする" do
        user.valid?
        expect(user.errors.messages[:email]).to include "has already been taken"
      end
    end

    context "文字列がメールアドレスではないとき" do
      let(:user) { build(:user, email: "hiroakinomail") }

      it "エラーする" do
        user.valid?
        expect(user.errors.messages[:email]).to include "is not an email"
      end
    end
  end
end
