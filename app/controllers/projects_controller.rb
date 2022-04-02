class ProjectsController < ApplicationController
	before_action :set_project, only: %i[show edit update destroy]

	# GET /projects or /projects.json
	def index
		@projects = Project.all
	end

	# GET /projects/1 or /projects/1.json
	def show; end

	# GET /projects/new
	def new
		@project = Project.new
	end

	# GET /projects/1/edit
	def edit; end

	# POST /projects or /projects.json
	def create
		@project = Project.new(project_params)

		respond_to do |format|
			if @project.save
				format.html do
					redirect_to project_url(@project),
					            notice: 'Project was successfully created.'
				end
				format.json { render :show, status: :created, location: @project }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json do
					render json: @project.errors, status: :unprocessable_entity
				end
			end
		end
	end

	# PATCH/PUT /projects/1 or /projects/1.json
	def update
		respond_to do |format|
			if @project.update(project_params)
				format.html do
					redirect_to project_url(@project),
					            notice: 'Project was successfully updated.'
				end
				format.json { render :show, status: :ok, location: @project }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json do
					render json: @project.errors, status: :unprocessable_entity
				end
			end
		end
	end

	# DELETE /projects/1 or /projects/1.json
	def destroy
		@project.destroy

		respond_to do |format|
			format.html do
				redirect_to projects_url, notice: 'Project was successfully destroyed.'
			end
			format.json { head :no_content }
		end
	end

	private

	# Use callbacks to share common setup or constraints between actions.
	def set_project
		@project = Project.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def project_params
		params
			.require(:project)
			.permit(
				:project_name,
				:start_date,
				:team_id,
				:target_end_date,
				:actual_end_date,
				:created_by,
				:modified_by,
				:bug_id,
			)
	end
end
