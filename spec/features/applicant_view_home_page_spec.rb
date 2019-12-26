require 'rails_helper'

feature 'Applicant view home page' do
    scenario 'successfully' do
        user = User.create!(email:'applicant@applicant.com', password:'123456')
        login_as(user, :scope => :user)

        visit root_path

        expect(page).to have_link('Perfil candidato')
        expect(page).to have_content('BEM-VINDO ao Jobs')
        expect(page).to have_content('O maior site de empregos da América Latina')
    end
end
