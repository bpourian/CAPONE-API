feature 'Home Page' do
  scenario "Homepage status code to be '200'" do
    visit '/'
    expect(page.status_code).to eq 200
  end

  scenario "Page to have input tag present" do
    visit '/'
    expect(page).to have_selector("//input", :id =>"Salutation")
  end

  scenario "Display 'Salutation' box on page" do
    visit '/'
    expect(page).to have_field("Salutation")
  end
end
