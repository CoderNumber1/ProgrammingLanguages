using System;

namespace exampleTwo
{
    class Program
    {
        static void Main(string[] args)
        {
            Int32 a = 1;
            int b = a;//Takes the value of a but not the same memmory location
            a += 2;
            b += 5;
            Console.WriteLine(a);//Prints 3
            Console.WriteLine(b);//Prints 6

            Example c = new Example("Hello");
            Example d = c;//Takes on the reference of c which means they point to the same value
            c.Value += " World";
            d.Value += " Karl";
            Console.WriteLine(c.Value);//Prints Hello World Karl
            Console.WriteLine(d.Value);//Prints Hello World Karl
            Console.ReadKey();
        }
    }

    public class Example
    {
        public string Value { get; set; }
        public Example(string value)
        {
            this.Value = value;
        }
    }
}
