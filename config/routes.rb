Rails.application.routes.draw do
  root 'vending_machine#index'
  post 'insert/:moneyType', to: 'vending_machine#insert'
  get 'admin', to: 'vending_machine#admin'
end
