class VendingMachineController < ActionController::Base
  def index
    @item_stocks = ItemStock.joins(product: :temperature)
                            .select('item_stocks.*, products.name, products.price, temperatures.name AS temperature')
    @money_stock = MoneyStock.first
    render action: :index
  end

  def insert
    puts('insert ' + params[:moneyType])
    money_stock = MoneyStock.first
    # 投入金額が9999円を超えるなら投入しない
    if money_stock[:deposit] + params[:moneyType].to_i > 9999
      redirect_to '/'
      return
    end
    # 同じ硬貨は20枚を超えて投入できない
    if money_stock[('stock_' + params[:moneyType].to_s).to_sym] >= 20
      redirect_to '/'
      return
    end
    redirect_to '/'
  end

  def admin
    render action: :admin
  end
end
