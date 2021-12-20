require 'rails_helper'

RSpec.describe "Snack Show Page", type: :feature do 

  before(:each) do
    @owner1 = Owner.create(name:"Bob Thornton")
    @owner2 = Owner.create(name: "Greg Richardson")
    
    @machine1 = @owner1.machines.create(location:"Basketball Court Hallway")
    @machine2 = @owner1.machines.create(location:"Hotel lobby")
    @machine3 = @owner2.machines.create(location:"Theater Second Floor")
    
    @machine1.snacks.create(name:"Cheetos", price:1.75)
    
    @snack1 = @machine1.snacks.create(name:"BBQ Lays", price:2.00)
    @machine2.snacks << @snack1 

    @snack2 = @machine2.snacks.create(name:"Baked Lays", price:2.25)
    @snack3 = @machine2.snacks.create(name:"Peanut Butter Combos", price:1.75)
  end

  it "provides snack details" do
    visit "/snacks/#{@snack1.id}"

    expect(page).to have_content("BBQ Lays")
    expect(page).to have_content("$2.00")
  end

  it "provides machine locations where a snack is carried" do 
    visit "/snacks/#{@snack1.id}"

    within("div#machine-#{@machine1.id}") do 
      expect(page).to have_content("Basketball Court Hallway")
    end

    within("div#machine-#{@machine2.id}") do 
      expect(page).to have_content("Hotel lobby")
    end
  end

  it "provides average snack price at the vending machine location" do 
    visit "/snacks/#{@snack1.id}"
    
    within("div#machine-#{@machine1.id}") do
      expect(page).to have_content("Average Snack Price in this Vending Machine: $1.88")
    end

    within("div#machine-#{@machine2.id}") do
      expect(page).to have_content("Average Snack Price in this Vending Machine: $2.00")
    end
  end

  it "provides count of items in the vending machine" do 
    visit "/snacks/#{@snack1.id}"

    within("div#machine-#{@machine1.id}") do
      expect(page).to have_content("Number of Snacks in this Vending Machine: 2")
    end
    
    within("div#machine-#{@machine2.id}") do 
      expect(page).to have_content("Number of Snacks in this Vending Machine: 3")
    end
  end
end
