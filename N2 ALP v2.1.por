programa
{
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Util --> ut
	inclua biblioteca Texto --> txt

	cadeia perguntas[100], respostaCerta[100]
	cadeia perguntaspTema[100][100]
	cadeia respostas[100][5]
	cadeia materia[10]
	inteiro resJogador, contador, vResp, a
	cadeia linha
	cadeia resp
	inteiro refArq, pos = 0, aux = 0
	inteiro escTema, pontos
	inteiro cont = 0
	inteiro conta = 0
	inteiro pipe, inicial, tamanho
	inteiro teste = 0
	
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
				
				perguntas[pos] = txt.extrair_subtexto(linha, inicial, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)

				se(txt.numero_caracteres(linha) != 0) 
				{	
					se(nao procura(materia, txt.extrair_subtexto(linha, aux, pipe))) 
					{
						materia[conta] = txt.extrair_subtexto(linha, aux, pipe)
						aux = pipe + 1
						pipe = txt.posicao_texto("|", linha, aux)
						conta++	
						teste = 0
					} senao
						{
							teste++
							aux = pipe + 1
							pipe = txt.posicao_texto("|", linha, aux)
							
						}
					perguntaspTema[conta - 1][teste] = perguntas[pos]

				}
				
				respostas[pos][0]= txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				
				respostas[pos][1] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				
				respostas[pos][2] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				
				respostas[pos][3] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				
				respostas[pos][4] = txt.extrair_subtexto(linha, aux, tamanho)
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
			se (materia[cont] == "")	
			{
				pare
			}	

			escreva("[", num, "]", materia[cont],"\n")
			num++

		}
		
		escreva("Olá, Qual destes temas você gostaria de jogar ?: ")
		leia(escTema)  
		
		escreva("\n----------------------------------------------------------\n")
		
		para(cont = 0; cont <100; cont++)
		{
			escolha(escTema)
			{
				caso cont: 
					escreva("Você escolheu: ", materia[cont], "!\n")

					
					 para(inteiro cont1 = 0; cont1 <100; cont1++) 
					{
						se(txt.numero_caracteres(perguntaspTema[escTema][cont1]) != 0)
						{		
							escreva(perguntaspTema[escTema][cont1], "\n") 


							
							escreva("[1]", respostas[cont1][1],"\t\t")
							escreva("[2]", respostas[cont1][2],"\n")
							escreva("[3]", respostas[cont1][3],"\t")
							escreva("[4]", respostas[cont1][4],"\t\n")
							escreva("Resposta: ")
							leia(resp)

							se(resp == respostas[cont1][0])
							{
								escreva("xxxx")
							}
						}senao
						escreva("Sua pontuação foi: ")
					}					
			}
		}
		
			
		
		





			
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
 * @POSICAO-CURSOR = 3152; 
 * @DOBRAMENTO-CODIGO = [164];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {respostaCerta, 7, 24, 13}-{perguntaspTema, 8, 8, 14}-{respostas, 9, 8, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */