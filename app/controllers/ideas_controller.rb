class IdeasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :search, :show, :vote]

  def index
    @ideas = Idea.all.sort_by(&:plusminus).reverse
  end

  def search
    @ideas = Idea.search(params[:query])
    render :index
  end

  def similar
    @ideas = Idea.similar_by_title(params[:title])

    respond_to do |format|
      format.json { render :json => @ideas }
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = @idea.comments.build
  end

  def new
    @idea = Idea.new do |i|
      i.user_id = current_user.id
    end
  end

  def create
    @idea = Idea.create(params[:idea])
    unless @idea.errors.empty?
      render :new
    else
      redirect_to idea_url(@idea)
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    idea = Idea.first(:conditions => { :id => params[:id], :user_id => current_user.id })
    if idea && idea.update_attributes(params[:idea])
      flash.notice = "Idea Updated"
    else
      flash.alert = "Couldn't Update the Idea"
    end
    redirect_to idea_url(idea) and return if idea
    redirect_to ideas_url
  end

  def destroy
    idea = Idea.first(:conditions => { :id => params[:id], :user_id => current_user.id })
    if idea && idea.destroy
      flash.notice = "Idea Deleted"
    else
      flash.alert = "Idea Could not be Deleted"
    end
    redirect_to ideas_url
  end

  def vote
    Ballot.cast (current_user || SessionUser.new(session)), Idea.find(params[:id]), params[:vote]
    if request.env["HTTP_REFERER"]
      redirect_to :back
    else
      redirect_to ideas_url
    end
  end
end
