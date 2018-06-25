int main(){
    char operador;
    float primerNumero;
    float segundoNumero;
    int salir;

    do {

        printf("Elegí un operador (+, -, *, /): ");
        scanf("%s", &operador);

        printf("Escribí dos números: \n");
        printf("Escribí el primer número: ");
        scanf("%f" ,&primerNumero);
        printf("Escribí el segundo número: ");
        scanf("%f",&segundoNumero);

        switch(operador)
        {
            case '+':
                printf("%f + %f = %f\n" , primerNumero, segundoNumero, primerNumero+segundoNumero);
                break;

            case '-':
                printf("%f - %f = %f\n" , primerNumero, segundoNumero, primerNumero-segundoNumero);
                break;

            case '*':
                printf("%f * %f = %f\n" , primerNumero, segundoNumero, primerNumero*segundoNumero);
                break;

            case '/':
                if(segundoNumero==0) {
                    printf ("El segundo numero ingresado fue cero y NO SE PUEDE DIVIDIR POR CERO!!!!!!\n");
                }
                else {
                    printf("%f / %f = %f\n" , primerNumero, segundoNumero, primerNumero/segundoNumero);
                }
                break;

            default:
                printf("Le pifiaste al operador hermano!\n");
        }

    printf("Queres seguir usando la calculadora? Presioná 1 para salir: ");
    scanf("%d", &salir);

    } while(salir!=1);
}
