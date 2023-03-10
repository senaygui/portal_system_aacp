class GradeChangesController < ApplicationController
  before_action :set_grade_change, only: %i[ show edit update destroy ]

  # GET /grade_changes or /grade_changes.json
  def index
    @grade_changes = GradeChange.all
  end

  # GET /grade_changes/1 or /grade_changes/1.json
  def show
  end

  # GET /grade_changes/new
  def new
    @grade_change = GradeChange.new
  end

  # GET /grade_changes/1/edit
  def edit
  end

  # POST /grade_changes or /grade_changes.json
  def create
    @grade_change = GradeChange.new(grade_change_params)

    respond_to do |format|
      if @grade_change.save
        format.html { redirect_to @grade_change, notice: "Grade change was successfully created." }
        format.json { render :show, status: :created, location: @grade_change }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grade_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grade_changes/1 or /grade_changes/1.json
  def update
    respond_to do |format|
      if @grade_change.update(grade_change_params)
        format.html { redirect_to @grade_change, notice: "Grade change was successfully updated." }
        format.json { render :show, status: :ok, location: @grade_change }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grade_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grade_changes/1 or /grade_changes/1.json
  def destroy
    @grade_change.destroy
    respond_to do |format|
      format.html { redirect_to grade_changes_url, notice: "Grade change was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade_change
      @grade_change = GradeChange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_change_params
      params.fetch(:grade_change, {})
    end
end
