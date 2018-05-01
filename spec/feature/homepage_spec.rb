feature 'Home Page' do
  scenario "Homepage status code to be '200'" do
    visit '/'
    expect(page.status_code).to eq 200
  end
end
