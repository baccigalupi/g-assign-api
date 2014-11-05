class AssignmentsController < ApplicationController
  def index
    serializer = AssignmentsSerializer.new(Exercise.all)
    render json: serializer
  end
end
