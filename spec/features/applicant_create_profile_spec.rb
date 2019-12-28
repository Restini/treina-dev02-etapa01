require 'rails_helper'

feature 'Applicant create profile' do
    scenario 'Applicant create profile' do
        user = User.create!(email:'applicant@aplicant.com', password:'123456', role:3)
        login_as(user, :scope => :user)

        visit root_path
        click_on('Perfil candidato')
        click_on('Criar perfil')
        fill_in 'Nome', with: 'Steve Jobs'
        fill_in 'Nome social', with: 'Jobs'
        fill_in 'Data de aniversário', with: '30/12/2019'
        fill_in 'Educação', with: 'Superior'
        fill_in 'Descrição', with: 'Programador'
        fill_in 'Experiência', with: '5 anos'
        click_on('Enviar')  

        expect(page).to have_content('Steve Jobs')
        expect(page).to have_content('Jobs')
        expect(page).to have_content(30/12/2019)
        expect(page).to have_content('Superior')
        expect(page).to have_content('Programador')
        expect(page).to have_content('5 anos')
    end
end
