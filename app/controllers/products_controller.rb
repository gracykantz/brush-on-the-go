class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order(rating: :desc)
    @booking = Booking.all
    # @images = Image.all
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

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save!
    # @image = Image.create!(product_id: @product.id, user_id: current_user.id, photo: @product.remote_photo_url)
    # respond_to do |format|
    #   if @product.save
    #     format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
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

  # GET /products/1/edit
  def edit
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    @booking = Booking.find_by_product_id(params[:id])
    if !@booking.nil?
      @product.errors.add(:base, 'Product cannot be modifed since booking already exist')
    end
    respond_to do |format|
      if @product.update(product_params) && @booking.nil?
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    redirect_to products_url
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
    params.require(:product).permit(:title, :description, :price, :location, :photo, user_id: current_user.id)
  end

  def review_params
    params.require(:review).permit(:content, :rating, :product_id)
  end
end
