class BlogController < ApplicationController
    before_action :move_to_index, except: :index
    protect_from_forgery except: :create
    def index
        @blog = Blog.page(params[:page]).per(5).order("created_at DESC")
    end

    def new
    end

    def create
        Blog.create(text: blog_params[:text])
    end

    def destroy
        blog = Blog.find(params[:id])
        blog.destroy
    end

    def edit
        @blog = Blog.find(params[:id])
      end

    def update
        blog = Blog.find(params[:id])
        blog.update(blog_params)
    end

    private
    def blog_params
        params.require(:blog).permit(:text)
    end

    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
end
