// Add a new method to the bank object that transfers money from one account to another.

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

    transfer: function(source, destination, amount) {
      // source.balance -= amount;
      // destination.balance += amount;
      // return amount;
      return destination.deposit(source.withdraw(amount));
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
var source = bank.openAccount();
console.log(source.deposit(10));
// 10
var destination = bank.openAccount();
console.log(bank.transfer(source, destination, 7));
// 7
console.log(source.balance);
// 3
console.log(destination.balance);
// 7