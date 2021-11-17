programa
{
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Util --> ut
	inclua biblioteca Texto --> txt

	cadeia perguntas[100], respostaCerta[100]
	cadeia respostas[100][4]
	cadeia materia[100]
	inteiro resJogador, contador
	cadeia linha
	inteiro refArq, pos = 0, aux = 0
		
	funcao inicio()
	{
		refArq = arq.abrir_arquivo("./QUIZ.txt", arq.MODO_LEITURA)

		escreva("Quiz da N2 de ALP\n")

		enquanto(nao arq.fim_arquivo(refArq)) {
			//faz a leitura de uma linha
			linha = arq.ler_linha(refArq)		
			se(txt.numero_caracteres(linha) != 0) {
				//faz a separação do nome e sobrenome
				inteiro pipe, inicial, tamanho
				//procurar o caractere '│' dentro da variavel 'linha' a partir
				//da posição '0'
				inicial = 0
				tamanho = txt.numero_caracteres(linha)
				pipe = txt.posicao_texto("|", linha, inicial)
				aux = pipe + 1
				
				perguntas[pos] = txt.extrair_subtexto(linha, inicial, pipe)
				pipe = txt.posicao_texto("|", linha, aux)
				materia[pos] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				respostaCerta[pos] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				respostas[pos][0] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				respostas[pos][1] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				respostas[pos][2] = txt.extrair_subtexto(linha, aux, pipe)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				respostas[pos][3] = txt.extrair_subtexto(linha, aux, tamanho)
				aux = pipe + 1
				pipe = txt.posicao_texto("|", linha, aux)
				pos++ //avança uma posição, pois já fiz a leitura e separação do nome
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 775; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {perguntas, 7, 8, 9}-{respostaCerta, 7, 24, 13}-{respostas, 8, 8, 9}-{materia, 9, 8, 7}-{contador, 10, 21, 8}-{linha, 11, 8, 5}-{aux, 12, 26, 3}-{pipe, 25, 12, 4}-{inicial, 25, 18, 7}-{tamanho, 25, 27, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */