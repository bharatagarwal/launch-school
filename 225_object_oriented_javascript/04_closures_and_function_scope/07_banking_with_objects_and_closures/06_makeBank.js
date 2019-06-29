// We also need an object to manage accounts: a bank. Create a function that returns an object that represents a bank. The bank should have a property named accounts that represents a list of accounts.

function makeBank() {
  return {
    accounts: [],
  };
}

var bank = makeBank();
bank.accounts;
// []