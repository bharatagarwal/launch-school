// We want to create more than one account. Move the account creation code to a function named makeAccount that returns a new account object.

function makeAccount() {
  return {
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

var account = makeAccount();
console.log(account.deposit(15));
// 15
console.log(account.balance);
// 15
var otherAccount = makeAccount();
console.log(otherAccount.balance);
// 0