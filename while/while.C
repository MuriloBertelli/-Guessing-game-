#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{

    printf("**********************************\n");
    printf("*Bem vindo ao jogo de adivinhacao*\n");
    printf("**********************************\n");

    int segundos = time(0);
    srand(segundos);

    int numerogrande = rand();


    int numerosecreto = numerogrande % 100 ;
    int chutes;
    int tentativas = 1;
    double pontos = 1000;

    while (1)
    {
        printf("Tentativa %d\n", tentativas);
        printf("Qual e o seu chute? ");
        scanf("%d", &chutes);
        printf("Seu chute foi %d\n", chutes);

        if (chutes < 0)
        {
            printf("VALORES NEGATIVOS NAO SAO ACEITOS!\n");
            continue;
        }

        int acertou = (chutes == numerosecreto);
        int maior = chutes > numerosecreto;

        if (acertou)
        {
            printf("Parabens, voce acertou o numero!\n");
            break;
        }

        else if (maior)
        {
            printf("Seu chute foi maior que o numero secreto\n");
        }
        else
        {
            printf("Seu chute foi menor que o numero secreto\n");
        }
        tentativas++;
        double pontos_perdidos = abs(chutes - numerosecreto) / (double)2;
        pontos = pontos - pontos_perdidos;
    }
    printf("FIM DE JOGO\n");
    printf("Voce acertou na tentativa %d\n", tentativas);
    printf("Total de pontos recebidos %.1f\n", pontos);
}