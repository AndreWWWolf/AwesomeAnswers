Rails.application.routes.draw do
  get '/questions/new', {to: "questions#new", as: :new_question}
  #new_question_path, new_question_url
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #handles submissions of new questions form
  post 'questions', {to: 'questions#create', as: :questions}

  #redirect to show page after user creates question
  get '/questions/:id', {to: "questions#show", as: :question}

  #question index page
  get '/questions', {to: 'questions#index'}

  #question edit page
  get '/questions/:id/edit', {to: 'questions#edit', as: :edit_question}

  #update action handles the submission of form from the question edit page
  patch '/questions/:id', {to: 'questions#update'}

  #delete action lets user delete the question
  delete '/questions/:id', { to: 'questions#destroy'}

  # This defines a route rule that says when we receive
  # a GET request with the URL '/', handle it with the
  # WelcomeController with the index action inside that
  # controller.
  get('/', {to: 'welcome#index', as: 'root'})

  get '/contacts/new', {to: 'contacts#new' }
  post '/contacts', {to: 'contacts#create'}
  # get '/questions/:id', {to: 'questions#show', as: :question }
end
