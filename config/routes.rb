Rails.application.routes.draw do
  get 'scrapings/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'accueil', to: 'static_pages#home', as: 'home'
  get 'agence', to: 'static_pages#agency', as: 'agency'
  get 'services', to: 'static_pages#services'
  get 'mentions-legales', to: 'static_pages#legal_notice', as: 'legal_notice'
  get 'politique-de-confidentialite', to: 'static_pages#privacy_policy', as: 'privacy_policy'
  get 'site-sur-mesure', to: 'static_pages#custom_website', as: 'custom_website'
  get 'site-pre-construit', to: 'static_pages#prebuilt_website', as: 'prebuilt_website'
  get 'marketing-digital', to: 'static_pages#digital_marketing', as: 'digital_marketing'
  get 'referencement-seo', to: 'static_pages#seo', as: 'seo'
  get 'bornes-tactile', to: 'static_pages#touch_terminal', as: 'touch_terminal'

  get 'contact', to: 'contacts#new', as: 'new_contact'
  post 'contact', to: 'contacts#create', as: 'create_contact'
  get 'contacts/:id', to: 'contacts#show', as: 'contact'

  namespace :admin do
    resources :contacts, only: [:index]
  end

  resources :scrapings, only: [:index]

  post 'admin/contacts/send_prospect_emails', to: 'admin/contacts#send_prospect_emails', as: 'send_prospect_emails'
  get 'admin/contacts/send_prospect_emails', to: 'admin/contacts#send_prospect_emails', as: 'prospect_emails_sent'
  # get 'admin/contacts/prospect_emails_sent', to: 'admin/contacts#prospect_emails_sent', as: 'prospect_emails_sent'
end
