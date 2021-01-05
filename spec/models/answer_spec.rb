require 'rails_helper'

describe Answer do
  describe '#create' do

    it "is valid with a plan and text" do
      answer = build(:answer)
      expect(answer).to be_valid
    end

    it "is invalid without a plan" do
      answer = build(:answer, plan: "")
      answer.valid?
      expect(answer.errors[:plan]).to include("を入力してください")
    end

    it "is invalid without a text" do
      answer = build(:answer, text: "")
      answer.valid?
      expect(answer.errors[:text]).to include("を入力してください")
    end
  end
end