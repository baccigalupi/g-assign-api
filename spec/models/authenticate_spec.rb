require 'spec_helper'

require_relative "../../app/models/authenticate"

describe Authenticate do
  let(:authenticator) { Authenticate.new(username, password) }

  context 'when using student related username and password' do
    let(:username) { 'gschool-sf' }
    let(:password) { 'full-stack' }

    it "#student? should be true" do
      expect(authenticator.student?).to be ==true
    end

    it "#instructor? should be false" do
      expect(authenticator.instructor?).to be == false
    end
  end

  context 'when using instructor related username and password' do
    let(:username) { 'staff' }
    let(:password) { 'stack-full' }

    it "#student? should be false" do
      expect(authenticator.student?).to be == false
    end

    it "#instructor? should be true" do
      expect(authenticator.instructor?).to be ==true
    end
  end

  context 'when using other stuff' do
    let(:username) { 'hello' }
    let(:password) { 'world' }

    it "#student? should be false" do
      expect(authenticator.student?).to be == false
    end

    it "#instructor? should be true" do
      expect(authenticator.instructor?).to be == false
    end
  end
end
