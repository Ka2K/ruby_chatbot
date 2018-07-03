Rails.application.routes.draw do
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  post '/friend' => 'kakao#friend_add'
  delete '/friend/:user_key' => 'kakao#friend_delete'
  delete '/chat_room/:user_key' => 'kakao#chat_room'
  end
