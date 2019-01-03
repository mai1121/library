class Post < ApplicationRecord
  belongs_to :user, optional: true
  validates :author, :title, :quote, presence: true 
end
