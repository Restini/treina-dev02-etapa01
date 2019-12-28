require 'rails_helper'

feature 'Applicant view home page' do
  scenario 'successfully' do
    visit root_path
    
    expect(page).to have_content('Jobs | treina-dev02-etapa01')
  end 
    
  scenario 'Applicant do login' do
    user = User.create!(email:'applicant@aplicant.com', password:'123456')
    login_as(user, :scope => :user)

    visit root_path

    expect(page).to have_link('Perfil candidato')
    expect(page).to have_content('BEM-VINDO ao Jobs')
    expect(page).to have_content('O maior site de empregos da América Latina')
  end
  
  scenario 'Applicant see message error' do
    user = User.create!(email:'applicant@aplicant.com', password:'123456')
    login_as(user, :scope => :user)

    visit root_path
    click_on('Perfil candidato')
    
    expect(page).to have_content('Usuário não autorizado.')
  end

  scenario 'Applicant visit profile successfully' do
    user = User.create!(email:'applicant@aplicant.com', password:'123456', role:3)
    login_as(user, :scope => :user)

    visit root_path
    click_on('Perfil candidato')
    
    expect(page).to have_link('Criar perfil')
  end
end
