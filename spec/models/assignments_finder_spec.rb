require 'rails_helper'

describe AssignmentsFinder do
  let(:finder) { AssignmentsFinder.new(params) }

  let!(:assignment_1) { Assignment.create(name: 'foo', location: 'git@github.com:jfoley/foo', created_at: Time.now - 3.days) }
  let!(:assignment_2) { Assignment.create(name: 'bar', location: 'git@github.com:marthaberner/bar', created_at: Time.now - 1.day) }

  context 'when no params are involved' do
    let(:params) { {} }

    it "returns all assignments" do
      expect(finder.results).to include(assignment_1)
      expect(finder.results).to include(assignment_2)
    end
  end


  context 'when trying to limit since a certain date' do
    let(:params) { { since: Time.now - 2.days } }

    it "returns only the assignments since that date" do
      expect(finder.results).not_to include(assignment_1)
      expect(finder.results).to include(assignment_2)
    end
  end
end
