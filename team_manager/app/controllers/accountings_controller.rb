class AccountingsController < ApplicationController
  def new
    @accounting = Accounting.new
  end
  def create
    @accounting = Accounting.new(accounting_params)
    if @accounting.save
      redirect_to @accounting
    else
      render 'new'
    end
  end
  def index
    @accountings= Accounting.all
  end
  def show
    @accounting = Accounting.find(params[:id])
  end
  def edit
    @accounting = Accounting.find(params[:id])
  end
  def update
    @accounting = Accounting.find(params[:id])
    if @accounting.update(accounting_params)
      redirect_to @accounting
    else
      render 'edit'
    end
  end
  def destroy
    @accounting = Accounting.find(params[:id])
    @accounting.destroy
    redirect_to accountings_path
  end

  private
    def accounting_params
      params.require(:accounting).permit(:title, :name, :purpose, :application_date, :status)
    end
end


