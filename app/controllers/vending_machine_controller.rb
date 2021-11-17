class VendingMachineController < ActionController::Base
  def index
    @item_stocks = ItemStock.joins(product: :temperature)
                            .select('item_stocks.*, products.name, products.price, temperatures.name AS temperature').order(:id)
    @money_stock = MoneyStock.first
    render action: :index
  end

  def insert
    money_type = params[:money_type].to_i
    money_stock = MoneyStock.first
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
    # TODO: 一度でも商品が購入されている時
    # 一度も商品が購入されていない時
    money_stock[:deposit] = 0
    [10, 50, 100, 500, 1000].each do |money_type|
      money_stock["stock_#{money_type}".to_sym] -= money_stock["deposit_#{money_type}".to_sym]
      money_stock["deposit_#{money_type}".to_sym] = 0
    end
    money_stock.save
    redirect_to '/'
  end

  def purchase
    item = ItemStock.joins(:product)
                    .select('item_stocks.*, products.price')
                    .where(id: params[:id].to_i).first
    money_stock = MoneyStock.first
    money_stock[:deposit] -= item[:price]
    [10, 50, 100, 500, 1000].each do |money_type|
      money_stock["deposit_#{money_type}".to_sym] = 0
    end
    money_stock.save
    # 商品の残り数を減らす
    item = ItemStock.where(id: params[:id].to_i).first
    item[:quantity] -= 1
    item.save
    # TODO: 販売履歴に記録する
    redirect_to '/'
  end

  def admin
    render action: :admin
  end
end
