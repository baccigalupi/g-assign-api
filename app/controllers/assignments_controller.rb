class AssignmentsController < ApplicationController
  def index
    serializer = AssignmentsSerializer.new(Assignment.all)
    render json: serializer
  end

  def create
    render json: {status: 400} and return unless authenticator.instructor?

    assignment = Assignment.create(
      params.permit(:name, :type, :location, :assigned_on, :due_on)
    )

    render json: {status: 200}
  end
end
