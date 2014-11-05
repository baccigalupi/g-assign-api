class AssignmentsSerializer < Struct.new(:collection)
  def as_json
    collection.map{|model| AssignmentSerializer.new(model).as_json }
  end

  def to_json(*args)
    as_json.to_json
  end

  class AssignmentSerializer < Struct.new(:model)
    def as_json
      {
        name: model.name,
        type: model.type,
        location: "git://git@github.com:#{model.location}",
        assigned_on: model.assigned_on,
        due_on: model.due_on
      }
    end
  end
end
