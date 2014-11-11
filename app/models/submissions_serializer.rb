class SubmissionsSerializer < CollectionSerializer
  def keys
    [:id, :github_name, :location, :assignment_id, :submitted_at]
  end
end
