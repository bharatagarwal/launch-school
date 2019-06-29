// Add a withdraw method to the account object that takes a single argument, the amount to withdraw. It should subtract the amount from the account's balance and return the amount subtracted.

var account = {
  balance: 0,
  
  deposit: function(value) {
    this.balance += value;
    return value;
  },

  withdraw: function(value) {
    if (this.balance - value <= 0) {
      var withdrawnAmount = this.balance;
      this.balance = 0;
      return withdrawnAmount;
    } else {
      this.balance -= value;
      return value;
    }
  },
};

account.deposit(100);
console.log(account.balance);
// 100
console.log(account.withdraw(19));
// 19
console.log(account.balance);
// 81

console.log(account.withdraw(91));
// 81
console.log(account.balance);
// 0