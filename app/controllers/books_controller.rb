class BooksController < ApplicationController
class PagesController < ApplicationController

  def index
  	@books = Book.all
  end
  def new
  	@book =Book.new
  end 
  def edit
  end
  def create
  	@book=Book.new(book_params)

  	respond_to do |format |
  	  if @book.save
  		format.html { redirect_to @book, notice 'Book was succesfully createrd.'}
  		format.json {render :show, status: :created, location: @book }
  	  else 
  		format.html [render :new]
  		format.json { render json: @post.errors, status: :unprossable_enity}
  	end
   end
  end

  def show
  end
  def update
  	respond_to do |format |
  	  if @book.update(book_params)
  		format.html { redirect_to @book, notice 'Book was succesfully createrd.'}
  		format.json {render :show, status: :ok, location: @book }
  	  else 
  		format.html [render :edit]
  		format.json { render json: @post.errors, status: :unprossable_enity}
  	end
   end
  end
  def destroy
  	@book.destroy
  	respond_to do |format |
  	   
  		format.html { redirect_to book_url, notice 'Book was succesfully destroyed.'}
  		format.json { head :no_content }
  end 
end


def private
	def set_book
		@book= Book.find(params[:id])
	end

  def book_params
  	params.require(:book).permit(:user_id, :name, :description)
end
end
