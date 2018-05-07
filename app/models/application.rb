class Application < ApplicationRecord
  belongs_to :user
  attr_accessor :name, :url 
  validates :name, :url, presence: true 


end
