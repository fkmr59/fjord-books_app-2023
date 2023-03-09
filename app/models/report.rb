class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :imageable, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
