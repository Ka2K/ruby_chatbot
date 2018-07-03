Rails.application.routes.draw do
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  end
