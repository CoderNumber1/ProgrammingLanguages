using System;

namespace exampleOne.Accounts
{
    public class Account
    {
        protected AccountMetadata metadata;

        protected decimal _balance;
        public decimal Balance { get { return this._balance; } }
        public string AccountHolder { get { return this.metadata.accountHolder; } }
        public string AccountNumber { get { return this.metadata.accountNumber; } }
        public double InterestRate { get { return this.metadata.interestRate; } }
        public InterestTypes InterestType { get { return this.metadata.interestType; } }

        private Account() { }
        public static Account CreateAccount(string accountHolder, double interestRate, InterestTypes interestType = InterestTypes.None)
        {
            var result = new Account();
            
            var metadata = new AccountMetadata();
            metadata.accountNumber = Guid.NewGuid().ToString();
            metadata.accountHolder = accountHolder;
            metadata.interestRate = interestRate;
            metadata.interestType = interestType;

            result.metadata = metadata;

            return result;
        }

        public virtual void Deposit(decimal deposit)
        {
            this._balance += deposit;
        }

        public virtual void Withdraw(decimal withdrawl)
        {
            this._balance -= withdrawl;
        }

        public virtual decimal EstimateBalance(int years)
        {
            decimal result = this._balance;

            switch(this.metadata.interestType)
            {
                case InterestTypes.Yearly:
                    result = this._balance * (decimal)Math.Pow(1 + this.metadata.interestRate, years);
                    break;
                case InterestTypes.Monthly:
                    result = this._balance * (decimal)Math.Pow(1 + this.metadata.interestRate/12, years * 12);
                    break;
                case InterestTypes.Quarterly:
                    result = this._balance * (decimal)Math.Pow(1 + this.metadata.interestRate/4, years * 4);
                    break;
            }

            return result;
        }
    }
}
