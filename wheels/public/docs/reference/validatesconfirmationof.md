```coldfusion
// Make sure that the user has to confirm their password correctly the first time they register (usually done by typing it again in a second form field)
validatesConfirmationOf(property="password", when="onCreate", message="Your password and its confirmation do not match. Please try again.");
```