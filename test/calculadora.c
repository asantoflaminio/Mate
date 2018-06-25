int main(){
    char operador;
    int primerNumero;
    int segundoNumero;
    int salir;

    do {

        printf("Elegí un operador (+, -, *, /, %): ");
        scanf("%s", &operador);

        printf("Escribí dos números: \n");
        printf("Escribí el primer número: ");
        scanf("%d" ,&primerNumero);
        printf("Escribí el segundo número: ");
        scanf("%d",&segundoNumero);

        switch(operador)
        {
            case '+':
                printf("%d + %d = %d\n" , primerNumero, segundoNumero, primerNumero+segundoNumero);
                break;

            case '-':
                printf("%d - %d = %d\n" , primerNumero, segundoNumero, primerNumero-segundoNumero);
                break;

            case '*':
                printf("%d * %d = %d\n" , primerNumero, segundoNumero, primerNumero*segundoNumero);
                break;

            case '/':
                if(segundoNumero==0) {
                    printf ("El segundo numero ingresado fue cero y NO SE PUEDE DIVIDIR POR CERO!!!!!!\n");
                }
                else {
                    printf("%d / %d = %d\n" , primerNumero, segundoNumero, primerNumero/segundoNumero);
                }
                break;

            case '%':
                printf("%d % %d = %d\n" , primerNumero, segundoNumero, primerNumero%segundoNumero);
                break;

            default:
                printf("Le pifiaste al operador hermano!\n");
        }

    printf("Queres seguir usando la calculadora? Presioná 1 para salir: ");
    scanf("%d", &salir);

    } while(salir!=1);
}
