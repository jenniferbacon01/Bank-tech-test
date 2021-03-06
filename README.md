# Bank tech test

## Specification
An irb application to record transactions and then print them on a statement. The application can
- Receive Deposits
- Take Withdrawals
- Print a Statement

Comments
-----
I have structured the application into three classes with the following responsibilities:
Bank: To receive and record transactions.
Transaction: To receive a date and an amount on instantiation. To format this information into a string.
Statement: To return the statement string including balances and titles.

How to Install
-----
In your command line type the following:
To clone this repository:
````
  $ git clone https://github.com/jenniferbacon01/Bank-tech-test
````
To install all the relevant gems:
````
  $ bundle install
````

How to Run
-----
Copy and paste bank.rb and transaction.rb from the Bank-tech-test/lib directory into irb and then enter the following to add a transaction and see a statement:
````
  > bank = Bank.new
  > trans = Transaction.new("01/01/2017", 1000)
  > bank.receive(trans)
  > bank.print
````
You should see:

```
date || credit || debit || balance
01/01/2017 || 1000.00 || || 1000.00
```

How to Test
-----
Run unit tests in your command line by typing:
````
  $ rspec
````
Tests are available to view in Bank-tech-test/spec directory.  
