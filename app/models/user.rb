class User < ApplicationRecord
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  def self.search(method,word)
		if method == "forward_match"
			
		@users = User.where("name LIKE?","#{word}%")
		
		elsif method == "backward_match"
			
		@users = User.where("name LIKE?","%#{word}")
		
		elsif method == "perfect_match"
		@users = User.where("#{word}")
		
		elsif method == "partial_match"
			
		@users = User.where(" LIKE?","%#{word}%")
		else
			
		@users = User.all
  		end
  end
   end
