class JobsController < ApplicationController

    def index
      @jobs = Job.all
    end

    def show
      @job = Job.find(params[:id])
    end

    def new
      @job = Job.new
    end

    def create
      @job = Job.new(job_params)
            
      if @job.save
        redirect_to @job
      else
        flash.now[:alert] = 'Favor preencher todos os campos'  
        render :new 
      end
    end

    def edit
      @job = Job.find(params[:id])
    end  

    def update
      @job = Job.find(params[:id])
      @job.update(job_params)
      redirect_to @job
    end

    def destroy
      job = Job.find(params[:id]) 
      job.destroy 
      redirect_to root_path
    end

    private

    def job_params
      params.require(:job).permit(:title, :description,
                                  :desired_skill,:salary_range,
                                  :level, :deadline, :region)
    end

end
