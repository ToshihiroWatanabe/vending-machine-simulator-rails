Rails.application.routes.draw do
  root 'vending_machine#index'
  get 'admin', to: 'vending_machine#admin'
end
