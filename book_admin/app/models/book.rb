class Book < ApplicationRecord
  # enum型の定義
  enum status: {reservation: 0, now_on_sale: 1, end_of_point: 2}

  # スコープ
  scope :constly, -> { where("price > ?", 3000)}
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%")}

  # リレーション
  belongs_to :publisher
  has_many :book_authors
  has_many :authers, through: :book_authors

  # バリデーション
  validates :name, presence: true
  validates :name, length: { maximum: 15 }
  validates :price, numericality: { greater_than_or_equal_to: 0}
  validate do |book|
    if book.name.include?("exercise")
      book.errors[name] << "I don't like exercise."
    end
  end

  # コールバック
  before_validation do |book|
    book.name = book.name.gsub(/Cat/) do |matched|
      "lovery #{matched}"
    end
  end
  after_destroy do |book|
    Rails.logger.info "Book is deleted: #{book.attributes.inspect}"
  end

end
