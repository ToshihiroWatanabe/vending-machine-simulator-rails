Rails.application.routes.draw do
  root 'vending_machine#index'
  post 'insert/:money_type', to: 'vending_machine#insert'
  get 'admin', to: 'vending_machine#admin'
end
