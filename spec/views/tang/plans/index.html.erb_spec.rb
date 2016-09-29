require 'rails_helper'

RSpec.describe "tang/plans/index", type: :view do
  before(:each) do
    assign(:plans, [
      Tang::Plan.create!(
        :stripe_id => "Stripe1",
        :amount => 2,
        :currency => "Currency",
        :interval => "Interval",
        :interval_count => 3,
        :name => "Name",
        :statement_descriptor => "Statement Descriptor",
        :trial_period_days => 4
      ),
      Tang::Plan.create!(
        :stripe_id => "Stripe2",
        :amount => 2,
        :currency => "Currency",
        :interval => "Interval",
        :interval_count => 3,
        :name => "Name",
        :statement_descriptor => "Statement Descriptor",
        :trial_period_days => 4
      )
    ])
  end

  it "renders a list of plans" do
    render
    assert_select "tr>td", :text => "Stripe1".to_s, :count => 1
    assert_select "tr>td", :text => "Stripe2".to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    assert_select "tr>td", :text => "Interval".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Statement Descriptor".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end