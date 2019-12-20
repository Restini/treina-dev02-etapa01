require 'rails_helper'

feature 'Headhunter view apply' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_link('Candidatos cadastrados')
  end
  
  scenario 'Applicant fill_in form' do
    Job.create!(title:'Programador', description:'Programador back-end',
                desired_skill:'Conhecimentos em Ruby on Rails',
                salary_range: 3500, level:'Superior', deadline: 30/12/2019,
                region:'São Paulo')
    ApplicantProfile.create!(name:'Steve Jobs', social_name:'Steve',
                             date_of_birth:30/12/1960, education:'Superior',
                             applicant_description:'Programador', 
                             experience:'5 anos')
    
    visit applicant_profiles_path
    click_on('Vagas')
    click_on('Efetuar inscrição')
    fill_in 'Nome', with: 'Steve Jobs'
    fill_in 'Email', with: 'test@test.com'
    select 'Programador', from: 'Vagas'
    click_on('Enviar')  
    
    expect(page).to have_content('Steve Jobs')
    expect(page).to have_content('test@test.com')
    expect(page).to have_content('Programador')
  end

end
