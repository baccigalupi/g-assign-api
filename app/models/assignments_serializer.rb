class AssignmentsSerializer < CollectionSerializer
  def keys
    [:id, :name, :type, :location, :assigned_on, :due_on]
  end
end
