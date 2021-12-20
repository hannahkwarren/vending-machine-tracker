require 'rails_helper'

RSpec.describe Machine, type: :model do
  before(:each) do
    @owner1 = Owner.create(name:"Bob Thornton")
    @owner2 = Owner.create(name: "Greg Richardson")
    
    @machine1 = @owner1.machines.create(location:"Basketball Court Hallway")
    @machine2 = @owner1.machines.create(location:"Hotel lobby")
    @machine3 = @owner2.machines.create(location:"Theater Second Floor")
    
    @machine1.snacks.create(name:"Fritos", price:2.00)
    @machine1.snacks.create(name:"Cheetos", price:1.75)
    @machine1.snacks.create(name:"Lays Salt and Vinegar Chips", price:2.25)
    
    @machine2.snacks.create(name:"Fritos", price:2.00)
    @machine2.snacks.create(name:"Lays Salt and Vinegar Chips", price:2.25)
    @machine2.snacks.create(name:"Cheetos", price:1.75)
  end
  
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  it "should calculate average snack price for snacks in this machine" do 
    
    expect(@machine1.average_snack_price).to eq(2.0)
  end
end
