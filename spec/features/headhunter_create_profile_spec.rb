require 'rails_helper'

feature 'Headhunter create profile' do
    scenario 'Applicant create profile' do
        user = User.create!(email:'headhunter@headhunter.com', password:'123456', role:2)
        login_as(user, :scope => :user)

        visit root_path
        click_on('Perfil')
        click_on('Criar perfil')
        fill_in 'Nome', with: 'Steve Jobs'
        fill_in 'Empresa', with: 'CampusCode'
        click_on('Enviar')  

        expect(page).to have_content('Steve Jobs')
        expect(page).to have_content('CampusCode')
    end
end
