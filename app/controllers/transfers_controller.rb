class TransfersController < ApplicationController
  def index
    @transfer = Transfer.new
  end
end
