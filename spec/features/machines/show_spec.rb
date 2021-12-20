require 'rails_helper'

RSpec.describe "Vending machine show page", type: :feature do 

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

  it "lists snacks available at the machine with their prices" do
    visit "/machines/#{@machine1.id}"
    
    expect(page).to have_content("Fritos, $2.00")
    expect(page).to have_content("Cheetos, $1.75")
    expect(page).to have_content("Lays Salt and Vinegar Chips, $2.25")
  end

  it "provides average snack price" do  
    visit "/machines/#{@machine1.id}"

    expect(page).to have_content("Average Snack Price for this Machine: $2.00")
  end

end
