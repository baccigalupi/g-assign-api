class SubmissionsSerializer < Struct.new(:collection)
  def as_json
    collection.map{|model| SubmissionSerializer.new(model).as_json }
  end

  def to_json(*args)
    as_json.to_json
  end

  class SubmissionSerializer < Struct.new(:model)
    def as_json
      {
        id: model.id,
        github_name: model.github_name,
        location: model.location,
        assignment_id: model.assignment_id,
        submitted_at: model.submitted_at
      }
    end
  end
end
