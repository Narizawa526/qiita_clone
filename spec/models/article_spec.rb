require "rails_helper"

RSpec.describe Article, type: :model do
  context "title、bodyが指定されているとき" do
    let(:article){build(:article)}
    it "投稿される" do 
      expect(article).to be_valid
    end
  end
end
