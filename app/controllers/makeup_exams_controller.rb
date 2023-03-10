class MakeupExamsController < ApplicationController
  before_action :set_makeup_exam, only: %i[ show edit update destroy ]

  # GET /makeup_exams or /makeup_exams.json
  def index
    @makeup_exams = MakeupExam.all
  end

  # GET /makeup_exams/1 or /makeup_exams/1.json
  def show
  end

  # GET /makeup_exams/new
  def new
    @makeup_exam = MakeupExam.new
  end

  # GET /makeup_exams/1/edit
  def edit
  end

  # POST /makeup_exams or /makeup_exams.json
  def create
    @makeup_exam = MakeupExam.new(makeup_exam_params)

    respond_to do |format|
      if @makeup_exam.save
        format.html { redirect_to @makeup_exam, notice: "Makeup exam was successfully created." }
        format.json { render :show, status: :created, location: @makeup_exam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @makeup_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /makeup_exams/1 or /makeup_exams/1.json
  def update
    respond_to do |format|
      if @makeup_exam.update(makeup_exam_params)
        format.html { redirect_to @makeup_exam, notice: "Makeup exam was successfully updated." }
        format.json { render :show, status: :ok, location: @makeup_exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @makeup_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /makeup_exams/1 or /makeup_exams/1.json
  def destroy
    @makeup_exam.destroy
    respond_to do |format|
      format.html { redirect_to makeup_exams_url, notice: "Makeup exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_makeup_exam
      @makeup_exam = MakeupExam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def makeup_exam_params
      params.fetch(:makeup_exam, {})
    end
end
