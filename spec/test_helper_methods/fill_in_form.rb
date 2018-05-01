def visit_index_and_fill_in_form
  visit '/'
  fill_in :Salutation, with: 'Mr'
  fill_in :First_Name, with: 'Benjamin'
  fill_in :Last_Name, with: 'Pourian'
  fill_in :Previous_Country, with: 'UK'
  fill_in :Gender, with: 'Male'
  click_button 'Submit'
end
