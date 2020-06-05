require 'rails_helper'

RSpec.describe User, type: :model do

  context "emailを指定しているとき" do
    it "ユーザーがつくられる" do
      user = User.new(name:"ひろあき", password:"hiroakinopass" ,email:"narizawa@testmail.com")
      expect(user).to be_valid
    end
  end

  context "emailがブランクのとき" do
    it "エラーする" do
      user = User.new(name:"ひろあき", password:"hiroakinopass" ,email:nil)
      user.valid?
      expect(user.errors.messages[:email]).to include "is invalid"
    end
  end

  context "同じemailが存在するとき" do
    it "エラーする" do
      User.create!(name:"ひろあき", password:"hiroakinopass" , email:"narizawa@testmail.com")
      user = User.new(name:"ひろあき", password:"hiroakinopass" , email:"narizawa@testmail.com")
      user.valid?
      expect(user.errors.messages[:email]).to include "has already been taken"
    end
  end


end