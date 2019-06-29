function makeBank() {
  let accountNumber = 101;
  let accounts = [];

  return {
    number: accountNumber,
    accounts: function() { return accounts; },
    openAccount: function() {
      let account = makeAccount(accountNumber);
      accounts.push(account);

      accountNumber += 1;
      
      return account;
    },

    transfer: function(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    },
  };
}

function makeAccount(number) {
  let accountNumber = number;
  let accountBalance = 0;
  let accountTransactions = [];

  return {
    number: function() {
      return accountNumber;
    },

    balance: function() {
      return accountBalance;
    },

    transactions: function() {
      return accountTransactions;
    },
  
    deposit: function(value) {
      accountBalance += value;
      
      accountTransactions.push({type: 'deposit', amount: value});
      return value;
    },

    withdraw: function(value) {
      if (accountBalance - value <= 0) {
        value = accountBalance;
      } 

      accountBalance -= value;

      accountTransactions.push({type: 'withdraw', amount: value});
      return value;
    },
  };
}

var bank = makeBank();
var account = bank.openAccount();
console.log(account.balance());
// 0
console.log(account.deposit(17));
// 17
var secondAccount = bank.openAccount();
console.log(secondAccount.number());
// 102
console.log(account.transactions());
// [Object]