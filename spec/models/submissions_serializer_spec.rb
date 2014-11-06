require 'spec_helper'

require_relative "../../app/models/submissions_serializer"

describe SubmissionsSerializer do
  let(:serializer) { SubmissionsSerializer.new(collection) }
  let(:keys) { [:id, :github_name, :assignment_id] }

  let(:collection) {
    SubmissionStub = Struct.new(*keys) unless defined?(SubmissionStub)

    [
      SubmissionStub.new(22, 'jfoley', 234),
      SubmissionStub.new(15, 'marthaberner', 456)
    ]
  }

  let(:serialized) { serializer.as_json }

  it "each serialized model contains the right keys" do
    expect(serialized.map(&:keys).uniq.first).to be == keys
  end
end
