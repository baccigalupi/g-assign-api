require 'spec_helper'

require_relative "../../app/models/collection_serializer"
require_relative "../../app/models/submissions_serializer"

describe SubmissionsSerializer do
  let(:serializer) { SubmissionsSerializer.new(collection) }
  let(:keys) { ['id', 'github_name', 'location', 'assignment_id', 'submitted_at'] }

  let(:collection) {
    [
      double(attributes: {'id' => 123, 'github_name' => 'name', 'location' => 'git@github.com:name/repo', 'assignment_id' => 24, 'submitted_at' => Time.now - 3600}),
      double(attributes: {'id' => 321, 'github_name' => 'name2', 'location' => 'git@github.com:name2/repo', 'assignment_id' => 24, 'submitted_at' => Time.now - 2400})
    ]
  }

  let(:serialized) { serializer.as_json }

  it "each serialized model contains the right keys" do
    expect(serialized.map(&:keys).uniq.first).to be == keys
  end
end
