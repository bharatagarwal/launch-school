// Add a deposit method to the account object that takes a single argument, the value of the deposit. Add the value of the deposit to the account's balance, and then return it.

var account = {
  balance: 0,
  deposit: function(value) {
    this.balance += value;
    return value;
  }
};


console.log(account.balance);
// = 0
console.log(account.deposit(42));
// = 42
console.log(account.balance);
// = 42