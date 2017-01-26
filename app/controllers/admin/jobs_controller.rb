class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :hide, :publish, :people, :urgency]
  before_filter :require_is_admin
  layout "admin"

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path, notice: "Create Success"
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, alert: "Job Deleted"
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!
    redirect_to admin_jobs_path
    flash[:notice] = "Job Hidded"
  end

  def publish
    @job = Job.find(params[:id])
    @job.publish!
    redirect_to admin_jobs_path
    flash[:notice] = "Job Pubilshed"
  end

private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :people, :urgency)
  end



end
