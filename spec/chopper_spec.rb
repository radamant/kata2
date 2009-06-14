require 'spec'
require 'spec/autorun'
require File.join(File.dirname(__FILE__), '..', 'chopper')

shared_examples_for "any chopper" do
  
  it "should return -1 when the array is empty" do
    @chopper.chop(3,[]).should == -1
  end
  
  context "with 1 element" do
    before(:each) do
      @h = [1]
    end
    
    it "should not find an item not in the array" do
      @chopper.chop(3, @h).should == -1
    end
    
    it "should find the item when searched for the item" do
      @chopper.chop(1, @h).should == 0
    end
  end
    
  
  context "with 3 elements" do
    before(:each) do
      @h = [1,3,5]
    end
    
    it "should return -1 when an items i not found" do
      @chopper.chop(0, @h).should == -1
    end
    
    it "should find an item at 1st index" do
      @chopper.chop(1, @h).should == 0
    end
    
    it "should find an item at 2nd index" do
      @chopper.chop(3, @h).should == 1
    end
    
    it "should find an item at 3rd index" do
      @chopper.chop(5, @h).should == 2
    end
  end
  
  context "with 4 elements" do
    before(:each) do
      @h = [1, 3, 5, 7]
    end
    
    it "should return -1 when the item cannot be found" do
      @chopper.chop(0, @h).should == -1
    end
    
    it "should find an item at 1st index" do
      @chopper.chop(1, @h).should == 0
    end
    
    it "should find an item at 2nd index" do
      @chopper.chop(3, @h).should == 1
    end
    
    it "should find an item at 3rd index" do
      @chopper.chop(5, @h).should == 2
    end
    
    it "should find an item at 4th index" do 
      @chopper.chop(7, @h).should == 3
    end
  end
end

describe RecursiveChopper do
  before(:each) do
    @chopper = RecursiveChopper.new
  end
  it_should_behave_like "any chopper"
end

describe NonRecursiveChopper do
  before(:each) do
    @chopper = NonRecursiveChopper.new
  end
  it_should_behave_like "any chopper"
end