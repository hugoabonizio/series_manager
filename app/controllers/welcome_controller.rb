class WelcomeController < ApplicationController
  def index
		@series = Serie.order("RAND()").limit(20)
  end
end
