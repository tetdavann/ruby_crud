class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy toggle_completion]
  before_action :set_categories, only: %i[new edit]

  # GET /jobs or /jobs.json
  def index
    @jobs = Job.all
    # .order(id: :asc)
    if params[:only_category]
      @jobs = @jobs.where(category: params[:only_category])
    end
    if params[:sort] && params[:direction]
     @jobs = @jobs.order("#{params[:sort]} #{params[:direction]}")
    else
      @jobs = @jobs.order(id: :asc)
    end

    @job_all = Job.all
  end


  # GET /jobs/1 or /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy!

    respond_to do |format|
      format.html { redirect_to jobs_path, status: :see_other, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_completion
    if @job
      @job.update(is_completed: !@job.is_completed)
      respond_to do |format|
        format.html { redirect_to jobs_path, notice: "Job completion status updated." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to jobs_path, alert: "Job not found." }
        format.json { render json: { error: "Job not found." }, status: :not_found }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Set categories for the dropdown
  def set_categories
    @categories = Category.all
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(:title, :description, :category_id, :is_completed, :status)
  end
end
