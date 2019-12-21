require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_link('Perfil')
    expect(page).to have_content('BEM-VINDO ao Jobs')
    expect(page).to have_content('O maior site de empregos da América Latina')
  end
  
  scenario 'Headhunter create perfil' do
    visit head_profiles_path
    
    click_on('Criar perfil')
    fill_in 'Nome', with: 'Steve Jobs'
    fill_in 'Empresa', with: 'CampusCode'
    click_on('Enviar')  
    
    expect(page).to have_content('Steve Jobs')
    expect(page).to have_content('CampusCode')
  end
end