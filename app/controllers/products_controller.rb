class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order(rating: :desc)
    @booking = Booking.all
    @images = Image.all
    @currentuser = current_user
    @products_mark = Product.where.not(latitude: nil, longitude: nil)
    @markers = @products_mark.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude
      }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @booking = Booking.find_by_product_id(params[:id])
    @image = Image.find_by_product_id(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
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
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :location, :latitude, :longitude)
  end
end
