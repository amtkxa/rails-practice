class Book < ApplicationRecord
  scope :constly, -> { where("price > ?", 3000)}
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%")}
end
