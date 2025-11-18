programa {
	inclua biblioteca Tipos
	inclua biblioteca Util

    // codigo, nome, genero(0=homem,1=mulher), peso(kg), altura(cm), idade
    cadeia pacientes[10][6]
    inteiro ultimoIndicePaciente = -1, ultimoCodigoPaciente = 0, opcaoEscolhida, opcaoMenu = -1, indicePacienteEscolhido = -1
    logico executando = verdadeiro
    
    funcao inicio() {
        escreva("\n\n============ SISTEMA DE AVALIAÇÃO FÍSICA 2000 ============\n\n")
        Util.aguarde(1000)

        faca {
            opcaoMenu = mostrarMenuPrincipal()
            limpa()

            escolha(opcaoMenu) {
                caso 1:
                    cadastrarPaciente()
                pare
                caso 2:
                    indicePacienteEscolhido = escolherPaciente()
                    mostrarIMC(indicePacienteEscolhido)
                pare
                caso 3:
                    indicePacienteEscolhido = escolherPaciente()
                    exibirPesoIdeal(indicePacienteEscolhido)
                pare
                caso 4:
                    indicePacienteEscolhido = escolherPaciente()
                    exibirEstadoNutricional(indicePacienteEscolhido)
                pare
                caso 5:
                	indicePacienteEscolhido = escolherPaciente()
                	exibirGastoEnergetico(indicePacienteEscolhido)
                pare
                caso 6:
                    escreva("\nEncerrando o programa...\n")
                    executando = falso
                pare
                caso contrario:
                    escreva("\n\nOpção inválida! Tente novamente.\n\n")
                    Util.aguarde(1000)
                pare
            }

        } enquanto(executando)
    }

    //=============================================================
    // ESCOLHER PACIENTE
    //=============================================================
    funcao inteiro escolherPaciente() {
        cadeia inputUsuario = ""
        inteiro idPaciente = -1, indicePacienteEncontrado = -1
        logico inputValido = falso, pacienteEncontrado = falso

        faca {
            escreva("Insira o ID do paciente a ser consultado: \n")
            leia(inputUsuario)

            se (Tipos.cadeia_e_inteiro(inputUsuario, 10)) {
                idPaciente = Tipos.cadeia_para_inteiro(inputUsuario, 10)

                se (idPaciente >= 0 e idPaciente <= ultimoCodigoPaciente) {
                    inputValido = verdadeiro
                    para(inteiro i = 0; i<=ultimoIndicePaciente;i++) {
                        se (Tipos.cadeia_para_inteiro(pacientes[i][0],10)  == idPaciente) {
                            pacienteEncontrado = verdadeiro
                            indicePacienteEncontrado = i
                            escreva("Paciente `",pacientes[i][1],"` encontrado!")
                            Util.aguarde(500)
                            retorne indicePacienteEncontrado
                        } 
                    }
                } senao {
                    escreva("\nID inexistente!\n")
                }

            } senao {
                escreva("\nA entrada foi inválida. Tente novamente.\n\n")
                Util.aguarde(1000)
            }

        } enquanto(nao inputValido ou nao pacienteEncontrado)
        limpa()
        retorne indicePacienteEncontrado
    }

    //=============================================================
    // MENU PRINCIPAL
    //=============================================================
    funcao inteiro mostrarMenuPrincipal() {
        cadeia inputOpcao
        inteiro opcao = -1
        logico valido = falso

        faca {
            escreva("+---------------------------------+\n")
            escreva("|   Sistema de avaliação física   |\n")
            escreva("+---------------------------------+\n")
            escreva("|                                 |\n")
            escreva("|  1 - Cadastrar Paciente         |\n")
            escreva("|  2 - Calcular IMC               |\n")
            escreva("|  3 - Exibir Peso Ideal          |\n")
            escreva("|  4 - Mostrar Estado Nutricional |\n")
            escreva("|  5 - Calcular Gasto Energético  |\n")
            escreva("|  6 - Sair                       |\n")
            escreva("|                                 |\n")
            escreva("+---------------------------------+\n")
            escreva("Escolha: ")
            leia(inputOpcao)

            se (Tipos.cadeia_e_inteiro(inputOpcao, 10)) {
                opcao = Tipos.cadeia_para_inteiro(inputOpcao, 10)
                valido = verdadeiro
            } senao {
                escreva("\nValor inválido! Tente novamente.\n")
                Util.aguarde(1000)
            }

        } enquanto(nao valido)

        retorne opcao
    }

    //=============================================================
    // CADASTRAR PACIENTE
    //=============================================================
    funcao vazio cadastrarPaciente(){
        limpa()
        se (ultimoIndicePaciente >= 9) {
            escreva("Limite máximo de pacientes atingido!\n")
            retorne
        }

        cadeia nome, genero, peso, altura, idade
        inteiro novoID = ultimoCodigoPaciente + 1
        inteiro indiceNovoPaciente = ultimoIndicePaciente + 1

        escreva("Digite o nome do paciente a ser cadastrado: \n")
        leia(nome)

        escreva("Insira o gênero do paciente (0=Homem, 1=Mulher): \n")
        leia(genero)

        escreva("Insira o peso do paciente (kg): \n")
        leia(peso)

        escreva("Digite a altura do paciente (cm): \n")
        leia(altura)

        escreva("Insira a idade do paciente: \n")
        leia(idade)

        pacientes[indiceNovoPaciente][0] = Tipos.inteiro_para_cadeia(novoID, 10)
        pacientes[indiceNovoPaciente][1] = nome
        pacientes[indiceNovoPaciente][2] = genero
        pacientes[indiceNovoPaciente][3] = peso
        pacientes[indiceNovoPaciente][4] = altura
        pacientes[indiceNovoPaciente][5] = idade

        ultimoCodigoPaciente++
        ultimoIndicePaciente++

        escreva("\nPaciente cadastrado com sucesso! ID = ", novoID, "\n\n")
        enterContinuar()
    }

    //=============================================================
    // IMC
    //=============================================================
    funcao vazio mostrarIMC(inteiro indicePaciente) {
        limpa()
        real imc = calcularIMC(indicePaciente)
        escreva("\nO IMC do paciente é: ", Tipos.real_para_cadeia(imc), "\n\n")
        enterContinuar()
    }

	funcao real calcularIMC(inteiro indicePaciente){
        real peso = Tipos.cadeia_para_real(pacientes[indicePaciente][3])
        real altura = Tipos.cadeia_para_real(pacientes[indicePaciente][4]) / 100
        real IMC = (peso / (altura * altura))
	    retorne IMC
	}

    //=============================================================
    // PESO IDEAL
    //=============================================================
    funcao vazio exibirPesoIdeal(inteiro indicePaciente) {

        cadeia nome = pacientes[indicePaciente][1]
        real pesoAtual = Tipos.cadeia_para_real(pacientes[indicePaciente][3])
        real pesoIdeal = calcularPesoIdeal(indicePaciente)

        real diferenca = pesoAtual - pesoIdeal
        cadeia msgFinal

        se (diferenca > 0) {
            msgFinal = ("Você deve emagrecer " + Tipos.real_para_cadeia(diferenca) + " kg.")
        } senao se (diferenca < 0) {
            msgFinal = ("Você deve ganhar " + Tipos.real_para_cadeia(-diferenca) + " kg.")
        } senao {
            msgFinal = ("Você já está no peso ideal!")
        }

        cadeia resultado = 
        ("***********************************\n" +
         "Resultados — Peso Ideal\n" +
         "***********************************\n" +
         "Paciente: " + nome + "\n" +
         "Peso Ideal: " + Tipos.real_para_cadeia(pesoIdeal) + " kg\n" +
         msgFinal + "\n" +
         "***********************************\n")

        escreva(resultado)
        enterContinuar()
    }

    funcao real calcularPesoIdeal(inteiro indicePaciente) {
        real altura = Tipos.cadeia_para_real(pacientes[indicePaciente][4])
        inteiro generoInteiro = Tipos.cadeia_para_inteiro(pacientes[indicePaciente][2], 10)
        logico genero = Tipos.inteiro_para_logico(generoInteiro)
        
        real pesoIdeal

        se (nao genero) { // homem
            pesoIdeal = ((0.75 * altura) - 62.5)
        } senao { // mulher
            pesoIdeal = ((0.675 * altura) - 56.25)
        }

        retorne pesoIdeal
    }
    //=============================================================
    // ESTADO NUTRICIONAL
    //=============================================================
    funcao vazio exibirEstadoNutricional(inteiro indicePaciente) {
        limpa()
        real imc = calcularIMC(indicePaciente)
        inteiro indiceEstado = -1

        cadeia estadosNutricionais[5][2] = {
        {"Abaixo do Peso", "Iniciar suplemento nutricional para ganho de peso"}, // < 18.5
        {"Peso Normal", "Manter dieta e atividades físicas já praticadas"},      // 18.5 a 24.9
        {"Sobrepeso", "Inicar dieta e atividades para perda de peso"},           // 25 a 29.9
        {"Obesidade Severa", "Iniciar dieta, atividades e medicação"},           // 30 a 39.9
        {"Obesidade Mórbida", "Avaliar possibilidadae cirúrgica"}}               // >= 40

        se (imc < 18.5) {
            indiceEstado = 0
        }
        senao se (imc < 25) {
            indiceEstado = 1
        }
        senao se (imc < 30) {
            indiceEstado = 2
        }
        senao se (imc < 40) {
            indiceEstado = 3
        }
        senao {
            indiceEstado = 4
        }
        
        cadeia estadoNutricional = estadosNutricionais[indiceEstado][0]
        cadeia msgFinal = estadosNutricionais[indiceEstado][1]

        cadeia resultado = 
        ("*************************************************\n" +
         "     Relatório do Estado Nutricional\n" +
         "*************************************************\n" +
         "          Paciente: " + pacientes[indicePaciente][1] + "\n" +
         "              Peso: " + pacientes[indicePaciente][3] + " kg\n" +
         "            Altura: " + pacientes[indicePaciente][4] + " cm\n" +
         "             Idade: " + pacientes[indicePaciente][5] + " anos\n" +
         "               IMC: " + imc + "\n" +
         "        Peso Ideal: " + calcularPesoIdeal(indicePaciente) + "\n" +
         "Estado Nutricional: " + estadoNutricional + "\n" +

         "*************************************************\n"+
         "    ",msgFinal + "\n" +
         "*************************************************\n")
         escreva(resultado)
         enterContinuar()
    }

    //=============================================================
    // GASTO ENERGÉTICO
    //=============================================================
    funcao vazio exibirGastoEnergetico(inteiro indicePaciente) {
        cadeia inputOpcao
        inteiro opcao = -1
        logico valido = falso
        real gastoEnergetico = 0.0

        faca {
            limpa()
            escreva("+---------------------------------------------------+\n")
            escreva("|   Insira o grau de atividade física do paciente   |\n")
            escreva("+---------------------------------------------------+\n")
            escreva("|                                                   |\n")
            escreva("|                    1 - Baixo                      |\n")
            escreva("|                    2 - Médio                      |\n")
            escreva("|                    3 - Alto                       |\n")
            escreva("|                                                   |\n")
            escreva("+---------------------------------------------------+\n")
            escreva("Escolha: ")
            leia(inputOpcao)
            se (Tipos.cadeia_e_inteiro(inputOpcao, 10)) {
                opcao = Tipos.cadeia_para_inteiro(inputOpcao, 10)
                se(opcao >= 1 e opcao <=3) {
                    valido = verdadeiro
                } senao {
                    valido = falso
                    escreva("\nValor inválido! Tente novamente.\n")
                    Util.aguarde(1000)
                }
            } senao {
                valido = falso
                escreva("\nValor inválido! Tente novamente.\n")
                Util.aguarde(1000)
            }
         } enquanto(nao valido)
         gastoEnergetico = calcularGastoEnergetico(indicePaciente, opcao)
         
         cadeia resultado = 
            ("***********************************\n" +
            "Resultado — Gasto Energético \n" +
            "***********************************\n" +
            "Paciente: " + pacientes[indicePaciente][1] + "\n" +
            "Gasto Energético: " + gastoEnergetico + "\n" +
            "***********************************\n")
         escreva(resultado)
         enterContinuar()
         
    }

    funcao real calcularGastoEnergetico(inteiro indicePaciente, inteiro nivelAtividadeFisica) {
        inteiro generoInteiro = Tipos.cadeia_para_inteiro(pacientes[indicePaciente][2], 10)
        logico genero = Tipos.inteiro_para_logico(generoInteiro)
        real pesoPaciente = Tipos.cadeia_para_real(pacientes[indicePaciente][3])
        real alturaPaciente = Tipos.cadeia_para_real(pacientes[indicePaciente][4])
        inteiro idadePaciente = Tipos.cadeia_para_inteiro(pacientes[indicePaciente][5], 10)

        real gastoEnergeticoBasal, gastoEnergeticoTotal

        cadeia listaNivelAtividadeFisica[3][2] = 
        {
        {"Baixo", "1.3"},
        {"Medio", "1.5"},
        {"Alto", "1.7"}
        }

        real fatorAtividadeFisica = Tipos.cadeia_para_real(listaNivelAtividadeFisica[nivelAtividadeFisica - 1][1])

        se (nao genero) { // homem
            gastoEnergeticoBasal = ((13.75 * pesoPaciente) + (5 * alturaPaciente) - (6.77 * idadePaciente) + 66.5)
        } senao { // mulher
            gastoEnergeticoBasal = ((9.56 * pesoPaciente) + (1.85 * alturaPaciente) - (4.68 * idadePaciente) + 65.71)
        }

        gastoEnergeticoTotal = (gastoEnergeticoBasal * fatorAtividadeFisica)

        retorne gastoEnergeticoTotal
    }

    //=============================================================
    // UTIL
    //=============================================================
    funcao vazio enterContinuar() {
        cadeia lixo
        escreva("\n\nPressione ENTER para continuar...")
        leia(lixo)
        limpa()
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 13094; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */