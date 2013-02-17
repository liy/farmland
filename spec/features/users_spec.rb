#coding: utf-8
require 'spec_helper'

feature "Users" do
  scenario "Show all users" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    visit '/users'
    expect(page).to have_text('姓名')
    expect(page).to have_text('邮箱')
  end
end
