programa
{
	inclua biblioteca Util --> ut
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Texto --> txt
	
	//variaveis globais
	cadeia aux
	
	funcao inicio()
	{
		cadeia frutas[10]
		inteiro total, sorteado

		total = carregaVetor(frutas)

		escreva("Foram lidas ", total, " frutas\n")
		//sortear uma fruta
		sorteado = ut.sorteia(0, total - 1)

		escreva("A fruta sorteada foi ", frutas[sorteado])
		
		
	}

	/**
	 * função para rotinas de leitura e exibição do arquivo
	 */
	funcao inteiro carregaVetor(cadeia vetor[]) {
		inteiro refArq, pos = 0
		cadeia nomeArq, linha

		limpa()

		escreva("Informe o nome do arquivo para ser lido: ")
		leia(nomeArq)

		//abre o arquivo
		refArq = arq.abrir_arquivo("./" + nomeArq, arq.MODO_LEITURA)

		//faz a leitura linha por linha do arquivo
		enquanto(nao arq.fim_arquivo(refArq)) {
			//faz a leitura de uma linha
			linha = arq.ler_linha(refArq)		

			//imprime somente se não for linha vazia
			se(txt.numero_caracteres(linha) != 0) {
				//armazena o conteudo da linha dentro do vetor recebido
				vetor[pos] = linha
				pos++ //avança uma posição
			}
		}
		
		//fechar o arquivo
		arq.fechar_arquivo(refArq)

		//devolve a quantidade de itens lidos
		retorne pos
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 413; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */