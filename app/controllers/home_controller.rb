class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index, :setimage, :getimage, :testimage ]

  def index
    if current_user
      if session[:tenant_id]
        Tenant.set_current_tenant session[:tenant_id]
      else
        Tenant.set_current_tenant current_user.tenants.first
      end
      @tenant = Tenant.current_tenant
      params[:tenant_id] = @tenant.id
    end
  end

  def setimage
    #@html = "<html><body>YOU are the Winner(from setimage)!!</body></html>"
    #@kit = IMGKit.new(@html)

    @kit = IMGKit.new("http://www.google.co.kr")

    @kit.to_file(Rails.root + 'public/htmlimages/file5.jpg')

    redirect_to getimage_path(5) and return
  end

  def getimage
    #@html = "<html><body>YOU are the Winner!!</body></html>"
    #@kit = IMGKit.new(@html)

    @imageid = params[:id]
    @imagefile = "#{Rails.root}/public/htmlimages/file#{@imageid}.jpg"

    #@kit = IMGKit.new("http://www.google.com")

    #@kit = IMGKit.new("http://rubytest-191528.nitrousapp.com/testimage")

    #send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
    #send_data(@imagefile, :type => "image/jpeg", :disposition => 'inline')
    send_file(@imagefile, :type => "image/jpeg", :disposition => 'inline')

  end

  def testimage
    @mode = params[:id]

    if @mode == 1
      @html = "<html><body>YOU are the Winner!!</body></html>"
      @kit = IMGKit.new(@html)
      send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
      return
    elsif @mode == 2
      @kit = IMGKit.new("http://www.naver.com/")
      send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
      return
    elsif @mode == 3
      @kit = IMGKit.new("http://saas-app-joon.herokuapp.com/")
      send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
      return
    elsif @mode == 4

    else
      @image = "This comes from testimage~"
    end
  end

end
