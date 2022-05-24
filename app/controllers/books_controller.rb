class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
 before_action :authenticate_user!, except:[:show,:index]
  # GET /books or /books.json
  def index
    @books = Book.all
  end

  def books_students
	@books = Book.all.where(:library_id => Library.select('id').where(:email => current_student.email))
	@books_all = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def checkout
    @book = Book.find(params[:id])
   # @checkout = @book
   #  if Checkout.where(:student_id => current_user.id, :book_id => @book.id, :return_date => nil).first.nil?
   #    @checkout = Checkout.new(:student_id => current_user.id,:book_id => @book.id , :issue_date => Date.today , :return_date =>nil)
      flash[:notice] = "Book Successfully Checked Out"
      puts params[:id]
      @user = current_user
      @book.save!
   # else
   #   flash[:notice] = "Book Already Checked Out!!"
   # end
   redirect_to books_path
 end

  def returnBook
    @book = Book.find(params[:id])
  end

  def list_checkedoutBooks
    @books = Book.where(id: Checkout.select('book_id').where(:return_date =>nil))
  end

  def viewBookHistory
    @checkouts = Checkout.where(:return_date => nil ).where(:book_id => params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :available)
    end
end
