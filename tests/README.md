#Under development

Each test has been named according to the relevant subroutine, which is to be tested.  
For the 'fuzzifier' subroutine, the test calculates the sum of of the fuzzified inputs (separately for V, D and S)  giving a 'pass' if the sum equals 1.  
For the 'rules' subroutine, the test calculates the total probability of all observations (VxDxSxHS) giving a 'pass' if the sum of all probability observations equals 1.  
All other tests, apply given input values and give a 'pass' when the output is the one expected by the test.

To apply the tests:



If all asserts pass, your subroutine is ready to go!
