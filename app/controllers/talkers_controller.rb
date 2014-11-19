class TalkersController < ApplicationController

  if File.file?('constants.rb')
    require_relative 'constants'
  else
    USER_ID, PASSWORD = 'admin', 'test'
  end

  before_filter :authenticate, :only => [ :edit, :destroy, :new, :update, :create, :login] 
  # GET /talkers
  # GET /talkers.jsonk

  def submit
    button_redirect
  end

  def button_redirect
    if params[:commit] == "Print selected talkers"
      params[:commit] = ""
      session[:checked] = nil
      redirect_to(print_path(:checked => params[:checked], :format => 'pdf')) and return
    elsif params[:commit] == "Delete selected talkers"
      session[:checked] = nil
      params[:commit] = ""
      if not params[:checked].nil?
        @num_talkers = params[:checked].length
        Talker.where(:id => params[:checked].keys).delete_all
        params[:checked] = nil
        redirect_to talkers_path, notice: "Talkers successfully deleted." and return
      else
        redirect_to talkers_path, notice: "No talkers selected; no talkers deleted." and return
      end
    elsif params[:commit] == "New talker"
      redirect_to new_talker_path and return
    elsif params[:login] == ""
      redirect_to login_path and return
    elsif not params['edit'].nil?
      redirect_to edit_talker_path(params['edit'].keys[0]) and return
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @talkers }
    end
  end
 
  def index
    @talkers = Talker.order("producer, product")
    @checked = session[:checked].nil? ? [] : Talker.find(session[:checked].keys)
    session[:checked] = params[:checked]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @talkers }
    end
  end

  # GET /talkers/1
  # GET /talkers/1.json
  def login
    redirect_to talkers_path and return
  end

  def print
#    prawnto :prawn => { :top_margin => 75 }
    @talkers = params[:checked].nil? ? Talker.all(:order => "producer, product") : Talker.find(params[:checked].keys, :order => "producer, product")
#    @talkerpairs = @talkers.each_slice(2).to_a
    respond_to do |format|
      format.html
      format.xml { render :xml => @talkers }
      format.pdf { render :layout => false }
    end
#@pdf = PDFKit.new(print_path({:checked => params[:checked]}))
#send_data(@pdf.to_pdf, :filename =>"some.pdf", :type => "application/pdf")
#send_data(@pdf.to_pdf, :filename => "some_name.pdf", :type => 'application/pdf')
    #@checked = params[:checked].nil? ? Talker.all : Talker.find(params[:checked].keys)
  end

  def show
    @talker = Talker.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @talker }
      format.pdf { redirect_to print_path(:checked => {params[:id] => 1}, :format => params[:format])}
    end
  end

  # GET /talkers/new
  # GET /talkers/new.json
  def new
    @title = "New talker"
    @talker = Talker.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @talker }
    end
  end

  # GET /talkers/1/edit
  def edit
    @title = "Edit talker"
    @talker = Talker.find(params[:id])
  end

  # POST /talkers
  # POST /talkers.json
  
  def create
    @talker = Talker.new(params[:talker])

    respond_to do |format|
      if @talker.save
        format.html { redirect_to talkers_path(:anchor => "checked_#{@talker.id}"), notice: 'Talker was successfully created.' }
        format.json { render json: @talker, status: :created, location: @talker }
      else
        format.html { render action: "new" }
        format.json { render json: @talker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /talkers/1
  # PUT /talkers/1.json
  def update
    @talker = Talker.find(params[:id])

    respond_to do |format|
      if @talker.update_attributes(params[:talker])
        format.html { redirect_to talkers_path(:anchor => "checked_#{@talker.id}"), notice: 'Talker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @talker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talkers/1
  # DELETE /talkers/1.json
  def destroy
    @talker = Talker.find(params[:id])
    @talker.destroy

    respond_to do |format|
      format.html { redirect_to talkers_url, notice: 'Talker successfully deleted' }
      format.json { head :no_content }
    end
  end

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |id, password|
        id == USER_ID && password == PASSWORD && session[:logged_in] = true
      end
    end
end
