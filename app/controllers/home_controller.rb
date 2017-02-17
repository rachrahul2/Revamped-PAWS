class HomeController < ApplicationController
  def index
    session[:user_present] = "false"
    session[:signuperr]="false"
    if session[:signup] == "signup"
      session[:user_present] = "true"
      session[:signup] = "1"
      session[:signuperr]="true"
    end
    if session[:logout] == "logout"
      session[:user_present] = "false"
      session[:logout]="1"
    end
    if session[:login] == "login"
      session[:user_present] = "true"
      session[:login]="1"
    end
    #session[:mail] ="1"
    p "===========================#{session[:user_present]}=========#{session[:login]}=============="
  end
  def places

  end
  def login
  	@log=User.find_by email: params[:email]
    if @log
  	if @log.email==params[:email] and @log.password==params[:password]
      session[:user_present] = "true"
      session[:login] = "login"
      session[:mail] = @log.email
      redirect_to '/home/index'
  	end
  end
  end
  def signup
  end
  def save
    if params[:signup] == "signup"
    if User.find_by email: params[:email]
      session[:signuperr]="true"
      redirect_to '/home/signup'
    else
  	@user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.phone = params[:phone]
    @user.password = params[:password]

    @user.save
    session[:mail] =  params[:email]  
    session[:signup] = "signup"
    redirect_to '/home/index'
    end
    end

    if User.find_by email: session[:mail]
      if params[:first]=="first"
        redirect_to '/home/index'
      end
    end
  end
  def logout
    session[:user_present] = "false"
    session[:logout] = "logout"
    session[:mail] =""
    redirect_to '/home/index'
  end
  def like
    if User.find_by email: session[:mail]
      @like=User.find_by email: session[:mail]
      if params[:first]=="true"
        User.where(:email=> session[:mail]).update_all(first: params[:first])
        redirect_to '/home/first'
      elsif params[:first]=="false" 
        User.where(:email=> session[:mail]).update_all(first: params[:first])
        redirect_to '/home/first'
      elsif params[:second]=="true"
        User.where(:email=> session[:mail]).update_all(second: params[:second])
        redirect_to '/home/second'
      elsif params[:second]=="false" 
        User.where(:email=> session[:mail]).update_all(second: params[:second])
        redirect_to '/home/second'
      elsif params[:third]=="true"
        User.where(:email=> session[:mail]).update_all(third: params[:third])
        redirect_to '/home/third'
      elsif params[:third]=="false" 
        User.where(:email=> session[:mail]).update_all(third: params[:third])
        redirect_to '/home/third'
      elsif params[:fourth]=="true"
        User.where(:email=> session[:mail]).update_all(fourth: params[:fourth])
        redirect_to '/home/fourth'
      elsif params[:fourth]=="false" 
        User.where(:email=> session[:mail]).update_all(fourth: params[:fourth])
        redirect_to '/home/fourth'
      elsif params[:fifth]=="true"
        User.where(:email=> session[:mail]).update_all(fifth: params[:fifth])
        redirect_to '/home/fifth'
      elsif params[:fifth]=="false" 
        User.where(:email=> session[:mail]).update_all(fifth: params[:fifth])
        redirect_to '/home/fifth'
      elsif params[:sixth]=="true"
        User.where(:email=> session[:mail]).update_all(sixth: params[:sixth])
        redirect_to '/home/sixth'
      elsif params[:sixth]=="false" 
        User.where(:email=> session[:mail]).update_all(sixth: params[:sixth])
        redirect_to '/home/sixth'      
      end
    else
      redirect_to '/home/first'  
    end
  end
  def first
    @like=User.find_by email: session[:mail]
    if @like
    @first=@like.first
    end
  end
  def second
    @like=User.find_by email: session[:mail]
    if @like
    @first=@like.second
    end
  end
  def third
    @like=User.find_by email: session[:mail]
    if @like
    @first=@like.third
    end
  end
  def fourth
    @like=User.find_by email: session[:mail]
    if @like
    @first=@like.fourth
    end
  end
  def fifth
    @like=User.find_by email: session[:mail]
    if @like
    @first=@like.fifth
    end
  end
  def sixth
    @like=User.find_by email: session[:mail]
    if @like
    @first=@like.sixth
    end
  end
end
