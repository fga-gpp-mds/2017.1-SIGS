Rails.application.routes.draw do

  root 'sessions#new'

  # Categories
  get 'categories/new' => 'categories#new' , as: 'categories_new'
  post 'categories/create' => 'categories#create' , as: 'categories_create'
  get 'categories/index' => 'categories#index' , as: 'categories_index'
  get 'categories/edit/:id' => 'categories#edit', as: 'categories_edit'
  patch 'categories/update/:id', controller: 'categories', action: 'update', as: 'categories_update'
  get 'categories/destroy/:id', controller: 'categories', action: 'destroy', as: 'categories_destroy'

  # Sessions
  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy'

  # User
  get 'users/index' => 'users#index', as: 'user_index'
  get 'users/new' => 'users#new' , as: 'user_new'
  post 'users/new' => 'users#create' , as:'user_create'
  get '/users/:id' => 'users#show', as: 'user'
  get 'users/edit/:id' => 'users#edit', as: 'user_edit'
  patch 'users/update/:id', controller: 'users', action: 'update', as: 'user_update'
  get 'users/destroy/:id', controller: 'users', action: 'destroy', as: 'user_destroy'

  # Coordinator

  # Department Assistant

  # Administrative Assistant
  get 'administrative_assistants/registration_request' => 'administrative_assistants#registration_request', as: 'registration_request'
  get 'administrative_assistants/enable_registration/:id' => 'administrative_assistants#enable_registration', as: 'enable_registration'
  get 'administrative_assistants/decline_registration/:id' => 'administrative_assistants#decline_registration', as: 'decline_registration'
  get 'administrative_assistants/destroy_users/:id' => 'administrative_assistants#destroy_users', as: 'destroy_users'

  # Room
  get 'rooms/index' => 'rooms#index', as: 'room_index'
  post 'rooms/index' => 'rooms#index', as: 'room_index_post'
  get 'rooms/edit/:id' => 'rooms#edit', as: 'room_edit'
  patch 'rooms/update/:id' => 'rooms#update'
  get 'rooms/show/:id' => 'rooms#show', as: 'room'
  get 'room/destroy/:id', controller: 'rooms', action: 'destroy', as: 'destroy_room'
  get 'rooms/json_of_categories_by_school_room' => 'rooms#json_of_categories_by_school_room'
  post 'rooms/filter_rooms' => 'rooms#filter_rooms', as: 'rooms_filter'

  # Course
  get 'courses/courses_by_user' => 'courses#courses_by_user', as: 'courses_by_user'

  #SchoolRooms
  get 'school_rooms/index' => 'school_rooms#index', as: 'school_rooms_index'
  get 'school_rooms/new' => 'school_rooms#new', as: 'school_rooms_new'
  post 'school_rooms/create' => 'school_rooms#create'
  get 'school_rooms/edit/:id' => 'school_rooms#edit', as: 'school_rooms_edit'
  patch 'school_rooms/update/:id', controller: 'school_rooms', action: 'update', as: 'school_rooms_update'
  post 'school_rooms/search_disciplines' => 'school_rooms#search_disciplines', as: 'search_disciplines'
  get 'school_rooms/destroy/:id', controller: 'school_rooms', action: 'destroy', as: 'destroy_school_room'
  get 'school_rooms/search_courses/:code' => 'school_rooms#search_courses', as: 'search_courses'

  # Parsers
  post "/upload_buildings", controller: 'parsers', action: 'upload_buildings'
  post "/upload", controller: 'parsers', action: 'upload_rooms'
  get "/parsers", controller: 'parsers', action: 'index', as: "index_parser"
  post "/upload_department", controller: 'parsers', action: 'upload_departments'
  post "/upload_courses", controller: 'parsers', action: 'upload_courses'
  post "/upload_disciplines", controller: 'parsers', action: 'upload_disciplines'
  #resources :parsers

  # Period
  get 'periods/index' => 'periods#index' , as: 'period_index'
  get 'periods/edit/:id' => 'periods#edit', as: 'period_edit'
  post 'periods/update' => 'periods#update', as: 'period_update'

  # Reports
  get 'reports/by_room'=> 'reports#by_room', as: 'reports_by_room'
  get 'reports/generate_by_room' => 'reports#generate_by_room', as: 'generate_by_room'
  get 'reports/json_of_rooms_by_department' => 'reports#json_of_rooms_by_department'
  get 'reports/json_of_rooms_with_parts_of_name' => 'reports#json_of_rooms_with_parts_of_name'
  post 'reports/generate_by_room' => 'reports#generate_by_room'

  # Reports School Rooms
  get 'reports_school_rooms/school_room_all' => 'reports_school_rooms#report_school_room_all', as: 'reports_school_room_all'
  get 'reports_school_rooms/school_rooms_allocated' => 'reports_school_rooms#report_school_room_allocated', as: 'reports_school_room_allocated'
  get 'reports_school_rooms/school_room_not_allocated' => 'reports_school_rooms#report_school_room_not_allocated', as: 'reports_school_room_not_allocated'
  get 'reports_school_rooms/school_room' => 'reports_school_rooms#school_reports', as: 'reports_school_room'

  #Reports by building
  get 'reports/by_building'=> 'reports#by_building', as: 'reports_by_building'
  get 'reports/generate_by_building/:id' => 'reports#generate_by_building', as: 'generate_by_building'
  post 'reports/by_building' => 'reports#by_building', as: 'reports_by_building_post'

  #Reports Disciplines
  get 'reports_disciplines/generate_by_discipline/:id' => 'reports_disciplines#generate_by_discipline', as: 'generate_by_discipline'
  get 'reports_disciplines/by_discipline' => 'reports_disciplines#by_discipline', as: 'reports_by_discipline'
  post 'reports_disciplines/by_discipline' => 'reports_disciplines#by_discipline', as: 'reports_by_discipline_post'

  # Allocation
  get 'allocations/new/:school_room_id' => 'allocations#new' , as: 'allocations_new'
  post 'allocations/create' => 'allocations#create' , as: 'allocations_create'
  post 'allocations/allocation_by_solicitation' => 'allocations#allocation_by_solicitation' , as: 'allocation_by_solicitation'
  get 'allocations/destroy/:id', controller: 'allocations', action: 'destroy', as: 'allocations_destroy'
  get 'allocations/room_allocations_by_day' => 'allocations#room_allocations_by_day', as: 'room_allocations_by_day'
  get 'allocations/destroy_all_allocation_date/:id', controller: 'allocations', action: 'destroy_all_allocation_date', as: 'allocations_destroy_all_allocation_date'
  get 'allocations/destroy_all_allocations/:id' => 'allocations#destroy_all_allocations', as: 'allocations_destroy_all_allocations'

  # allocation_extension
  get 'allocation_extensions/new' => 'allocation_extensions#new' , as: 'allocation_extensions_new'
  post 'allocation_extensions/create' => 'allocation_extensions#create' , as: 'allocation_extensions_create'

  # Extension
  post 'extensions/create' => 'extensions#create' , as: 'extensions_create'

  # Solicitation
  get 'solicitations/index' => 'solicitations#index', :as => 'solicitations_index'
  get 'solicitations/show/' => 'solicitations#show', as: 'solicitations_show'
  get 'solicitations/allocation_period/:school_room_id' => 'solicitations#allocation_period', :as => 'allocation_period'
  get 'solicitations/adjustment_period/:school_room_id' => 'solicitations#adjustment_period', :as => 'adjustment_period'
  post 'solicitations/save_allocation_period' => 'solicitations#save_allocation_period', :as => 'save_allocation_period'
  post 'solicitations/save_adjustment_period' => 'solicitations#save_adjustment_period', :as => 'save_adjustment_period'
  get 'solicitations/avaliable_rooms_by_department' => 'solicitations#avaliable_rooms_by_department', :as => 'avaliable_rooms_by_department'
  get 'solicitations/recuse_solicitation' => 'solicitations#recuse_solicitation', as: 'solicitations_recuse_solicitation'
  post 'solicitations/approve_solicitation' => 'solicitations#approve_solicitation', as: 'solicitations_approve_solicitation'

  # API Users
  get 'api_users/index' => 'api_users#index', as: 'api_users_index'
  get 'api_users/new' => 'api_users#new', as: 'api_users_new'
  post 'api_users/create' => 'api_users#create', as: 'api_users_create'
  get 'api_users/edit/:id' => 'api_users#edit', as: 'api_users_edit'
  put 'api_users/update/:id' => 'api_users#update', as: 'api_users_update'
  get 'api_users/show/:id' => 'api_users#show', as: 'api_users_show'
  get 'api_users/destroy/:id' => 'api_users#destroy', as: 'api_users_destroy'

  # API
  namespace :api, default: { format: :json }, path: '/api' do
    get 'all_rooms' => 'apis#all_rooms'
    get 'building/:code' => 'apis#buildings'
    get 'school_rooms/all' => 'apis#all_school_room'
    get 'department_allocations/:code' => 'apis#department_allocations'
    get 'discipline_allocations/:code' => 'apis#discipline_allocations'
    get 'school_rooms/all_school_rooms' => 'apis#all_school_rooms', as: 'api_all_school_rooms'
    get 'school_rooms_of_room/:code' => 'apis#school_rooms_of_room'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
