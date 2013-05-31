# coding: utf-8
class WorkoutsController < ApplicationController

  before_filter :get_user

  def index
    @workouts = @user.workouts.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workouts }
    end
  end

  def new
    @workout = @user.workouts.new
    
  end

  def show
    @workout = Workout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout }
    end
  end


  def edit
    @workout = Workout.find(params[:id])
  end


  def create
    @workout = @user.workouts.new(params[:workout])
    @workout.user_id = current_user.id
    respond_to do |format|
      if @workout.save
        format.html { redirect_to root_path, notice: 'Edzés sikeresen létrehozva.' }
        format.json { render json: @workout, status: :created, location: @workout }
      else
        format.html { render action: "new" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @workout = @user.workouts(params[:id])

    respond_to do |format|
      if @workout.update_attributes(params[:workout])
        format.html { redirect_to @workout, notice: 'Edzés sikeresen frissítve.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Edzés törölve.' }
      format.json { head :no_content }
    end
  end
end
