class TasksController < ApplicationController
	
	def index
		@tasks = Task.all
	end

	def show
		@task = Task.find(params[:id])
		
		@participants = []
		@members = []
		temp = Participant.where(task: @task)
		temp.each { |t| @participants.push(t.member) }
		temp = Member.all
		temp.each do |t|
			if !@participants.include?(t)
				@members.push(t)
			end
		end
	end

	def new
		@task = Task.new
	end

	def create
	  @task = Task.new(task_params)
	  if @task.save
		redirect_to tasks_path
	  else
		render :new
	  end
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			redirect_to task_path(@task)
		else
			render :edit
		end
	end

	def destroy
		Task.find(params[:id]).destroy
		Participant.where(task_id: params[:id]).delete_all
		redirect_to action: "index"
	end

	private

	def task_params
		params.require(:task).permit(:name, :description, :start, :due,)
	end
end