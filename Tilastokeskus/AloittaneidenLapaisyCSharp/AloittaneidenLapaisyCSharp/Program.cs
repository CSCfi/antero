using System;
using System.Configuration;

namespace AloittaneidenLapaisyCSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            //Testaa()
            bool jatka;
            if (args.Length == 0)
                jatka = false;
            else
                jatka = true;

            var connectionString = ConfigurationManager.ConnectionStrings["VipunenTK_DW"].ConnectionString;
            Laskenta l = new Laskenta();
            l.LaskeTiivistetytRivit(connectionString, jatka);

            Console.WriteLine("Paina mitä tahansa näppäintä sulkeaksesi ikkunan");
            Console.ReadKey();            
        }
    }
}
