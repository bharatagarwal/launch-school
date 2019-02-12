Create a Sinatra application that fulfills the following requirements. Include this application in a ZIP file and attach it when submitting your assessment.

Write a Sinatra route that accepts a POST to /payments/create, using the following form as a starting point:

```
<form action="search" method="GET">
  <p>
    <label>First name:
      <input type="text" />
    </label>
  </p>
  <p>
    <label>Last name:
      <input type="text" />
    </label>
  </p>
  <p>
    <label>Card number:
      <input type="text" />
    </label>
  </p>
  <p>
    <label>Expiration Date:
      <input type="text" />
    </label>
  </p>
  <p>
    <label>CCV:
      <input type="text" />
    </label>
  </p>
  <button type="submit">Submit</button>
</form>
```

If any values are missing, re-render the form. The submitted values should be displayed in the appropriate input, and there should be a message indicating which values were missing. These errors messages should only be shown when a user has attempted to submit the form, and certain values are missing from the form input.

Add a validation to ensure the card number being submitted is 16 characters long. If it not, display an error message and redisplay the form, retaining submitted values.

If all of the values in the form are filled out and the card number is the correct length when the form is submitted, redirect the user to a page showing all payments. On that page, display the message "Thank you for your payment." The payment that was just submitted should also be represented (see #5).

The page showing all payments should list the following information for all successfully submitted payments: the user's full name, when the payment was made, the last four digits of the credit card number, and the card's expiration date. The credit card number should be displayed in the following format: `****-****-****-1234.`

You can use the following markup as the basis for this page:
```
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Created</th>
      <th>Card Number</th>
      <th>Expiration Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>John Smith</td>
      <td>2016-02-15 11:30:19 -0800</td>
      <td>****-****-****-1111</td>
      <td>12/2018</td>
    </tr>
  </tbody>
</table>
```

When the payments list page is reloaded, the "Thank You" message should disappear, but the list of payments should remain.

If the user navigates to the root path ("/"), then the session should be reset. This should ensure that all payments are reset, and that the current user is treated as a new user.