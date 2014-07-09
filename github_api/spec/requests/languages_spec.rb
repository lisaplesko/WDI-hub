require 'rails_helper'

describe "Languages API" do
  it 'retrieves a students languages' do
    student = FactoryGirl.create(:student)
    student.repos << FactoryGirl.create(:repo)
    student.repos[0].languages << FactoryGirl.create(:language)
    get "/students/#{student.id}/total_language"

    expect(response).to be_success # Test for 200 status code
    json = JSON.parse(response.body)

    expect(json.keys.first).to eq(student.repos[0].languages[0][:lang_name])
    expect(json.length).to eq(1) # Check number of students
  end
end
