// Add a new method named openAccount to the object returned by makeBank. It should create a new account, add it to the bank's accounts collection, and return the new account. Each new account should have a unique account number, starting at 101; each account number should be one greater than the previous account created.

function makeBank() {
  let accountNumber = 101;

  return {
    accounts: [],
    number: accountNumber,
    openAccount: function() {
      let account = makeAccount(accountNumber);

      this.accounts.push(account);

      accountNumber += 1;
      return account;
    },
  };
}

function makeAccount(number) {
  return {
    number: number,
    balance: 0,
    transactions: [],
  
    deposit: function(value) {
      this.balance += value;
      
      this.transactions.push({type: 'deposit', amount: value});
      return value;
    },

    withdraw: function(value) {
      if (this.balance - value <= 0) {
        value = this.balance;
      } 

      this.balance -= value;

      this.transactions.push({type: 'withdraw', amount: value});
      return value;
    },
  };
}

var bank = makeBank();
var account = bank.openAccount();
console.log(account.number);
// 101
console.log(bank.accounts);
// [{...}]
console.log(bank.accounts[0]);
// {number: 101, balance: 0, transactions: Array[0]}
var secondAccount = bank.openAccount();
console.log(secondAccount.number);
// 102