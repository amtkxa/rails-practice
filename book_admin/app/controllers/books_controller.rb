class BooksController < ApplicationController
  # 前処理
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  @book = Book.find(params[:id])
  respond_to do |format|
    format.html
    format.csv
    format.json
  end

  # Bookモデルのインスタンスを変数に代入する
  private
  def set_books
    @book = Book.find(param[:id])
  end
end
