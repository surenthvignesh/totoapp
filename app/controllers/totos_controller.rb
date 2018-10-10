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

  def edit
    @toto = Toto.find(params[:id])
  end

  def update
    @toto = Toto.find(params[:id])
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
    @toto = Toto.find(params[:id])
    @toto.destroy
    flash[:notice] = "Toto was deleted successfully"
    redirect_to totos_path
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
