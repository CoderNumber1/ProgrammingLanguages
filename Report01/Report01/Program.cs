using exampleOne.Accounts;
using System;
using System.Collections.Generic;

namespace exampleOne
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Account> accounts = new List<Account>()
            {
                Account.CreateAccount("Karl Checking", 0.05), //Defaults to a no interest 
                Account.CreateAccount("Karl Savings", 0.12, InterestTypes.Yearly),
                Account.CreateAccount("Karl Mutual", 0.8, InterestTypes.Monthly),
                Account.CreateAccount("Karl 401K", 0.25, InterestTypes.Quarterly)
            };

            //Deposit initial balance.
            accounts.ForEach(acc => acc.Deposit(150));
            //Set accounts to their end balance.
            accounts.ForEach(acc =>
                {
                    decimal endBalance = acc.EstimateBalance(10);
                    acc.Withdraw(150);
                    acc.Deposit(endBalance);
                });
            //Display account information.
            accounts.ForEach(acc =>
                {
                    Console.WriteLine("{0,-20} - {1,30}: {2:c}", acc.AccountHolder, acc.AccountNumber, acc.Balance);
                });

            Console.ReadKey();
        }
    }
}
