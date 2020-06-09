require "rails_helper"

RSpec.describe Comment, type: :model do

  describe "正常系のテスト" do
  
    context "bodyが指定されたとき" do
      let(:comment){build(:comment)}

      it "投稿できる" do
        expect(comment).to be_valid
      end
    end
  
  end

  describe "異常系のテスト" do
  
    context "bodyが指定されていないとき" do
      let(:comment){build(:comment, body: nil)}
    
      it "エラーする" do
        comment.valid?
        expect(comment.errors.messages[:body]).to include "can't be blank"
      end
    end
  
  end
end
