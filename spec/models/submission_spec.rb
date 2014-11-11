require 'rails_helper'

describe Submission do
  describe 'validations' do
    let(:valid_location) { 'git@github.com:hello/world' }

    it "requires a github repo" do
      expect(Submission.new(location: 'hello/world')).not_to be_valid
      expect(Submission.new(location: valid_location)).to be_valid
    end

    it "requires a unique location" do
      Submission.create(location: valid_location)
      expect(Submission.new(location: valid_location)).not_to be_valid
    end
  end
end
