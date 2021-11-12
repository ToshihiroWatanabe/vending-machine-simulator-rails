class VendingMachineController < ActionController::Base
  def index
    @item_stocks = ItemStock.joins(product: :temperature)
                            .select('item_stocks.*, products.name, products.price, temperatures.name AS temperature')
    @money_stock = MoneyStock.first
    render action: :index
  end

  def admin
    render action: :admin
  end
end
