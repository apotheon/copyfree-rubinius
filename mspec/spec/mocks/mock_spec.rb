# This is a bit awkward. Currently the way to verify that the
# opposites are true (for example a failure when the specified
# arguments are NOT provided) is to simply alter the particular
# spec to a failure condition.
require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/../../mocks/mock'
require File.dirname(__FILE__) + '/../../mocks/proxy'

describe Mock do
  it "provides expects that returns a Hash" do
    Mock.expects.should be_an_instance_of(Hash)
  end
  
  it "provides objects that returns an Array" do
    Mock.objects.should be_an_instance_of(Array)
  end
  
  it "provides set_expect that returns a MockProxy" do
    Mock.set_expect(self, :foo).should be_an_instance_of(MockProxy)
  end
end

# describe 'Setting up mock methods in a #specify/#it block' do
#   specify 'any object can set up a mock method using #should_receive' do
#     o = Object.new
#     o.should_receive :foobar
#     o.foobar
#   end
#   
#   specify 'any class can set up a mock method using #should_receive' do
#     class O; end
#     O.should_receive :foobar
#     O.foobar
#   end
# end
# 
# describe 'Lifetime of the mocked methods' do
#   before :each do
#     @mini_mock_a = [1]
#   end
# 
#   specify 'methods are released...' do
#     @mini_mock_a.should_receive :first
#     @mini_mock_a.first.should == nil
#   end
# 
#   specify '...at the end of the #it block' do
#     @mini_mock_a.first.should == 1
#   end
# end
# 
# describe 'Controlling the expectations' do
#   specify 'the value returned by invocation of the mock method is nil or the given :returning' do
#     o, oo = Object.new, Object.new
#     o.should_receive :foobar
#     oo.should_receive :foobar, :returning => :bazquux
# 
#     o.foobar.should == nil
#     oo.foobar.should == :bazquux
#   end
# 
#   specify 'the number of times the method must be called can be specified using :count' do
#     o = Object.new
#     o.should_receive :foobar, :count => 2
#     o.foobar
#     o.foobar
#   end
# 
#   specify 'specifying a count of 0 is the same as using #should_not_receive' do
#     o, oo = Object.new, Object.new
#     o.should_receive :foobar, :count => 0
#     oo.should_not_receive :foobar
#   end
# 
#   specify 'the method can expect a specific set of arguments' do
#     o = Object.new
#     o.should_receive :foo, :with => ['hello', 1] 
#     o.foo 'hello', 1
#   end
# 
#   specify 'can require a block to be given' do
#     o = Object.new
#     o.should_receive :foo, :block => true
#     o.foo { puts 'hi' }
#   end
# end
