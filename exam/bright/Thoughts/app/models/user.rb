class User < ActiveRecord::Base
  has_secure_password
  has_many :likes
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea


  before_save :downcase_fields
  
  validates :name, :alias, presence: true, length: 2..30
  validates_format_of :alias, with: /\A[-a-z]+\Z/i
  validates :email, presence: true, length: 2..30
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


  def downcase_fields
    self.name.downcase!
    self.alias.downcase!
    self.email.downcase!
  end
end
