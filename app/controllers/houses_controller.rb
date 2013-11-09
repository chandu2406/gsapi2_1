class HousesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
    # respond_to do |format|
    @house.user_id = current_user.id
    puts current_user.inspect
      if @house.save
        render json: {:success => true}
        # render action: 'show', status: :created, location: @house
        # format.html { redirect_to @house, notice: 'House was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @house }
      else
        render json: @house.errors, status: :unprocessable_entity 
        # format.html { render action: 'new' }
        # format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update_address
    # respond_to do |format|
    @house = House.find_by(house_id: params[:house][:house_id],user_id: current_user.id)
    puts "*"*100
    puts @house.inspect
    puts "*"*100
      if @house.update(house_params)
        render json: {success: true}
        # format.html { redirect_to @house, notice: 'House was successfully updated.' }
        # format.json { head :no_content }
      else
        render json: @house.errors, status: :unprocessable_entity 
        # format.html { render action: 'edit' }
        # format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    # end
  end

  #----------------------------Make the notes--------------------------------#
  def update_notes
    # respond_to do |format|
    @house = House.find_by house_id: params[:house][:house_id], user_id: current_user.id
    puts @house.Notes
    @house.Notes = params[:house][:Notes]
      # @house = House.where("house_id = ? and user_id = ?",params[:house_id])
      if @house.save
        # format.html { redirect_to @house, notice: 'House was successfully updated.' }
        # format.json { head :no_content }
        render json: {success: true}
      else
        render json: @house.errors, status: :unprocessable_entity 
        # format.html { render action: 'edit' }
        # format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    # end
  end

  def update_contact
    # respond_to do |format|
    @house = House.find_by house_id: params[:house][:house_id], user_id: current_user.id
    # puts @house.inspect
    # puts "*"*100
    # puts params[:house][:phone]
    # puts @house.contact
    @house.contact = params[:house][:phone]
    @house.email = params[:house][:email]
      # @house = House.where("house_id = ? and user_id = ?",params[:house_id])
      if @house.save
        # format.html { redirect_to @house, notice: 'House was successfully updated.' }
        # format.json { head :no_content }
        render json: {success: true}
      else
        render json: @house.errors, status: :unprocessable_entity 
        # format.html { render action: 'edit' }
        # format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    # end
  end


  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:country, :state, :city, :addl1, :addl2, :unit, :zip , :label , :street ,:Notes , :house_id, :phone, :email)
    end
end
