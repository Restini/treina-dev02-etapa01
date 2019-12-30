require 'rails_helper'

feature 'Applicant send message' do
  scenario 'successfully' do
    HeadProfile.create!(name:'Steve Jobs', company:'CampusCode')
    ApplicantProfile.create!(name:'Steve Jobs', social_name:'Jobs',
                             date_of_birth:'30/12/2019', education:'Superior', 
                             applicant_description:'Programador', 
                             experience:'5 anos')
    Job.create!(title:'Programador', description:'Programador back-end', 
                desired_skill:'Conhecimentos em Ruby', salary_range:'4000.00',
                level:'Superior', deadline:'30/12/2019', region:'São Paulo')
    user = User.create!(email:'applicant@applicant.com', password:'123456', role:3)
    login_as(user, :scope => :user)
    
    visit root_path
    click_on 'Perfil candidato'
    click_on 'Fazer proposta'
    click_on 'Criar Proposta'
    
    fill_in 'Título', with: 'Programador back-end'
    fill_in 'Texto', with: 'Aceito sua proposta'
    click_on 'Enviar'

    expect(page).to have_content('Programador back-end')
    expect(page).to have_content('Aceito sua proposta')
   end
end
