class TotosController < ApplicationController
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
    @toto = Toto.find(params[:id])
  end

  private
  def toto_params
    params.require(:toto).permit(:name, :description)
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
