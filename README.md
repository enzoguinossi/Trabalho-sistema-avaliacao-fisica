# 🏋️ Sistema de Avaliação Física 2000

*(Trabalho apresentado na disciplina de **Linguagens de Programação**,  
do curso Técnico em Informática — **FAETEC**.)*

---

O **Sistema de Avaliação Física 2000** é um programa desenvolvido em **Portugol** para auxiliar no gerenciamento e análise de informações físicas de pacientes.  
Ele permite cadastrar pessoas, calcular indicadores corporais e gerar relatórios detalhados em ASCII, tornando o processo visual, organizado e fácil de interpretar.

## 🔍 Como Funciona

O sistema utiliza recursos das bibliotecas internas:

- **Tipos** — conversão e validação de dados  
- **Util** — atrasos, limpeza de tela e funcionalidades auxiliares  

O usuário interage com menus ASCII estilizados, podendo navegar entre as opções e visualizar relatórios completos.

### Durante o uso, o sistema permite:

- Navegar pelo **menu principal**
- Selecionar pacientes por ID
- Exibir relatórios formatados

Toda navegação é feita pelo console.

## 🎯 Funcionalidades

- **Cadastro de Pacientes**
  - Armazena: ID, nome, gênero, peso, altura e idade  
  - Suporta até 10 pacientes

- **Cálculo do IMC**
  - Mostra o valor numérico do Índice de Massa Corporal

- **Peso Ideal**
  - Calcula peso ideal baseado em gênero e altura  

- **Estado Nutricional**
  - Classifica o paciente em:
    - Abaixo do Peso  
    - Peso Normal  
    - Sobrepeso  
    - Obesidade Severa  
    - Obesidade Mórbida  
  - Exibe recomendações personalizadas

- **Gasto Energético Diário**
  - Pergunta o nível de atividade (Baixo / Médio / Alto)  
  - Aplica fórmulas específicas para homens e mulheres  
  - Exibe resultado em relatório ASCII

- **Relatórios Estilizados**
  - Molduras com **╔ ═ ║ ╚**  
  - Títulos organizados  
  - Informações alinhadas  

## ⚙️ Como Rodar Localmente

Para executar o sistema:

1. Abra o arquivo `.por` no **Portugol Studio**.  
2. Clique em **Executar**.  
3. Use o teclado para escolher as opções do menu.  

Todo o programa funciona diretamente no console, sem instalação adicional.

## 🛠️ Tecnologias Usadas

- **Portugol (Portugol Studio UNIVALI)**
- Biblioteca **Tipos**
- Biblioteca **Util**

---

> 🎉 **Desenvolvido por [Enzo Guinossi](https://www.linkedin.com/in/enzoguinossi/)** 🎉

