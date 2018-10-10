class TotosController < ApplicationController

  before_action :set_toto, only: [:edit, :show, :update, :destroy]

  def new
    @toto = Toto.new
  end

  def create
    @toto = Toto.new(toto_params)
    if @toto.save
      flash[:notice] = "Todo is created successfully"
      redirect_to toto_path(@toto)
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

    if @toto.update(toto_params)
      flash[:notice] = "Toto was successfully updated"
       redirect_to toto_path(@toto)
    else
      render 'edit'
    end
  end

  def index
    @totos = Toto.all
  end

  def destroy

    @toto.destroy
    flash[:notice] = "Toto was deleted successfully"
    redirect_to totos_path
  end
  private
  def toto_params
    params.require(:toto).permit(:name, :description)
  end

  def set_toto
    @toto = Toto.find(params[:id])
  end
end
=begin
def create
  @toto = Toto.create(totos_params)
  if @toto.save
    flash[:notice] = "Toto is created successfully"
    redirect_to toto_path(@toto)
  else
    render 'new'
  end
end

def show
  @toto = Toto.find(params[:id])
end

private
def totos_params
  params.require(:toto).permit(:name, :description)
end
=end
