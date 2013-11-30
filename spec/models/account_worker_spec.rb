require 'spec_helper'

describe AccountWorker do
  it "needs deets" do
    AccountWorker.create :name => "a", :password => "b"
  end
end
