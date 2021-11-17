programa
{

	/*
	 * Faz az leitura de um arquivo texto como seguinte conteudo
	 * 
	 * flavio#viotti
	 * ana da silva#medeiros
	 * carolina#de aguiar
	 * crécio dos anjos#leite de arruda
	 * 
	 * o programa ira pegar cada uma das linhas e separar entre nome e sobre nome
	 * e gravar em dois vetores distintos
	 */
	 
	inclua biblioteca Util --> ut
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Texto --> txt
	
	//variaveis globais
	cadeia aux
	
	funcao inicio()
	{
		cadeia nome[30], sobreNome[30]
		inteiro qtdNomes = 0

		qtdNomes = separaNomes(nome, sobreNome)

		//exibir só os nomes
		para(inteiro pos=0; pos < qtdNomes; pos++) {
			escreva("\nNomes: ", sobreNome[pos])
		}

	}

	/**
	 * função para rotinas de leitura e exibição do arquivo
	 */
	funcao inteiro separaNomes(cadeia nm[], cadeia sn[]) {
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
				//faz a separação do nome e sobrenome
				inteiro hashtag, inicial, tamanho
				//procurar o caractere '#' dentro da variavel 'linha' a partir
				//da posição '0'
				inicial = 0
				tamanho = txt.numero_caracteres(linha)
				hashtag = txt.posicao_texto("#", linha, inicial)
				
				/*           1         2
				 * 01234567890123456789012
				 * carlos alberto#da silva
				 * 
				 * tamanho(qtd) = 23
				 * hashtag = 14
				 * nome = 0 -> 13 (0 -> hashtag - 1)
				 * sobreNome = 15 -> 22 (hashtag + 1 -> tamanho - 1)
				 */
				
				//pega o nome
				nm[pos] = txt.extrair_subtexto(linha, 0, hashtag)
				sn[pos] = txt.extrair_subtexto(linha, hashtag+1, tamanho)
				pos++ //avança uma posição, pois já fiz a leitura e separação do nome
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
 * @POSICAO-CURSOR = 692; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */