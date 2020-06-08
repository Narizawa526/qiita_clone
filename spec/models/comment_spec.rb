require "rails_helper"

RSpec.describe Comment, type: :model do

  context "commentが指定されたとき" do
    let(:comment){build(:comment)}
    it "投稿される" do
      expect(comment).to be_valid
    end
  end

  context "commentが指定されていないとき" do
    let(:comment){build(:comment, body: nil)}
    it "投稿されない" do
      comment.valid?
      expect(comment.errors.messages[:body]).to include "can't be blank"
    end
  end


end
