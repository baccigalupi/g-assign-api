class AssignmentsController < ApplicationController
  def index
    serializer = AssignmentsSerializer.new(Exercise.all)
    render json: serializer
  end

  def create
    render json: {status: 400} and return unless authenticator.instructor?

    assignment = Assignment.create(
      params[:assignment].permit(:name, :type, :location, :assigned_on, :due_on)
    )

    render json: {status: 200}
  end
end
