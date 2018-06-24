int main(){
    char operador;
    int primerNumero;
    int segundoNumero;

    printf("Elegí un operador (+, -, *, /): ");
    scanf("%s", &operador);

    printf("Escribí dos números: ");
    scanf("%d %d",&primerNumero, &segundoNumero);

    switch(operador)
    {
        case '+':
            printf("%d" , primerNumero );
            break;

        case '-':
            printf("%d" , primerNumero );
            break;

        case '*':
            printf("%d" , primerNumero );
            break;

        case '/':
            printf("%d" , primerNumero );
            break;

        default:
            printf("Le pifiaste al operador hermano!");
    }
}
