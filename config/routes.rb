Rails.application.routes.draw do
  root 'newsletter#sign_up'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'newsletter/sign_up/(:id)', to: 'newsletter#sign_up'
  post 'newsletter/sign_up/(:id)', to: 'newsletter#submit'
  get 'newsletter/success/(:id)', to: 'newsletter#success'

end
