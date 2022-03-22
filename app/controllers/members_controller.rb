class MembersController < ApplicationController
	def index
		@members = Member.all
	end

	def show
		@member = Member.find(params[:id])
	end

	def new
		@member = Member.new
	end

	def create
	  @member = Member.new(member_params)
	  if @member.save
		redirect_to members_path
	  else
		render :new
	  end
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		if @member.update(member_params)
			redirect_to member_path(@member)
		else
			render :edit
		end
	end

	def destroy
		Member.find(params[:id]).destroy
		Participant.where(member_id: params[:id]).delete_all
		redirect_to action: "index"
	end

	private

	def member_params
		params.require(:member).permit(:first_name, :last_name, :email, :phone)
	end
end