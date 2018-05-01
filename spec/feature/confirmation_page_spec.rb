feature 'Confirmation Page Features' do
  context "Confirmation Page Connection" do
    scenario "Homepage status code to be '200'" do
      visit '/confirmation'
      expect(page.status_code).to eq 200
    end
  end

  context "Confirmation Page text" do
    scenario "Page to confirm citizenship" do
      visit '/confirmation'
      expect(page).to have_content("Congratulations, you are now a citizen of Capital Oneder")
    end

    scenario "Page to display unique citizenship number" do
      visit '/confirmation'
      expect(page).to have_selector("//output", :id =>"citizenship_id")
    end
  end
end
