
namespace exampleOne.Accounts
{
    public enum InterestTypes { None, Yearly, Quarterly, Monthly }

    public struct AccountMetadata
    {
        public string accountNumber;
        public string accountHolder;
        public double interestRate;
        public InterestTypes interestType;
    }
}
