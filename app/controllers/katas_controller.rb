class KatasController < ApplicationController
  def index
    @katas = Kata.all
  end

  def show
    @kata = Kata.find(params[:id])
  end

  def new
  end

  def create
    kata = Kata.new(
      title: params[:title],
      description: params[:description]
      )

    if kata.save
      redirect_to kata_path(kata.id)
    else
      render :new
    end
  end

  def edit
    @kata = Kata.find(params[:id])
  end

  def update
    @kata = Kata.find(params[:id])
    p params
    @kata.title = params[:kata][:title]
    @kata.description = params[:kata][:description]


    if @kata.save
      redirect_to kata_path(@kata.id)
    else
      render :edit
    end
  end

  def delete
    @kata = Kata.find(params[:id])
    @kata.destroy

    redirect_to root_path
  end
end
