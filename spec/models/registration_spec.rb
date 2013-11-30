require 'spec_helper'

describe Registration do
  context "creating a registration" do
    before :each do
      @worker = AccountWorker.create :name => "a", :password => "b"
      @registration = Registration.create :aws_id => "123"
    end

    it "attaches a worker" do
      @registration.should be_persisted
      @registration.account_worker.should == @worker
    end

    it "won't create another registration" do
      @another_registration = Registration.create :aws_id => "1234"
      @another_registration.should_not be_persisted
    end

    it "will create another registration if an available account_worker exists" do
      @worker_2 = AccountWorker.create :name => "aaa", :password => "bbbb"
      @another_registration = Registration.create :aws_id => "1234"
      @another_registration.should be_persisted
      @another_registration.account_worker.should == @worker_2
    end
  end
end
