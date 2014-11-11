require 'spec_helper'

require_relative "../../app/models/collection_serializer"
require_relative "../../app/models/assignments_serializer"

describe AssignmentsSerializer do
  let(:serializer) { AssignmentsSerializer.new(collection) }
  let(:keys) { ['id', 'name', 'type', 'location', 'assigned_on', 'due_on'] }

  let(:collection) {
    [
      double(attributes: {'id' => 123, 'name' => 'The Joy of Arrays', 'type' => :exercise, 'location' => 'git@github.com:name/repo', 'assigned_on' => Time.now - 3600*24, 'due_on' => Time.now - 3600}),
      double(attributes: {'id' => 321, 'name' => 'Hash Clinic', 'type' => :assessment, 'location' => 'git@github.com:name2/repo', 'assigned_on' => Time.now - 3600*24*2, 'due_on' => Time.now - 2400})
    ]
  }

  let(:serialized) { serializer.as_json }

  it "each serialized model contains the right keys" do
    expect(serialized.map(&:keys).uniq.first).to be == keys
  end
end
