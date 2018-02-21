class GameController < ApplicationController
  def try
    @guess = params[:guess].to_i
    session[:secret] ||= rand(10)
    @secret = session[:secret]
    session[:counter] ||= 1
    @counter = session[:counter]
    @result
      if @guess == @secret
        @result = "You win!"
        session[:secret] = nil
        session[:counter] = nil
      elsif @guess > @secret
        @result = "Too High, guess again!"
        session[:counter] += 1
      elsif @guess < @secret
        @result = "Too Low, guess again!"
        session[:counter] += 1
      end
    render "try.html.erb"
  end
end
