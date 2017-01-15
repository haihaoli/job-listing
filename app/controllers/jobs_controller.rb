class JobsController < ApplicationController

  def index
    @job = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params_job)
    if @job.save
      redirect_to jobs_path
      flash[:notice] = "Created Succeed"
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(params_job)
      redirect_to job_path
      flash[:notice] = "Update Succeed"
    else
      render :edit
    end
  end

  def destory
    @job = Job.find(params[:id])
    @job.destory
    redirect_to jobs_path
    flash[:alert] = "Job Deleted"
  end

private

  def params_job
    params.require(:job).permit(:title, :description)    
  end

end
