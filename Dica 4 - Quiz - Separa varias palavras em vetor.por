programa
{
	inclua biblioteca Texto --> txt
/*	
 * 	Solicite do usuário uma string com no máximo 10 palavras. Para separar cada 
 * 	palavra o usuário usará o caractere '#'. Faça um programa que receba essa string 
  * 	e coloque cada uma das palavras dentro de um vetor de 10 elementos no máximo

	Exemplo de entrada: 
	banana#pedra#casa#pedreiro#comida#pele#materia#teclado#mouse#monitor

 */
	funcao inicio()
	{
		cadeia frase
		cadeia palavras[10]

		frase = "banana#pedra#casa#pedreiro#comida#pele#materia#teclado#mouse#monitor"
		//chamada para a funcao
		separaNomes(frase, "#", palavras)

		/*escreva("\n", txt.extrair_subtexto(frase, 0, 6))
		escreva("\n", txt.extrair_subtexto(frase, 7, 12))
		escreva("\n", txt.extrair_subtexto(frase, 13, 17))
		escreva("\n", txt.extrair_subtexto(frase, 18, 26))
		escreva("\n", txt.extrair_subtexto(frase, 27, 33))
		escreva("\n", txt.extrair_subtexto(frase, 34, 38))
		escreva("\n", txt.extrair_subtexto(frase, 39, 46))
		escreva("\n", txt.extrair_subtexto(frase, 47, 54))
		escreva("\n", txt.extrair_subtexto(frase, 55, 60))
		escreva("\n", txt.extrair_subtexto(frase, 61, txt.numero_caracteres(frase)))
		*/
		
		//exibir as palavras da frase
		para(inteiro ind=0; ind < 10; ind++) {
			escreva("\n", palavras[ind])				  		
		}
		
	}

	/**
	 * função para rotinas de leitura e exibição do arquivo
	 */
	funcao separaNomes(cadeia texto, cadeia caractereSeparador, cadeia vetor[]) {

		inteiro indice=0
		
		/*
		 * Lógica: achar o primeiro # a partir da posição 0
		 * depois entrar em loop e procurar o caractere # a partir da
		 * do ultimo # encontrado + 1

          1         2         3         4         5         6                 
0123456789012345678901234567890123456789012345678901234567890123456789
banana#pedra#casa#pedreiro#comida#pele#materia#teclado#mouse#monitor
		 
		 */
		
		inteiro hashtag, inicial, tamanho, ultimoHashtag = 0
		//procurar o caractere '#' dentro da variavel 'linha' a partir
		//da posição '0'
		inicial = 0
		tamanho = txt.numero_caracteres(texto)
		
		//abre um laço infinito
		enquanto (verdadeiro) {
			//acha a ocorrencia do caractereSeparador
			hashtag = txt.posicao_texto(caractereSeparador, texto, inicial)

			//se não encontrar o caractereSeparador encerra o loop
			se(hashtag == -1) {
				pare
			}
			
			//escreva("\nO caractere ", caractereSeparador, " está na posição ", 
			//	   hashtag)

			//escreva("\n", txt.extrair_subtexto(texto, inicial, hashtag))
			vetor[indice] = txt.extrair_subtexto(texto, inicial, hashtag)
			indice++

			//guarda o valor do ultimo hashtag
			ultimoHashtag = hashtag
			
			//avança o valor inicial para o próximo caracrere depois do encontrado
			inicial = hashtag + 1
		}

		//mostra a ultima palavra
		//escreva("\n", txt.extrair_subtexto(texto, ultimoHashtag+1, tamanho))
		vetor[indice] = txt.extrair_subtexto(texto, ultimoHashtag+1, tamanho)
		
		/*           1         2
		 * 01234567890123456789012
		 * carlos alberto#da silva
		 * 
		 * tamanho(qtd) = 23
		 * hashtag = 14
		 * nome = 0 -> 13 (0 -> hashtag - 1)
		 * sobreNome = 15 -> 22 (hashtag + 1 -> tamanho - 1)
		 */
				
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1193; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */