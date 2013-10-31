class MarksController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  # GET /marks
  # GET /marks.json
  def index
    @marks = Mark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marks }
    end
  end

  # GET /marks/1
  # GET /marks/1.json
  def show
    @mark = Mark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mark }
    end
  end

  # GET /marks/new
  # GET /marks/new.json
  def new
    @mark = current_user.marks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mark }
    end  
  end

  # GET /marks/1/edit
  def edit
    @mark = current_user.marks.find(params[:id])
  end

  # POST /marks
  # POST /marks.json
  def create
    @mark = current_user.marks.new(params[:mark])

    respond_to do |format|
      if @mark.save
        format.html { redirect_to @mark, notice: 'Mark was successfully created.' }
        format.json { render json: @mark, status: :created, location: @mark }
      else
        format.html { render action: "new" }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marks/1
  # PUT /marks/1.json
  def update
    @mark = current_user.marks.find(params[:id])

    respond_to do |format|
      if @mark.update_attributes(params[:mark])
        format.html { redirect_to @mark, notice: 'Mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1
  # DELETE /marks/1.json
  def destroy
    @mark = current_user.marks.find(params[:id])
    @mark.destroy

    respond_to do |format|
      format.html { redirect_to marks_url }
      format.json { head :no_content }
    end
  end
end
