require 'rails_helper'

feature 'Headhunter register job' do
  scenario 'successfully' do
    HeadProfile.create!(name:'Steve Jobs', company:'CampusCode')    
    user = User.create!(email:'headhunter@headhunter.com', password:'123456', role:2)
    login_as(user, :scope => :user)
    
    visit root_path
    click_on 'Perfil'
    click_on 'Acesso ao painel de vagas'
    click_on 'Criar vaga'

    fill_in 'Título', with: 'Programador'
    fill_in 'Descrição', with: 'Programador back-end'
    fill_in 'Habilidades desejadas', with: 'Conhecimentos em Ruby'
    fill_in 'Faixa Salarial', with: '4000.00'
    fill_in 'Nível', with: 'Superior'
    fill_in 'Data limite', with: '30/12/2019'
    fill_in 'Região', with: 'São Paulo'
    click_on 'Enviar'

    expect(page).to have_content 'Programador'
    expect(page).to have_content 'Programador back-end'
    expect(page).to have_content 'Conhecimentos em Ruby'
    expect(page).to have_content  4000.00
    expect(page).to have_content 'Superior'
    expect(page).to have_content  30/12/2019
    expect(page).to have_content 'São Paulo'
  end
end