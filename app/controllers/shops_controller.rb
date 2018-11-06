class ShopsController < ApplicationController

  # GET /shops
  # GET /shops.json
  def index
    user = User.find(params[:user_id])
    @shops = user.shop
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    user = User.find(params[:user_id])
    @shop = user.shop    
  end

  # GET /shops/new
  def new
    user = User.find(params[:user_id])
    @shop = Shop.new
    user.shop = @shop
  end

  # GET /shops/1/edit
  def edit
    user = User.find(params[:user_id])
    @shop = user.shop
  end

  # POST /shops
  # POST /shops.json
  def create
    user = User.find(params[:user_id])
    @shop = user.shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to [@shop.user, @shop], notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    user = User.find(params[:user_id])
    @shop = user.shop
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to [@shop.user, @shop], notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    user = User.find(params[:user_id])
    @shop = user.shop
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to user_shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name)
    end
end
