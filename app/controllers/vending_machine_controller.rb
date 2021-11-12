class VendingMachineController < ActionController::Base
  def index
    @item_stocks = ItemStock.joins(product: :temperature)
                            .select('item_stocks.*, products.name, products.price, temperatures.name AS temperature')
    @money_stock = MoneyStock.first
    render action: :index
  end

  def insert
    money_type = params[:money_type].to_i
    money_stock = MoneyStock.first

    puts money_stock.inspect

    # 投入金額が9999円を超えるなら投入しない
    return if money_stock[:deposit] + money_type > 9999

    # 同じ硬貨は20枚を超えて投入できない
    return if money_stock["deposit_#{money_type}".to_sym] >= 20

    # 更新
    money_stock[:deposit] += money_type
    money_stock["stock_#{money_type}".to_sym] += 1
    money_stock.save
    redirect_to '/'
  end

  def admin
    render action: :admin
  end
end
