class AddAndDropsController < ApplicationController
  before_action :set_add_and_drop, only: %i[ show edit update destroy ]

  # GET /add_and_drops or /add_and_drops.json
  def index
    @add_and_drops = AddAndDrop.all
  end

  # GET /add_and_drops/1 or /add_and_drops/1.json
  def show
  end

  # GET /add_and_drops/new
  def new
    @add_and_drop = AddAndDrop.new
  end

  # GET /add_and_drops/1/edit
  def edit
  end

  # POST /add_and_drops or /add_and_drops.json
  def create
    @add_and_drop = AddAndDrop.new(add_and_drop_params)

    respond_to do |format|
      if @add_and_drop.save
        format.html { redirect_to @add_and_drop, notice: "Add and drop was successfully created." }
        format.json { render :show, status: :created, location: @add_and_drop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @add_and_drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_and_drops/1 or /add_and_drops/1.json
  def update
    respond_to do |format|
      if @add_and_drop.update(add_and_drop_params)
        format.html { redirect_to @add_and_drop, notice: "Add and drop was successfully updated." }
        format.json { render :show, status: :ok, location: @add_and_drop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @add_and_drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_and_drops/1 or /add_and_drops/1.json
  def destroy
    @add_and_drop.destroy
    respond_to do |format|
      format.html { redirect_to add_and_drops_url, notice: "Add and drop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_and_drop
      @add_and_drop = AddAndDrop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def add_and_drop_params
      params.fetch(:add_and_drop, {})
    end
end
