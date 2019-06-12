class BookingsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @image = Image.find_by_product_id(params[:product_id])
    @booking = Booking.new
  end

  def create
    @product = Product.find(params[:product_id])
    @booking = Booking.new(booking_params)
    @booking.amount = calculate_amount(@booking, @product)
    @currbook = Booking.where(['fromdate BETWEEN ? AND ? AND product_id = ?', @booking.fromdate, @booking.todate, @product.id])
    if !@currbook.first.nil?
      @booking.errors.add(:base, 'Booking already exist for the selected dates, select alternative')
      render 'new'
    else
      @booking.product = @product
      @booking.user = current_user
      if @booking.save
        redirect_to product_booking_path(@product.id, @booking.id)
      else
        render 'new'
      end
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @product = Product.find(params[:product_id])
    @image = Image.find_by_product_id(@product.id)
  end

  def update
    @booking = Booking.find(params[:id])
    @product = Product.find(@booking.product_id)
    @booking.update(booking_params)
    @amount = calculate_amount(@booking, @product)
    @booking.update(amount: @amount)
    redirect_to product_booking_path(@product, @booking)
  end

  def calculate_amount(booking, product)
    bookdays = booking.todate - booking.fromdate
    if bookdays.zero?
      bookamount = product.price
    elsif bookdays.positive?
      bookamount = product.price * bookdays
    end
    return bookamount
  end

  def show
    @product = Product.find(params[:product_id])
    @bookings = Booking.where('product_id = ?', params[:product_id])
    @image = Image.find_by_product_id(@product.id)
    @user = current_user
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy!
    respond_to do |format|
      format.html { redirect_to product_booking_url, notice: 'Booking was successfully deleted.' }
      format.json { head :no_content }
      # redirect_to product_booking_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:fromdate, :todate, :amount)
  end
end
