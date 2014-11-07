class SubmissionsController < ApplicationController
  def index
    serializer = SubmissionsSerializer.new(
      SubmissionsFinder.new(params).results
    )

    render json: serializer
  end

  def create
    submission = Submission.create(
      params.permit(:assignment_id, :github_name, :location).merge(submitted_at: Time.now)
    )

    render json: {status: submission.new_record? ? 400 : 200}
  end
end
