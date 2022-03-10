class BugsController < ApplicationController
  before_action :set_bug, only: %i[show edit update destroy]

  # GET /bugs or /bugs.json
  def index
    @bugs = Bug.all
  end

  # GET /bugs/1 or /bugs/1.json
  def show; end

  # GET /bugs/new
  def new
    @bug = Bug.new
  end

  # GET /bugs/1/edit
  def edit; end

  # POST /bugs or /bugs.json
  def create
    @bug = Bug.new(bug_params)

    respond_to do |format|
      if @bug.save
        format.html do
          redirect_to bug_url(@bug), notice: 'Bug was successfully created.'
        end
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bugs/1 or /bugs/1.json
  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html do
          redirect_to bug_url(@bug), notice: 'Bug was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1 or /bugs/1.json
  def destroy
    @bug.destroy

    respond_to do |format|
      format.html do
        redirect_to bugs_url, notice: 'Bug was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bug
    @bug = Bug.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bug_params
    params
      .require(:bug)
      .permit(
        :issue_summary,
        :issue_description,
        :identified_by,
        :indentified_date,
        :related_project_id,
        :assigned_tostatus,
        :priority,
        :target_resolution_date,
        :progress,
        :actual_resolution_date,
        :resolution_summary,
        :created_by,
        :modified_by,
        :approved,
        :image_url,
        :comment_id
      )
  end
end