class SubmissionsController < ApplicationController
  def index
    serializer = SubmissionsSerializer.new(
      SubmissionsFinder.new(params).results
    )

    render json: serializer
  end

  def create
    submission = Submission.create(
      params.permit(:assignment_id, :github_name).merge(submitted_at: Time.now)
    )

    render json: {status: 200}
  end
end
