class PageController < ApplicationController
  before_filter :authenticate_user!
  # before_action :set_factor

  def parse
  	a = JSON.parse(user_params[:user][:json])
    


  end


private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = user.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:json)
    end

end
