require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :user_id }
  end

  context 'associations' do
    it { is_expected.to have_many :replies }
    it { is_expected.to have_many :likes }
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :parent }
  end

  context '#root?' do
    let!(:comment)      { create(:comment) }
    let!(:comment_1)      { create(:comment, parent: comment) }
    
    it "return root?" do
      expect(comment.root?).to eq true
      expect(comment_1.root?).to eq false
    end
  end

  context '#self.root' do
    let!(:comment)      { create(:comment) }
    let!(:comment_1)      { create(:comment, parent: comment) }
    
    it "return self.root" do
      expect(Comment.root).to include comment
    end
  end

  context '#not_like_by?(user)' do
    let!(:user)      { create(:user) }
    let!(:user_1)      { create(:user) }

    let!(:comment)      { create(:comment, user: user) }
    let!(:comment_1)      { create(:comment, parent: comment, user: user_1) }

    let!(:like)      { create(:like, comment: comment, user: user) }
    
    it "return not_like_by?(user)" do
      expect(comment.not_like_by?(user)).to eq false
      expect(comment.not_like_by?(user_1)).to eq true
    end
  end

  context '#count_liked' do
    let!(:user)      { create(:user) }
    let!(:user_1)      { create(:user) }

    let!(:comment)      { create(:comment, user: user) }
    let!(:comment_1)      { create(:comment, parent: comment, user: user_1) }

    let!(:like)      { create(:like, comment: comment, user: user) }
    
    it "return count_liked" do
      expect(comment.count_liked).to eq 1
      expect(comment_1.count_liked).to eq 0
    end
  end
end