class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]


  def index
    @products = Product.all.order(rating: :desc)
    @booking = Booking.all
    @currentuser = current_user
    @products_mark = Product.where.not(latitude: nil, longitude: nil)
    prod_marks = @products_mark
    # Code addition for Product Filters- Added By Shalini
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query OR location ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%") # {}"title ILIKE ?", "%#{params[:query]}%")
      prod_marks = @products
      # filtermarkproducts(@products_mark, @products)
    else
      @products = Product.all.order(rating: :desc)
    end
    params[:query] = ""
    # End of Code for Product Filters
    create_markers(prod_marks)
  end

  # GET /products/new
  def new
    @product = Product.new
    @image = Image.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save!
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def create_markers(productsmark)
    @markers = productsmark.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { product: product })
      }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @booking = Booking.find_by_product_id(params[:id])
    @images = Image.find_by_product_id(params[:id])
    @product = Product.find(params[:id])
    @reviews = Review.where("product_id = ?", params[:id])
    @products_mark = Product.where("id = ?", params[:id]).where.not(latitude: nil, longitude: nil)
    create_markers(@products_mark)
    @rating = 0
    stars = 0
    @rating = 0
    if @reviews.count.positive?
      @reviews.each do |review|
        stars += review.rating
      end
      @rating = (stars / @reviews.count).round
    end
    @review = @product.reviews.build
  end

  def edit
  end

  def update
    @booking = Booking.find_by_product_id(params[:id])
    @product.update(prod_upd_params)
    redirect_to show_my_products_path
    # if !@booking.nil?
    #   @product.errors.add(:base, 'Product cannot be modifed since booking already exist')
    #   respond_to do |format|
    #     format.html { render :edit }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    # else
    #   @product.update(prod_upd_params)
    #   format.html { redirect_to show_my_products_path, notice: 'Product was successfully updated.' }
    #   format.json { render :show, status: :ok, location: @product }
    #   end
    # end
  end

  def destroy
    # Product deletion only when no booking Exist - Start of Addition
    @product = Product.find(params[:id])
    @booking = Booking.find_by_product_id(params[:id])
    if !@booking.nil?
      @product.errors.add(:base, 'Bookings exist for the Toothbrush, cannot be purged')
      respond_to do |format|
        format.html { redirect_to show_my_products_path, notice: 'Bookings exist for the Toothbrush ,cannot be purged' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    else
      @product.destroy
      redirect_to show_my_products_url
    end
    # End of Addition
  end

  def myproducts
    @products_mark = []
    @products = Product.where("user_id = ?", current_user.id)
    @products_mark = Product.where("user_id = ?", current_user.id).where.not(latitude: nil, longitude: nil)
    create_markers(@products_mark)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :description, :rating, :price, :location, :photo, user_id: current_user.id)
  end

  def prod_upd_params
    params.require(:product).permit(:description, :photo)
  end

  def review_params
    params.require(:review).permit(:content, :rating, :product_id)
  end
end
