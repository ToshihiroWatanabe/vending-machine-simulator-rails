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

    money_stock[:deposit] += money_type
    money_stock["deposit_#{money_type}".to_sym] += 1
    money_stock["stock_#{money_type}".to_sym] += 1
    money_stock.save
    redirect_to '/'
  end

  def release
    money_stock = MoneyStock.first
    # 一度も商品が購入されていない時
    money_stock[:deposit] = 0
    money_stock[:stock_10] -= money_stock[:deposit_10]
    money_stock[:deposit_10] = 0
    money_stock[:stock_50] -= money_stock[:deposit_50]
    money_stock[:deposit_50] = 0
    money_stock[:stock_100] -= money_stock[:deposit_100]
    money_stock[:deposit_100] = 0
    money_stock[:stock_500] -= money_stock[:deposit_500]
    money_stock[:deposit_500] = 0
    money_stock[:stock_1000] -= money_stock[:deposit_1000]
    money_stock[:deposit_1000] = 0
    money_stock.save
    redirect_to '/'
  end

  def admin
    render action: :admin
  end
end
