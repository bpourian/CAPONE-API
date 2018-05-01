feature 'Home Page Features' do

  context "Home Page Connection" do
    scenario "Homepage status code to be '200'" do
      visit '/'
      expect(page.status_code).to eq 200
    end
  end

  context "Home Page Text" do
    scenario "Page title to be displayed" do
      visit '/'
      expect(page).to have_content("Capital Oneder citizenship page")
    end
  end

  context "Salutation input on homepage" do
    scenario "Page to have input tag 'Salutation' present" do
      visit '/'
      expect(page).to have_selector("//input", :id =>"Salutation")
    end

    scenario "Display 'Salutation' box on page" do
      visit '/'
      expect(page).to have_field("Salutation")
    end
  end

  context "First Name input on homepage" do
    scenario "Page to have input tag 'First Name' present" do
      visit '/'
      expect(page).to have_selector("//input", :id =>"First_Name")
    end

    scenario "Display 'First Name' box on page" do
      visit '/'
      expect(page).to have_field("First Name")
    end
  end

  context "Last Name input on homepage" do
    scenario "Page to have input tag 'Last Name' present" do
      visit '/'
      expect(page).to have_selector("//input", :id =>"Last_Name")
    end

    scenario "Display 'Last Name' box on page" do
      visit '/'
      expect(page).to have_field("Last Name")
    end
  end

  context "Previous Country input on homepage" do
    scenario "Page to have input tag 'Previous Country' present" do
      visit '/'
      expect(page).to have_selector("//input", :id =>"Previous_Country")
    end

    scenario "Display 'Previous Country' box on page" do
      visit '/'
      expect(page).to have_field("Previous Country")
    end
  end

  context "Gender input on homepage" do
    scenario "Page to have input tag 'Gender' present" do
      visit '/'
      expect(page).to have_selector("//input", :id =>"Gender")
    end

    scenario "Display 'Gender' box on page" do
      visit '/'
      expect(page).to have_field("Gender")
    end
  end

  context "Submit button on homepage" do
    scenario "Page to have 'Submit' button" do
      visit '/'
      expect(page).to have_selector(:link_or_button, 'Submit')
    end
  end

  context "Fill in form and submit" do
    scenario "Visit 'Homepage' and fill in form" do
      visit_index_and_fill_in_form
      expect(page).to have_content("Congratulations, you are now a citizen of Capital Oneder")
    end
  end
end
