require 'rails_helper'


RSpec.describe 'new recipient' do
  it 'name correct' do
    recipient = Recipient.new(first_name: "Billy", gender: "Male", bio: "Great guy", photo: "something")
    name = recipient.first_name
    expect(name). to eq("Billy")
  end
end
