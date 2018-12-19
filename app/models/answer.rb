class Answer < ApplicationRecord
	belongs_to :question


	validates :content, :name, presence: {message:'必須項目'}
end