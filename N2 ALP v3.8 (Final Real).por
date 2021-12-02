programa
{
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Util --> ut
	inclua biblioteca Texto --> txt

	cadeia perguntaspTema[100][100]
	cadeia corpo[100][7]
	cadeia temas[10]
	inteiro order[11], ramdom[11] 
	inteiro resJogador, contador, vResp, a
	cadeia linha
	cadeia resp
	inteiro refArq, pos = 0, aux = 0
	inteiro escTema, qtdTema = 0, qtdPerg = 0
	inteiro cont = 0
	inteiro conta = 0
	inteiro pipe, inicial, tamanho
	inteiro teste = 0
	inteiro pontos = 0
	
	funcao inicio()
	{
		lerArq()
		intro()
		jogo()
			
	}
	funcao lerArq()
	{
		refArq = arq.abrir_arquivo("./QUIZ.txt", arq.MODO_LEITURA)

		enquanto(nao arq.fim_arquivo(refArq)) 
		{
			//faz a leitura de uma linha
			linha = arq.ler_linha(refArq)		
			se(txt.numero_caracteres(linha) != 0) 
			{

				//procurar o caractere '│' dentro da variavel 'linha' a partir
				//da posição '0'
				inicial = 0
				tamanho = txt.numero_caracteres(linha)
				pipe = txt.posicao_texto("|", linha, inicial)
				
				corpo[pos][0] = txt.extrair_subtexto(linha, inicial, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
	
				se(nao procura(temas, txt.extrair_subtexto(linha, aux, pipe))) 
				{
					temas[conta] = txt.extrair_subtexto(linha, aux, pipe)
					corpo[pos][1] = txt.extrair_subtexto(linha, aux, pipe)
					aux = pipe + 1
					pipe = txt.posicao_texto("|", linha, aux)
					conta++	
					teste = 0
				} senao
					{
						corpo[pos][1] = txt.extrair_subtexto(linha, aux, pipe)
						teste++
						aux = pipe + 1
						pipe = txt.posicao_texto("|", linha, aux)
						
					}
					
				//perguntaspTema[teste][conta - 1] = corpo[pos][0]

				corpo[pos][2]= txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				
				corpo[pos][3] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				
				corpo[pos][4] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				
				corpo[pos][5] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				
				corpo[pos][6] = txt.extrair_subtexto(linha, aux, tamanho)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				pos++ //avança uma posição, pois já fiz a leitura e separação do nome
				
			}
		}
	}

	funcao intro()
	{
		escreva("\n===============>Quiz Sensacional!!<===============\n")
		escreva("\t\tQuiz da N2 de ALP\n")
	}

	funcao jogo()
	{
		contador = 1
		inteiro num = 0
		
		para(cont; cont<100; cont++)
		{	
			se (temas[cont] == "")	
			{
				pare
			}	

			escreva("[", num, "]", temas[cont],"\n")
			num++
			qtdTema++

		}
		
		escreva("Olá, Qual destes temas você gostaria de jogar ?: ")
		leia(escTema)  
		
		escreva("\n----------------------------------------------------------\n")
		
			para(inteiro cont2 = 0; cont2 <100; cont2++)
			{
				se(temas[escTema] == corpo[cont2][1]) 
				{
					qtdPerg++
				}
			}

			// guarda todas perguntas do tema escolhido na matriz 'perguntaspTema' 
			inteiro li = 0
			para (inteiro cont1 = 0; cont1 < 100; cont1++) 
			{
				
				se (corpo[cont1][0] != "")
				{
					se(corpo[cont1][1] == temas[escTema])
					{		
						para (inteiro col = 0; col < 7; col++)
						{
							perguntaspTema[li][col] = corpo[cont1][col]
						}
						li++
					}
				}
			}
			
			escolha(escTema)
			{
				caso escTema: 
					escreva("Você escolheu: ", temas[escTema], "!\n\n")

					aleatorio() 

					inteiro cont1 = 0
					enquanto (ramdom[cont1] != 0) /* só termina quando chega no final do vetor random */
					{
						inteiro ordem = 0	
							
						ordem = ramdom[cont1] - 1 /* como o código tem q procurar desde o começo até achar o arquivo e o vetor random é de 1 a 10 
											    tem q fazer -1 pq o índice começa com zero */
																
						escreva(perguntaspTema[ordem][0], "\n") //pergunta
						escreva("[1]", perguntaspTema[ordem][3],"\n") // alt. 1
						escreva("[2]", perguntaspTema[ordem][4],"\n") // alt. 2
						escreva("[3]", perguntaspTema[ordem][5],"\n") // alt. 3
						escreva("[4]", perguntaspTema[ordem][6],"\n") // alt. 4
						escreva("Resposta: ")
						leia(resp)
	
						se(perguntaspTema[ordem][2] == " " + resp + " ") //Se a resposta estiver correta 
						{
							escreva("\nACERTOU!\n")
							pontos = pontos + 100
							escreva("Você colocou: ", resp)
											
						}senao
						{
							escreva("\nERROU :(\n")
							escreva("Você colocou: ", resp, " a correta era a resposta", perguntaspTema[ordem][2])
						}
					escreva("\n----------------------------------------------------------\n")
					cont1++
				}
			}
		escreva("\tSua pontuação total foi de: ", pontos, " pontos.")	
	}




	funcao aleatorio() 
	{
		inteiro n = 0, number

		enquanto(nao (ramdom[qtdPerg - 1] != 0))
		{
			number = ut.sorteia(1,qtdPerg)//sorteia entre todas as perguntas tem 
			se(nao procura_ordem(ramdom, number)) 
			{
				ramdom[n] = number
				n++
			}
		}
	}

	funcao logico procura_ordem(inteiro ordem[], inteiro n)
	{
		para(inteiro i = 0; i < ut.numero_elementos(ordem); i++)
		{
			se(ordem[i] == n)
			{
				retorne verdadeiro 
			}
		}
		retorne falso
	}
				

	funcao logico procura(cadeia vetor[], cadeia itemProcurar) // Função que lê se as matérias estão repetidas
	{
		
		para(inteiro ct = 0; ct< 10; ct++) 
		{
			se(vetor[ct] == itemProcurar) 
			{
				retorne verdadeiro
			}
		}
		//não achou ninguem
		retorne falso
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4541; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {perguntaspTema, 7, 8, 14}-{ramdom, 10, 20, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */