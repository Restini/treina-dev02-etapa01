require 'rails_helper'

feature 'Headhunter send message' do
  scenario 'successfully' do
    HeadProfile.create!(name:'Steve Jobs', company:'CampusCode')
    ApplicantProfile.create!(name:'Steve Jobs', social_name:'Jobs',
                             date_of_birth:'30/12/2019', education:'Superior', 
                             applicant_description:'Programador', 
                             experience:'5 anos')
    Job.create!(title:'Programador', description:'Programador back-end', 
                desired_skill:'Conhecimentos em Ruby', salary_range:'4000.00',
                level:'Superior', deadline:'20/01/2021', region:'São Paulo')
    user = User.create!(email:'headhunter@headhunter.com', password:'123456', role:2)
    login_as(user, :scope => :user)
    
    visit root_path
    click_on 'Perfil'
    click_on 'Fazer proposta'
    click_on 'Criar Proposta'
    
    fill_in 'Título', with: 'Programador back-end'
    fill_in 'Texto', with: 'Entrevista marcada para 20/01/2020'
    click_on 'Enviar'

    expect(page).to have_content('Programador back-end')
    expect(page).to have_content('Entrevista marcada para 20/01/2020')
   end
end