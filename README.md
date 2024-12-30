#SweetAlert4Delphi

SweetAlert4Delphi é um componente para Delphi que simula as funcionalidades do famoso SweetAlert da web, permitindo criar alertas elegantes e dinâmicos em aplicações Delphi de forma simples e intuitiva.

##Configuração do Projeto

**Adicione as units ao projeto:**
Inclua os arquivos necessários no seu projeto Delphi.

**Inclua a unit AlertManager apenas onde for usar:**

uses
  AlertManager;

**Métodos e Uso**

A classe TAlertManager oferece métodos para exibir diferentes tipos de alertas. Veja os exemplos abaixo:

1. **Confirmação de Ação**

Use o método Confirm para solicitar uma confirmação do usuário antes de executar uma ação.

if TAlertManager.Instance.Confirm('Sair do sistema?', 'Deseja realmente continuar?') = mrOk then
begin
  // Executa a ação
end;

2. **Alerta Simples**

Exiba uma mensagem de alerta para o usuário:

TAlertManager.Instance.Alert('Atenção', 'Pendências precisam ser ajustadas!');

3. **Erro**

Informe ao usuário que ocorreu um erro:

TAlertManager.Instance.Error('Oopss!', 'Encontramos um erro!');

4. **Sucesso**

Exiba uma mensagem de sucesso após uma operação bem-sucedida:

TAlertManager.Instance.Success('Hoo! Parabéns', 'Operação executada com sucesso!');

**Benefício**s

Interface amigável e elegante para comunicação com o usuário.

Fácil integração com aplicações Delphi.

Métodos simples e intuitivos para exibir diferentes tipos de mensagens.

**Instalação**

Adicione os arquivos do componente ao seu projeto.

Certifique-se de incluir a unit AlertManager no uses apenas onde os alertas serão usados.

Compile e aproveite os alertas estilizáveis na sua aplicação.

**Exemplo Completo**

Segue um exemplo prático de uso dos principais métodos:

uses
  AlertManager;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if TAlertManager.Instance.Confirm('Sair do sistema?', 'Deseja realmente continuar?') = mrOk then
  begin
    TAlertManager.Instance.Success('Hoo! Parabéns', 'Você saiu do sistema com sucesso!');
  end
  else
  begin
    TAlertManager.Instance.Alert('Atenção', 'Operação cancelada pelo usuário.');
  end;
end;

**Licença**

Este componente é distribuído sob a licença MIT. Consulte o arquivo LICENSE para mais informações.

Aproveite o SweetAlert4Delphi para melhorar a experiência do usuário nas suas aplicações!
