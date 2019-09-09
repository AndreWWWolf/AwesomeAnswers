Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # This defines a route rule that says when we receive
  # a GET request with the URL '/', handle it with the
  # WelcomeController with the index action inside that
  # controller.
  get('/', {to: 'welcome#index', as: 'root'})

  get '/contacts/new', {to: 'contacts#new' }
  post '/contacts', {to: 'contacts#create'}

  resources :users, only: [:new, :create]

  # `resource` is singular instead of `resources`
  # Unlike `resources`, `resource` will create routes that
  # do CRUD operation on only one thing. There will be no
  # index routes, and no route will have an `:id`
  # wild card. When using a singular resource,
  # the controller must still be plural.
  resource :session, only: [:new, :create, :destroy]

  # # question new page
  # # when someone requests /questions/new it will be handled by the NEW method
  # # inside of questions controller
  # get '/questions/new', {to: 'questions#new', as: :new_question}
  # # get '/questions/:id', {to: 'questions#show', as: :question }
  #
  # # handles submission of new questions form
  # post 'questions', {to: 'questions#create', as: :questions}
  #
  # # question show page
  # # adding the alias `as: :question` will create the helper paths/url to question_path
  # # we can use these like so: question_path(<id>), question_url(<id>)
  # get '/questions/:id', {to: 'questions#show', as: :question}
  #
  # # question index page
  # get '/questions', {to: 'questions#index'}
  #
  # # question edit page
  # get '/questions/:id', {to: 'questions#edit', as: :edit_question}
  #
  # # handles submission of form on the question edit page
  # patch '/questions/:id', {to: 'questions#update'}
  #
  # delete '/questions/:id', {to: 'questions#destroy'}

  # this builds all of the above routes for us ;)
  # 'resources' method will generate all CRUD routes
  # following RESTful conventions for a resource
  # It will assume there is a controller named after the
  # first argument, pluralized and PascalCased
  resources :questions do
    # Routes written inside of a block passed to
    # a resources method will be pre-fixed by
    # a path corresponding to the passed in symbol.
    # In this case, all nested routes will be pre-fixed
    # with '/questions/:question_id'
    resources :answers, only: [:create, :destroy]
    # equivalent to:
    # resources :answers, except: [:show, :index, :new, :edit, :update]
    # question_answers_path(<question-id>),
    # question_answer_url(<question-id>)
    # question_answers_path(@question.id)
  end
end
