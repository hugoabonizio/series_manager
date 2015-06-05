class WelcomeController < ApplicationController
  def index
		@series = Serie.order("RAND()").limit(4)
  end
end
