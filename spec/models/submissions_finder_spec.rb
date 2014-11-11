require 'rails_helper'

describe SubmissionsFinder do
  let(:finder) { SubmissionsFinder.new(params) }

  let!(:submission_1) { Submission.create(github_name: 'jfoley', location: 'git@github.com:jfoley/foo', assignment_id: 33, submitted_at: Time.now - 3.days) }
  let!(:submission_2) { Submission.create(github_name: 'marthaberner', location: 'git@github.com:marthaberner/bar', assignment_id: 22, submitted_at: Time.now - 1.day) }

  context 'when no params are involved' do
    let(:params) { {} }

    it "returns all submissions" do
      expect(finder.results).to include(submission_1)
      expect(finder.results).to include(submission_2)
    end
  end

  context 'when trying to find submissions for a particular assignment' do
    let(:params) { {assignment_id: 33} }

    it "returns all submissions" do
      expect(finder.results).to include(submission_1)
      expect(finder.results).not_to include(submission_2)
    end
  end

  context 'when trying to find submissions for a particular github user' do
    let(:params) { {github_name: 'marthaberner'} }

    it "returns all submissions" do
      expect(finder.results).not_to include(submission_1)
      expect(finder.results).to include(submission_2)
    end
  end

  context 'when trying to limit since a certain date' do
    let(:params) { { since: Time.now - 2.days } }

    it "returns only the submissions since that date" do
      expect(finder.results).not_to include(submission_1)
      expect(finder.results).to include(submission_2)
    end
  end
end
