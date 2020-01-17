require 'rails_helper'

feature 'Applicant apply for job' do
  scenario 'successfully' do
    ApplicantProfile.create!(name:'Steve Jobs', social_name:'Jobs',
                             date_of_birth:'30/12/2019', education:'Superior', 
                             applicant_description:'Programador', 
                             experience:'5 anos')
    Job.create!(title:'Programador', description:'Programador back-end', 
                desired_skill:'Conhecimentos em Ruby', salary_range:'4000.00',
                level:'Superior', deadline:'20/01/2021', region:'São Paulo')
    user = User.create!(email:'applicant@applicant.com', password:'123456', role:3)
    login_as(user, :scope => :user)
    
    visit root_path
    click_on 'Perfil candidato'
    click_on 'Vagas'
    click_on 'Enviar'
    
    fill_in 'Nome', with: 'Steve Jobs'
    fill_in 'Email', with: 'applicant@applicant.com'
    select 'Programador', from: 'Vaga'
    click_on 'Enviar'

    expect(page).to have_content('Steve Jobs')
    expect(page).to have_content('applicant@applicant.com')
    expect(page).to have_content('Programador')
   end
end