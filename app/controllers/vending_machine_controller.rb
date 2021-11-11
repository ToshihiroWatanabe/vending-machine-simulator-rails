class VendingMachineController < ActionController::Base
  def index
    render action: :index
  end

  def admin
    render action: :admin
  end
end
