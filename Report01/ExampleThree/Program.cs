using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ExampleThree
{
    class Program
    {
        static void Main(string[] args)
        {
            Cleaner simpleCleaner = new Cleaner();
            //Boxing occurs here to box the Cleaner into a more generic object type.
            TryCauseMayhem(simpleCleaner);
            TryCleanup(simpleCleaner);

            MayhemCauser simpleMayhem = new MayhemCauser();
            TryCauseMayhem(simpleMayhem);
            TryCleanup(simpleMayhem);

            IClean catHatClean = new CatHat();
            ICauseMahem catHatMayhem = catHatClean as ICauseMahem;//This works because cat hat implements both interfaces.
            TryCauseMayhem(catHatClean);//These will both work because of the multiple interface implementation.
            TryCleanup(catHatMayhem);

            ThingOne thingOne = new ThingOne();
            TryCauseMayhem(thingOne);
            TryCleanup(thingOne);

            ThingTwo thingTwo = new ThingTwo();
            TryCauseMayhem(thingTwo);
            TryCleanup(thingTwo);

            Console.ReadKey();
        }

        static void TryCauseMayhem(object mayhemCauser)
        {
            Console.WriteLine("mayhemCauser is a {0}", mayhemCauser.GetType().Name);
            if (typeof(ICauseMahem).IsAssignableFrom(mayhemCauser.GetType()))
            {
                try
                {
                    //Here we un-box the mayhem causer back to a usable type.
                    ICauseMahem castedCauser = (ICauseMahem)mayhemCauser;
                    castedCauser.PerformMayhem();
                }
                catch(MayhemException mayhem)
                {
                    Console.WriteLine("Broken spectacularly!");
                }
                catch
                {
                    Console.WriteLine("It wasn't mayhem, but at least it broke in a mess");
                }
            }
            else
                Console.WriteLine("We couldn't cause any mayhem");
        }

        static void TryCleanup(object cleaner)
        {
            Console.WriteLine("cleaner is a {0}", cleaner.GetType().Name);
            if (typeof(IClean).IsAssignableFrom(cleaner.GetType()))
            {
                try
                {
                    MethodInfo cleanupMethod = cleaner.GetType().GetMethod("Cleanup");
                    cleanupMethod.Invoke(cleaner, null);//We are using reflection here to invoke the cleanup method without un-boxing.
                }
                catch
                {
                    Console.WriteLine("Not a very successfull cleanup.");
                }
            }
            else
                Console.WriteLine("This thing is just causing a bigger mess.");
        }
    }

    public class ThingOne : MayhemCauser
    {
        public override bool PerformMayhem()
        {
            try
            {
                return base.PerformMayhem();
            }
            catch(Exception ex)
            {
                if (ex is MayhemException)
                {
                    Console.WriteLine("Mayhem Success!");
                    return true;
                }
                else
                    return false;
            }
        }
    }

    public class ThingTwo : Cleaner, ICauseMahem
    {
        public bool PerformMayhem()
        {
            Console.WriteLine("I solemly swear that I am up to no good.");
            return true;
        }

        public override bool Cleanup()
        {
            Console.WriteLine("I'm not terribly good at the cleanup part.");
            return false;
        }
    }

    public class CatHat : ICauseMahem, IClean
    {
        public bool PerformMayhem()
        {
            Console.WriteLine("Let's make a mess.");
            return true;
        }

        public bool Cleanup()
        {
            Console.WriteLine("Quick, cleanup before the parents are home.");
            return true;
        }
    }

    public interface ICauseMahem
    {
        bool PerformMayhem();
    }

    public interface IClean
    {
        bool Cleanup();
    }

    public class MayhemCauser : ICauseMahem
    {
        public virtual bool PerformMayhem()
        {
            throw new MayhemException("I've caused havoc!");
        }
    }

    public class Cleaner : IClean
    {
        public virtual bool Cleanup()
        {
            Console.WriteLine("The mess is no more.");
            return true;
        }
    }

    public class MayhemException : Exception
    {
        public MayhemException() : base() { }
        public MayhemException(string message) : base(message) { }
        public MayhemException(string message, Exception innerException) : base(message, innerException) { }
    }
}
