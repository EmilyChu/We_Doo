require 'rails_helper'

RSpec.describe "availabilities/index", type: :view do
  before(:each) do
    assign(:availabilities, [
      Availability.create!(
        :name => "Name"
      ),
      Availability.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of availabilities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
