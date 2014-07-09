require 'rails_helper'

describe "Students API" do
  it 'sends a list of students' do
    FactoryGirl.create_list(:student, 5)

    get '/students'

    expect(response).to be_success # Test for 200 status code
    json = JSON.parse(response.body)
    expect(json.length).to eq(5) # Check number of students
  end
end
