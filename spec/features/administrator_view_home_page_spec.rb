require 'rails_helper'

feature 'Administrator view home page' do
  scenario 'successfully' do
    visit root_path
    
    expect(page).to have_content('Jobs | treina-dev02-etapa01')
  end 
    
  scenario 'Administrator do login' do
    user = User.create!(email:'admin@admin.com', password:'123456')
    login_as(user, :scope => :user)

    visit root_path

    expect(page).to have_link('Controle de acesso')
    expect(page).to have_content('BEM-VINDO ao Jobs')
    expect(page).to have_content('O maior site de empregos da América Latina')
  end
  
  scenario 'Administrator see message error' do
    user = User.create!(email:'admin@admin.com', password:'123456')
    login_as(user, :scope => :user)

    visit root_path
    click_on('Perfil')
    
    expect(page).to have_content('Usuário não autorizado.')
  end

  scenario 'Administrator visit control_users successfully' do
    user = User.create!(email:'admin@admin.com', password:'123456', role:1)
    login_as(user, :scope => :user)

    visit root_path
    click_on('Controle de acesso')
    
    expect(page).to have_link('Home')
    expect(page).to have_link('Sair')
    expect(page).to have_content('E-mail')
    expect(page).to have_content('Role')    
  end
end
