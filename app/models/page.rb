class Page < ApplicationRecord

  validates :name, :title, :body, presence: true


end
