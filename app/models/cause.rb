class Cause < ApplicationRecord
	belongs_to :user
	belongs_to :lawyer
end
