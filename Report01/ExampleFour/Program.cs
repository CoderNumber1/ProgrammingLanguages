using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExampleFour
{
    public delegate void CompletedEventHandler(object sender, EventArgs e);

    class Program
    {
        static void Main(string[] args)
        {
            EventManager manager = new EventManager();
            manager.complete += SuccessCompleteHandler;//We use one property to register events, but they are handled differently based on the attribute attached.
            manager.complete += FailureCompleteHandler;

            manager.DoStuff();//This first time will fail and our failure handler will be called.
            manager.DoStuff();//This will succeed and success handler will be called.
            Console.ReadKey();
        }

        [SuccessEvent]//Only handles successfull events.
        static void SuccessCompleteHandler(object sender, EventArgs e)
        {
            Console.WriteLine("The event succeeded.");
        }

        [FailureEvent]//Only handles failed events.
        static void FailureCompleteHandler(object sender, EventArgs e)
        {
            Console.WriteLine("The event failed.");
        }
    }

    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
    public class EventRegistrationBase : Attribute
    {
        private bool? _success = null;
        public bool? Success{get{return _success;}set{_success = value;}}
        public EventRegistrationBase() { this.Setup(); }
        protected virtual void Setup(){this.Success = null;}
    }

    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
    public class SuccessEvent : EventRegistrationBase
    {
        public SuccessEvent() : base() { }
        protected override void Setup()
        {
            base.Success = true;
        }
    }

    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
    public class FailureEvent : EventRegistrationBase
    {
        public FailureEvent() : base() { }
        protected override void Setup()
        {
            base.Success = false;
        }
    }

    public class EventManager
    {
        bool succeeded = false;
        private event CompletedEventHandler success;
        private event CompletedEventHandler failure;
        public event CompletedEventHandler complete
        {
            add
            {
                var passFails = value.Method.GetCustomAttributes(typeof(EventRegistrationBase), true);//Using more reflection to get what type of event this delegate handles.
                EventRegistrationBase passFail = passFails.Any() ? passFails.First() as EventRegistrationBase : null;
                if (passFail != null && passFail.Success == true)
                    this.success += value;
                else if (passFail != null && passFail.Success == false)
                    this.failure += value;
                else
                    throw new InvalidOperationException("Invalid event type registration.");//No support for general event handling, only pass/fail

                EchoEventRegistration(passFail.Success == true ? "Success" : "Failure");//This method is only called if we are in DEBUG mode.
            } 
            remove
            {
                var passFails = value.Method.GetCustomAttributes(typeof(EventRegistrationBase), true);
                EventRegistrationBase passFail = passFails.Any() ? passFails.First() as EventRegistrationBase : null;
                if (passFail != null && passFail.Success == true)
                    this.success -= value;
                else if (passFail != null && passFail.Success == false)
                    this.failure -= value;
                else
                    throw new InvalidOperationException("Invalid event type registration.");
            }
        }

        public void DoStuff()
        {
            if (!succeeded)
                this.failure(this, new EventArgs());
            else
                this.success(this, new EventArgs());

            this.succeeded = true;
        }

        [Conditional("DEBUG")]//This method only compiles if we are in DEBUG mode.
        public static void EchoEventRegistration(string eventType)
        {
            Console.WriteLine("{0} type of event was registered", eventType);
        }
    }
}
