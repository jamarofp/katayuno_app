class KatasController < ApplicationController
  def index
    @kata = Kata.all.first
  end

  def show
    @kata = Kata.all.first
  end
end
