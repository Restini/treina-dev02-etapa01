require 'rails_helper'

feature 'Applicant see message' do
  scenario 'successfully' do
    HeadProfile.create!(name:'Steve Jobs', company:'CampusCode')
    ApplicantProfile.create!(name:'Steve Jobs', social_name:'Jobs',
                             date_of_birth:'20/01/2020', education:'Superior', 
                             applicant_description:'Programador', 
                             experience:'5 anos')
    Job.create!(title:'Programador', description:'Programador back-end', 
                desired_skill:'Conhecimentos em Ruby', salary_range:'4000.00',
                level:'Superior', deadline:'20/01/2021', region:'São Paulo')
    HeadProposal.create!(title:'Programador back-end', body:'Entrevista marcada
                         para 20/01/2020')
    user = User.create!(email:'applicant@applicant.com', password:'123456', role:3)
    login_as(user, :scope => :user)
    
    visit root_path
    click_on 'Perfil candidato'
    
    expect(page).to have_content('Proposta recebida')
    expect(page).to have_content('Programador back-end')
    expect(page).to have_content('Entrevista marcada para 20/01/2020')
    expect(page).to have_content('Comentário recebido')
   end
end