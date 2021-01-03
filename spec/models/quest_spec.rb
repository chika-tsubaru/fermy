require 'rails_helper'

describe Quest do
  describe '#create' do

    it "is valid with a title" do
      quest = build(:quest)
      expect(quest).to be_valid
    end

    it "is invalid without a title" do
      quest = build(:quest, title: "")
      quest.valid?
      expect(quest.errors[:title]).to include("を入力してください")
    end

  end
end