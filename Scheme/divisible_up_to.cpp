#include <iostream>
using namespace std;


void divisibleUpTo(int);

int main(int argc, char const *argv[])
{
    int num;
    cout << "Dame el numero ";
    cin >> num;
    divisibleUpTo(num);
    return 0;
}

void divisibleUpTo(int num){
    int resultado_final = 0;
    int resultado = 0;
    int cont = num;
    for(int i = num; i > 0; i--)
    {
        for (int x = i; x > 0; x--)
        {
            resultado = i*x;
            if (resultado % i == 0)
            {
                resultado_final += resultado;
            }
        }
    }
    cout << resultado_final << endl;
}
