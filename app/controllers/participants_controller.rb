class ParticipantsController < ApplicationController
	helper_method :count_member

	def add_member
		Participant.find_or_create_by(task_id: params[:task], member_id: params[:member])
		redirect_to task_path(params[:task])
	end

	def remove_member
		Participant.where(task: params[:task], member: params[:member]).delete_all
		if params[:redirect] == "member_show"
			redirect_to member_path(params[:member])
		else
			redirect_to task_path(params[:task])
		end
	end
end