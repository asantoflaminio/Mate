int main(){
    char operador;
    int primerNumero;
    int segundoNumero;

    printf("Elegí un operador (+, -, *, /): ");
    scanf("%s", &operador);

    printf("Escribí dos números: \n");
    printf("Escribí el primer número: ");
    scanf("%d" ,&primerNumero);
    printf("Escribí el segundo número: ");
    scanf("%d",&segundoNumero);

    switch(operador)
    {
        case '+':
            printf("%d + %d = %d" , primerNumero, segundoNumero, primerNumero+segundoNumero);
            break;

        case '-':
            printf("%d - %d = %d" , primerNumero, segundoNumero, primerNumero-segundoNumero);
            break;

        case '*':
            printf("%d * %d = %d" , primerNumero, segundoNumero, primerNumero*segundoNumero);
            break;

        default:
            printf("Le pifiaste al operador hermano!");
    }
}
