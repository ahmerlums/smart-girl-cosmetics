class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new]
   before_action :require_admin, only: [:new, :index, :edit, :update, :destroy,:show]
  helper_method :create
  helper_method :destroy
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    
    @order = Order.new({:Ptype => params[:Ptype],:productID => params[:productID] || flash[:cur] , :customerID => params[:customerID] || session[:user_id], :status => "pending", :dateOrdered => Date.today ,:quantity => params[:quantity] || flash[:quan]})
    if @order.save
    redirect_to '/cart'
  else
    if (params[:customerID] == nil)
      flash[:notice] = 2
    else
    flash[:notice] = 1
    
  end
  redirect_to :back
  end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def myorders
    
  end
  def updateQuantity
    ord = Order.find(params["oid"])
    ord.quantity = params["quantity"]
    ord.Ptype = params["Ptype"]
    ord.save!
    
   respond_to do |format|
     format.json { render :show, status: :ok }
    end
    
  end
  
  def deliverOrder 
    orderList =  Order.where(customerID: params["custid"])
		 orderList.each do |order|
     order.status = "delivered"
     order.save!
   end
      
  end
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def shoppingcarts
  end
  
  def destroyItem 
    ord = Order.find(params["oid"])
    ord.destroy
    respond_to do |format|
      format.json { head :"Order was detroyed" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
    end
end
