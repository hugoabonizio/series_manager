class WelcomeController < ApplicationController
  def index
		@series_blocks = Serie.order("RAND()").limit(12).each_slice(4).to_a
  end
end
