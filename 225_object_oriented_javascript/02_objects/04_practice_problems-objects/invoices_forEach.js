let invoices = {
  unpaid: [],
}


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

invoices.paid = [];

invoices.payInvoice = function(name) {
  let unpaid = [];

  this.unpaid.forEach(invoice => {
    if (invoice.name === name) {
      this.paid.push(invoice);
    } else {
      unpaid.push(invoice);
    }
  });

  this.unpaid = unpaid;
}

invoices.totalPaid = function() {
  let total = 0;

  this.paid.forEach(el => {
    total += el.amount;
  });

  return total;
};

console.log('paid:')
console.log(invoices.totalPaid());
console.log('due:')
console.log(invoices.totalDue());
console.log();

invoices.payInvoice('Slough Digital');

console.log('paid:')
console.log(invoices.totalPaid());
console.log('due:')
console.log(invoices.totalDue());