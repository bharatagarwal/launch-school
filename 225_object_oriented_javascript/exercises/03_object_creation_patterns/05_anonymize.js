// The created object should not have access to the function that anonymizes a user other than through the init and reanonymize methods. The function that anonymizes creates a 16 character sequence composed of letters and numbers.

// module pattern

// anonimysing and passwordChecking func

var Account = (function() {
  var userEmail;
  var userPassword;
  var userFirstName;
  var userLastName;

  function isValidPassword(testPassword) {
    return userPassword === testPassword;
  }

  function getRandomLetterNumber() {
    var randomIndex = Math.floor(Math.random() * 62);
    return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'[randomIndex];
  }

  function anonymize() {
    var result = '';
    var i;

    for (i = 0; i < 16; i += 1) {
      result += getRandomLetterNumber();
    }

    return result;
  }

  return {
    init: function(email, password, firstName, lastName, displayName) {
      userEmail = email;
      userPassword = password;
      userFirstName = firstName;
      userLastName = lastName;
      this.displayName = anonymize();
      return this;
    },

    reanonymize: function(password) {
      if (isValidPassword(password)) {
        this.displayName = anonymize();
        return true;
      } else {
        return 'Invalid Password';
      }
    },

    resetPassword: function(currentPassword, newPassword) {
      if (isValidPassword(currentPassword)) {
        userPassword = newPassword;
        return true;
      } else {
        return 'Invalid Password';
      }
    },

    firstName: function(password){
      if (isValidPassword(password)) {
        return userFirstName;
        return true;
      } else {
        return 'Invalid Password';
      }
    },

    lastName: function(password){
      if (isValidPassword(password)) {
        return userLastName;
        return true;
      } else {
        return 'Invalid Password';
      }
    },

    email: function(password){
      if (isValidPassword(password)) {
        return userEmail;
        return true;
      } else {
        return 'Invalid Password';
      }
    },
  };
})();