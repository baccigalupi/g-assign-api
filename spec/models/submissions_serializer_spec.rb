require 'spec_helper'

require_relative "../../app/models/submissions_serializer"

describe SubmissionsSerializer do
  let(:serializer) { SubmissionsSerializer.new(collection) }
  let(:keys) { [:id, :github_name, :location, :assignment_id, :submitted_at] }

  let(:collection) {
    SubmissionStub = Struct.new(*keys) unless defined?(SubmissionStub)

    [
      SubmissionStub.new(22, 'jfoley', 'git@github.com:jfoley/foo', 234, Time.now),
      SubmissionStub.new(15, 'marthaberner', 'git@github.com:marthaberner/foo', 456, Time.now - 3600)
    ]
  }

  let(:serialized) { serializer.as_json }

  it "each serialized model contains the right keys" do
    expect(serialized.map(&:keys).uniq.first).to be == keys
  end
end
