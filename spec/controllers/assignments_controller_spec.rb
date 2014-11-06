require 'rails_helper'

describe AssignmentsController, type: :controller do
  describe '#create' do
    let(:valid_attributes) {
      {
        name: 'Joy of Math',
        type: 'exercise',
        location: 'g5-gschool',
        assigned_on: Date.today,
        due_on: Date.today + 2
      }
    }

    context 'when user is a student' do
      before do
        basic_student_login
      end

      it "does not create a new Assignment" do
        expect(Assignment).not_to receive(:create)

        post :create, valid_attributes
      end
    end

    context "when uses is an instructor" do
      before do
        basic_instructor_login
      end

      it "creates a new assignment" do
        expect(Assignment).to receive(:create).with({
          name: valid_attributes[:name],
          type: valid_attributes[:type].to_s,
          location: valid_attributes[:location],
          assigned_on: valid_attributes[:assigned_on].to_s,
          due_on: valid_attributes[:due_on].to_s
        })

        post :create, valid_attributes
      end
    end
  end
end
