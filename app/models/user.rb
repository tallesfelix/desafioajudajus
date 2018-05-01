class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :causes
  belongs_to :lawyer

  before_validation :create_lawyer
 # Here we creating account and assing account_id to user
  def create_lawyer
 	count = Lawyer.minimum(:causes_count) 
  	lawyer = Lawyer.find_by causes_count: count
    self.lawyer_id = lawyer.id
    lawyer.causes_count += 1
    lawyer.save
  end 

end
