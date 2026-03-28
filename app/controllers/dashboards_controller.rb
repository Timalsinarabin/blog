class DashboardsController < ApplicationController
  def index
    if params[:search]
      @blogs = Blogpost.where("blogtitle like ?", "%#{params[:search]}%")
    else
      @blogs = Blogpost.order(created_at: :desc)
    end
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
  def destroy
    @post = Blogpost.find(params[:id])
    if @post.destroy
      redirect_to dashboard_path, notice: "sucessfully deleted the blog"
    end
  end
  private
  def blog_params
    params.require(:blogpost).permit(:blogtitle, :blockbody)
  end
end
