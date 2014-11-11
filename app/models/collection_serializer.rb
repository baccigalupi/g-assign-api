class CollectionSerializer < Struct.new(:collection)
  def to_json(*args)
    as_json.to_json
  end

  def as_json
    collection.map{|model| model.attributes.slice(*keys) }
  end
end
