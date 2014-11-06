class SubmissionsFinder
  attr_reader :params
  attr_accessor :query

  def initialize(params)
    @params = params.to_hash
  end

  def base_query
    Submission.all
  end

  def results
    self.query = base_query
    self.query = query.where(github_name: params[:github_name]) if params[:github_name]
    self.query = query.where(assignment_id: params[:assignment_id]) if params[:assignment_id]
    self.query = query.where("submitted_at > ? ", params[:since]) if params[:since]

    query.load
  end
end
