require 'rails_helper'

describe SubmissionsController, type: :controller do
  describe '#create' do
    let(:valid_attributes) {
      {
        location: 'foo/bar',
        assignment_id: 22
      }
    }

    let(:submission) { double(new_record?: false) }

    context "when uses is a student" do
      before do
        basic_instructor_login
      end

      it "creates a new assignment" do
        expect(Submission).to receive(:create).with({
          'location' => valid_attributes[:location],
          'assignment_id' => '22',
          'submitted_at' => anything
        }).and_return(submission)

        post :create, valid_attributes
      end
    end
  end
end
