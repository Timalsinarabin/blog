class DashboardsController < ApplicationController
  def index
    @blogs = Blogpost.all
    @blogpost = Blogpost.new
  end
  def create
    @blogpost = Blogpost.new(blog_params)
    if @blogpost.save
      redirect_to dashboard_path, notice: "sucessfully posted blog"
    else
      redirect_to dashboard_path, alert: "failed to post blog"
    end
  end
  private
  def blog_params
    params.require(:blogpost).permit(:blogtitle, :blockbody)
  end
end
