programa
{
	inclua biblioteca Sons --> som
	
	funcao inicio()
	{
		inteiro som
		cadeia res
		
		som = som.carregar_som("./01. Rolling in the deep.mp3")
		
		som.reproduzir_som(som, verdadeiro)

		escreva("\nTecle algo...")
		leia(res)

		som.interromper_som(som)

		escreva("\nTecle algo...")
		leia(res)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 309; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */