class AssignmentsFinder
  attr_reader :params
  attr_accessor :query

  def initialize(params)
    @params = params.to_hash
  end

  def base_query
    Assignment.all
  end

  def results
    self.query = base_query
    self.query = query.where("created_at > ? ", params[:since]) if params[:since]

    query.load
  end
end
