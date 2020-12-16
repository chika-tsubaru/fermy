class Answer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :quest, dependent: :destroy
  validates :plan, presence: true
  validates :text, presence: true
end
