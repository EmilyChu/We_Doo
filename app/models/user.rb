class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments, through: :posts

  has_many :votes
  has_many :dresses

  has_many :favorites

  def vote_for dress
    if votes_left > 0
      votes.create! dress_id: dress.id 
      update votes_left: votes_left - 1
    end
  end

  def favorite dress
    favorites.create! dress_id: dress.id
  end

  def unfavorite dress 
    x = Favorite.find_by(dress_id: dress.id)
    x.delete

  end
end
