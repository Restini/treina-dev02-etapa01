require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_link('Acesso ao painel de vagas')
    expect(page).to have_content('BEM-VINDO ao Jobs')
    expect(page).to have_content('O maior site de empregos da América Latina')
  end
  
  scenario 'Headhunter create job' do
    Job.create!(title:'Programador', description:'Programador back-end',
                desired_skill:'Conhecimentos em Ruby on Rails',
                salary_range: 3500, level:'Superior', deadline: 30/12/2019,
                region:'São Paulo')
        
    visit root_path
    click_on('Acesso ao painel de vagas')
            
    expect(page).to have_content('Programador')
    expect(page).to have_content('Programador back-end')
    expect(page).to have_content('Conhecimentos em Ruby on Rails')
    expect(page).to have_content(3500)
    expect(page).to have_content('Superior')
    expect(page).to have_content(30/12/2019)
    expect(page).to have_content('São Paulo')
  end
end