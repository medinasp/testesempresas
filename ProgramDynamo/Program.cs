using System.Collections.Generic;
using System;

namespace programDynamo
{
    class Program
    {
        static void Main(string[] args)
        {      
            //Construa um algoritmo (não é necessário usar uma linguagem específica, pode ser pseudo-código) 
            //que permite entrar números até que se tenha 7 números pares ou 10 números negativos. Depois indicar 
            //do total de números lidos quantos foram ímpares, quantos foram pares, quantos foram positivos e maiores
            // que 100 e quantos foram negativos

            int i = 0;
            int n = i + 1;
            int ipar = 0;
            int ineg = 0;

            List<int> list = new List<int>();
            List<int> listpar = new List<int>();
            List<int> listneg = new List<int>();
            List<int> listpos100 = new List<int>();

            while (i < n)
            {
                Console.WriteLine("Entre com um número");
                int e = int.Parse(Console.ReadLine());

                list.Add(e);
                int p = e % 2;

                if (p == 0) 
                {
                    ipar++;
                    listpar.Add(e);
                    if (ipar > 6)
                    {
                        // Console.WriteLine("Lista Par");
                        // foreach (int listapar in listpar)
                        // {
                        //     Console.WriteLine(listapar);
                        // }
                        n = i;
                    }
                }

                if (e < 0) 
                {
                    ineg++;
                    listneg.Add(e);
                    if(ineg > 9)
                    {
                        // Console.WriteLine("");                        
                        // Console.WriteLine("Lista Negativos");
                        // foreach(int listaneg in listneg)
                        // {
                        //     Console.WriteLine(listaneg);                            
                        // }

                        // Console.WriteLine("Lista Geral");
                        // foreach(int listaGeral in list)
                        // {
                        //     Console.WriteLine(listaGeral);                            
                        // }
                        n = 1;
                    }
                }

                if (e > 99)
                {
                    listpos100.Add(e);
                }
                i++;
                n++;
            }
                Console.WriteLine();
                Console.WriteLine();
                int total = list.Count;
                Console.WriteLine("total de números");
                Console.WriteLine(total);
                Console.WriteLine();

                int pares = listpar.Count;                      
                Console.WriteLine("Total Numeros Pares: ");
                Console.WriteLine(pares);
                Console.WriteLine();

                int impares = list.Count - listpar.Count;
                Console.WriteLine("Total Numeros Impares: ");
                Console.WriteLine(impares);                       
                Console.WriteLine();

                int negativos = listneg.Count;
                Console.WriteLine("total de números negativos");
                Console.WriteLine(negativos);
                Console.WriteLine();

                int positmais100 = listpos100.Count;
                Console.WriteLine("Total de positivos maiores que 100");
                Console.WriteLine(positmais100);
                Console.WriteLine();
        }
   }
}