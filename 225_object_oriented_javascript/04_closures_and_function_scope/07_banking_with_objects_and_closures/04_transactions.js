// Each account should have a record of every deposit and withdrawal applied to it. To do this, add a property named transactions to account that contains an array of transactions, each of which is an object with type and amount properties.

var account = {
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


console.log(account.deposit(23));
// 23
console.log(account.transactions);
// [{...}]
console.log(account.transactions[0]);
// {type: "deposit", amount: 23}