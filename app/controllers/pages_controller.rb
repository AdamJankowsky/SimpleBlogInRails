class PagesController < ApplicationController
  before_filter :authorize_admin, except: [:show]
  def new

  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:success] = 'Created new page'
      return redirect_to @page
    end
    flash[:error] = 'Could not save'
    redirect_to '/'
  end

  def show
    @page = Page.find(params[:id])
  end

  def index
    @pages = Page.all
  end

  def edit
    @new_page = Page.find(params[:id])
    render 'new'
  end
  def update
    p = Page.find(params[:id])
    p.update_attributes page_params
    redirect_to p
  end

  def destroy
    p = Page.find(params[:id])
    p.destroy
    redirect_to pages_path
  end


private
  def page_params
    params.require(:new_page).permit(:body, :name, :title)
  end

end
