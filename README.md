# Teste Técnico GDM

Este repositório contém a implementação do teste técnico para a GDM. O projeto foi desenvolvido utilizando Flutter, seguindo boas práticas de arquitetura limpa (Clean Architecture) e inspirado no padrão MVVM (Model-View-ViewModel).

## Demonstração

[Tela Inicial](https://github.com/user-attachments/assets/12eb838d-54bf-442f-b313-4bf9ec388932)
[Imagens da suíte](![image](https://github.com/user-attachments/assets/0846a773-714d-4e43-93ca-fb22fc1941b3)
)

🎥 **Veja o projeto em funcionamento:** [Assista ao vídeo]((https://drive.google.com/drive/folders/1nv1Ng2l7s-DHafleBOcBUtoyY5IdqsFO?usp=sharing))

## Tecnologias e Bibliotecas Utilizadas

As seguintes bibliotecas foram utilizadas no projeto:

- **flutter_modular**: Gerenciamento de rota e injeção de dependência modular.
- **http**: Requisições HTTP.
- **provider**: Gerenciamento de estado.
- **toggle_switch**: Componente para alternância de opções.
- **flutter_dotenv**: Gerenciamento de variáveis de ambiente.
- **cached_network_image**: Carregamento e cache de imagens remotas.

## Desenvolvimento e Testes

Para garantir a qualidade do código, utilizei ferramentas de testes unitários com:

- **build_runner**: Geração de código.
- **mocktail**: Mocking para testes.
- **modular_test**: Testes para flutter_modular.

## Especificações da Tela

O projeto foi desenvolvido e testado utilizando o emulador **Pixel 3a** com **Android 13** e não possui responsividade.  

### Configurações do Emulador:
- **Dispositivo**: Pixel 3a  
- **Resolução**: 1080x2220 pixels  
- **Densidade**: 440 dpi  
- **Versão do Android**: API 33 (Android 13)  

## Como Executar o Projeto

1. Clone este repositório:
   ```sh
   git clone https://github.com/seu-usuario/teste_gdm.git
   cd teste_gdm
   ```
2. Instale as dependências:
   ```sh
   flutter pub get
   ```
3. Configure as variáveis de ambiente no arquivo `.env`.
4. Execute o projeto:
   ```sh
   flutter run
   ```

## Considerações Finais

O projeto foi desenvolvido buscando simplicidade, manutenibilidade e boas práticas de arquitetura. Feedbacks são bem-vindos!

---

Se precisar de alguma modificação ou adaptação, é só avisar! 🚀
