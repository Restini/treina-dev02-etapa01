require 'rails_helper'

feature 'Headhunter see message' do
  scenario 'successfully' do
    HeadProfile.create!(name:'Steve Jobs', company:'CampusCode')
    ApplicantProfile.create!(name:'Steve Jobs', social_name:'Jobs',
                             date_of_birth:'30/12/2019', education:'Superior', 
                             applicant_description:'Programador', 
                             experience:'5 anos')
    Job.create!(title:'Programador', description:'Programador back-end', 
                desired_skill:'Conhecimentos em Ruby', salary_range:'4000.00',
                level:'Superior', deadline:'30/12/2019', region:'São Paulo')
    Proposal.create!(title:'Programador back-end',body:'Aceito sua proposta')
    user = User.create!(email:'headhunter@headhunter.com', password:'123456', role:2)
    login_as(user, :scope => :user)
    
    visit root_path
    click_on 'Perfil'
    
    expect(page).to have_content('Contra-proposta recebida')
    expect(page).to have_content('Programador back-end')
    expect(page).to have_content('Aceito sua proposta')
    expect(page).to have_content('Comentário recebido')
   end
end