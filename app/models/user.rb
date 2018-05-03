class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :causes
  belongs_to :lawyer

  before_validation :create_lawyer
 # Aqui escolhemos um advogado e definimos ele para o user.lawyer_id
 # É escolhido o advogado com o menor numero de clientes do estado
  def create_lawyer
 	state = self.state
	count = Lawyer.where(state: state).minimum(:causes_count)
 	lawyer = Lawyer.find_by state: state, causes_count: count
	self.lawyer_id = lawyer.id
    lawyer.causes_count += 1
    lawyer.save
  end 

end
