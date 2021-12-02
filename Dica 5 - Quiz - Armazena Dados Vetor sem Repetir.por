programa
{
	/*
	*
	* Rotina que solicita do usuário algumas palavras(frutas) e armazena em um 
	* vetor somente as frutas sem repetição.
	* Vetor com no máximo 10 elementos
	* 
	*/
	funcao inicio()
	{
		cadeia frutas[10]
		cadeia palavra, resp
		inteiro qtdFrutas = 0

		faca {

			escreva("Informe uma Fruta: ")
			leia(palavra)

			se(nao procura(frutas, palavra)) {
				frutas[qtdFrutas] = palavra
				qtdFrutas++
			}
			
			escreva("Digitar outra Fruta (S/N)? ")
			leia(resp)
		} enquanto (resp == "S" e qtdFrutas < 10)

		//listar as frutas sem repeticao
		para(inteiro aux=0; aux < qtdFrutas; aux++) {
			escreva("\nFruta: ", frutas[aux])
		}
	}

	/*
	 * retorna verdadeiro se achou, e falso se não achou
	 */
	funcao logico procura(cadeia vetor[], cadeia itemProcurar) {
		
		para(inteiro cont=0; cont < 10; cont++) {
			se(vetor[cont] == itemProcurar) {
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
 * @POSICAO-CURSOR = 334; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */