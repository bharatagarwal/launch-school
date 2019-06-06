let invoices = {
  unpaid: [],
}

console.log(invoices);

invoices.add = function(name, amount) {
  this.unpaid.push({
    name: name,
    amount: amount,
  });
};

invoices.totalDue = function() {
  let total = 0;

  this.unpaid.forEach(el => {
    total += el.amount;
  });

  return total;
};

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);

console.log(invoices.totalDue());

invoices.paid = [];

console.log(invoices);

invoices.payInvoice = function(name) {
  let unpaid = [];

  for (let i = 0; i < this.unpaid.length; i += 1) {
    if (this.unpaid[i].name === name) {
      this.paid.push(this.unpaid[i]);
    } else {
      unpaid.push(this.unpaid[i]);
    }
  }

  this.unpaid = unpaid;
}

console.log(invoices);

invoices.totalPaid = function() {
  let total = 0;

  this.paid.forEach(el => {
    total += el.amount;
  });

  return total;
};

invoices.payInvoice('Slough Digital');
invoices.payInvoice('Due North Development');

console.log(invoices.totalPaid());
console.log(invoices.totalDue());

