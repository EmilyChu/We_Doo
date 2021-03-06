require 'rails_helper'

RSpec.describe "availabilities/new", type: :view do
  before(:each) do
    assign(:availability, Availability.new(
      :name => "MyString"
    ))
  end

  it "renders new availability form" do
    render

    assert_select "form[action=?][method=?]", availabilities_path, "post" do

      assert_select "input#availability_name[name=?]", "availability[name]"
    end
  end
end
