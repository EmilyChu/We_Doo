class Comment < ActiveRecord::Base
  belongs_to  :post

  validates   :blurb, presence: true
end
