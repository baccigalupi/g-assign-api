require 'spec_helper'

require_relative "../../app/models/assignments_serializer"

require 'date'

describe AssignmentsSerializer do
  let(:serializer) { AssignmentsSerializer.new(collection) }
  let(:keys) { [:id, :name, :type, :location, :assigned_on, :due_on] }

  let(:collection) {
    AssignmentStruct = Struct.new(*keys) unless defined?(AssignmentStruct)

    [
      AssignmentStruct.new(22, 'The Joy of Arrays', :exercise, 'git@github.com:g5-gschool/joy-of-arrays', Date.parse("1/1/2014"), Date.parse("1/2/2014")),
      AssignmentStruct.new(15, 'Hash Clininc', :assessment, 'git@github.com:g5-gschool/hash-clinic', Date.parse("1/2/2014"), Date.parse("1/5/2014"))
    ]
  }

  let(:serialized) { serializer.as_json }

  it "each serialized model contains the right keys" do
    expect(serialized.map(&:keys).uniq.first).to be == keys
  end

  it "transforms the location" do
    expect(serialized.first[:location]).to match(/^git@github.com:/)
    expect(serialized.first[:location]).to include(collection.first[:location])
  end
end
