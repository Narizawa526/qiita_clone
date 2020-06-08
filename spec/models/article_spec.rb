require "rails_helper"

RSpec.describe Article, type: :model do

  context "title、bodyが指定されているとき" do
    let(:article){build(:article)}
    it "投稿される" do 
      expect(article).to be_valid
    end
  end

  context "titleが空のとき" do
    let(:article){build(:article, title: nil)}
    it "投稿されない" do 
      article.valid?
      expect(article.errors.messages[:title]).to include "can't be blank"
    end
  end

  context "bodyが空のとき" do
    let(:article){build(:article, body: nil)}
    it "投稿されない" do 
      article.valid?
      expect(article.errors.messages[:body]).to include "can't be blank"
    end
  end

end
