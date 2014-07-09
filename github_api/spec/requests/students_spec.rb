require 'rails_helper'

describe "Students API" do
  it 'sends a list of students' do
    FactoryGirl.create_list(:student, 5)

    get '/students'

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json.length).to eq(5)
  end
end
