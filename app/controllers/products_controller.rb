class ProductsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product }
    end

#    @buyer = User.find(current_user.id)
    @seller = User.find(@product.user_id)
    
    #Notifier.contact(current_user, @seller).deliver
    #if :number_to_send_to
      #number_to_send_to = params[:number_to_send_to]
   
        twilio_sid = "AC5182ac157f5e233236895fdf7f6fb13e"
        twilio_token = "8908add88cc108e96a5ba2bb9f07dc8a"
        twilio_phone_number = "9095095459"
   
        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
   
        @twilio_client.account.sms.messages.create(
          :from => "+1#{twilio_phone_number}",
          :to => 3038191234,
          :body => "So and so would like to buy your blah #{number_to_send_to}"
      )
    #end

  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product }

      redirect_to root_path
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(params[:product])

    p params
    #respond_to do |format|

      if @product.save
        #format.html { redirect_to @product, :notice => 'Product was successfully created.' }
        #format.json { render :json => @product, :status => :created, :location => @product }
        flash[:success] = "You posted #{@product.title}!"
        redirect_to root_url
      else
        @feed_items = []
        #format.html { render :action => "new" }
        #format.json { render :json => @product.errors, :status => :unprocessable_entity }
        flash[:error] = "Your item must have a description."
        redirect_to root_url
      end

    #end

  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
   
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice => 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
    #redirect_to current_user
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to current_user
    #respond_to do |format|
      #format.html { redirect_to @user }
    #end

  end

end
