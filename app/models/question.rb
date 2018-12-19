class Question < ApplicationRecord
	has_many :answer


	validates :content, :name, presence: {message:'必須項目'}
end