class PagesController < ApplicationController
  # /
    def index
        render 'pages/index.html.erb'
    end
    # /home
  def home1
    render 'pages/home/home1.html'
  end
      # /
  def home2
    render 'pages/home/home2.html'
  end
      # /
  def home3
    render 'pages/home/home3.html'
  end
  
  # /about
  def about
  end
  
  # /admin/admin1
  def admin1
    render 'pages/admin/admin1.html'
  end
  
  # /admin/admin2
  def admin2
    render 'pages/admin/admin2.html'
  end
  
  # /admin/admin3
  def admin3
    render 'pages/admin/admin3.html'
  end
  
  # /template
  def template
  end
end