Dado('que acesso a página de cadastro') do
    visit "https://cac-tat.s3.eu-central-1.amazonaws.com/index.html"
   
end
  
Quando('submeto o meu cadastro completo') do
    find("#firstName").set "Augusto"
    find("#lastName").set "Arandiba"
    find("#email").set "augustoarandiba@gmail.com"
    find("#open-text-area").set "Teste"
    
    click_button "Enviar"


end
  
Então('sou redirecionado para o Dashboard') do
    expect(page).to have_content ("Mensagem enviada com sucesso.")
    
end

Quando('submeto o meu cadastro sem o nome') do
    find("#lastName").set "Arandiba"
    find("#email").set "augustoarandiba@gmail.com"
    find("#open-text-area").set "Teste"

    click_button "Enviar"

    
end
  
  Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
    expect(page).to have_content ("Valide os campos obrigatórios!")
    
end

Quando('submeto o meu cadastro sem o email') do
    find("#firstName").set "Augusto"
    find("#lastName").set "Arandiba"
    find("#open-text-area").set "Teste"

    click_button "Enviar"
  end
  
  Então('vejo a mensagem de alerta: Oops. Informe um email válido!') do
    expect(page).to have_content ("Valide os campos obrigatórios!")
    sleep 5
  end