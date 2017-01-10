class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早啊～～～"
  end
end
