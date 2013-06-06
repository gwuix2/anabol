# coding: utf-8
class MetaReportsController < ApplicationController
  load_and_authorize_resource

  before_filter :get_user

  def index
    @meta_reports = MetaReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meta_reports }
    end
  end

  # GET /meta_reports/1
  # GET /meta_reports/1.json
  def show
    @meta_report = MetaReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meta_report }
    end
  end

  # GET /meta_reports/new
  # GET /meta_reports/new.json
  def new
    @meta_report = @profile.meta_reports.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meta_report }
    end
  end

  # GET /meta_reports/1/edit
  def edit
    @meta_report = MetaReport.find(params[:id])
  end

  # POST /meta_reports
  # POST /meta_reports.json
  def create
    @meta_report = @profile.meta_reports.new(params[:meta_report])

    respond_to do |format|
      if @meta_report.save
        format.html { redirect_to root_path, notice: 'Jelentés sikeresen létrehozva.' }
        format.json { render json: @meta_report, status: :created, location: @meta_report }
      else
        format.html { redirect_to meta_path }
        format.json { render json: @meta_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meta_reports/1
  # PUT /meta_reports/1.json
  def update
    @meta_report = MetaReport.find(params[:id])

    respond_to do |format|
      if @meta_report.update_attributes(params[:meta_report])
        format.html { redirect_to @meta_report, notice: 'Jelentés frissítve.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meta_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meta_reports/1
  # DELETE /meta_reports/1.json
  def destroy
    @meta_report = MetaReport.find(params[:id])
    @meta_report.destroy

    respond_to do |format|
      format.html { redirect_to meta_reports_url }
      format.json { head :no_content }
    end
  end
end
