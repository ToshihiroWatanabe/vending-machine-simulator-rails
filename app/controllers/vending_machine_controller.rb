class VendingMachineController < ActionController::Base
  def index
    @money_stock = MoneyStock.first
    render action: :index
  end

  def admin
    render action: :admin
  end
end
