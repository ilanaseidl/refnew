Rails.application.routes.draw do

  root 'newsletter#sign_up'

  get 'referrals/index', to: 'referrals#index'
  get 'newsletter/sign_up/(:id)', to: 'newsletter#sign_up'
  post 'newsletter/sign_up/(:id)', to: 'newsletter#submit'
  get 'newsletter/success/(:id)', to: 'newsletter#success'

end
