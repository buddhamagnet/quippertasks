require 'spec_helper'

describe "SortableTasks" do
  before(:each) do
    @task1 = Task.create!(:name => "Amazed", :description => "Foo", :deadline => Date.today)
    @task2 = Task.create!(:name => "ZOMG", :description => "Foo", :deadline => Date.today)
    @task3 = Task.create!(:name => "Irrelevant", :description => "Foo", :deadline => Date.today, :completed => true)
  end
  
  it "should show the first task in default sort" do
    visit 'tasks'
    page.should have_selector('a', :class => "task1", :content => @task1.name)
  end
  
  it "should show task 2 first in reverse name order" do
    visit 'tasks?order=DESC&sort=name'  
    page.should have_selector('a', :class => "task1", :content => @task2.name)
  end
  
  it "should show task 3 first in completed order" do
    visit 'tasks?order=ASC&sort=completed'
    page.should have_selector('a', :class => "task1", :content => @task3.name)
  end
end