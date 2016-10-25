The GNU Make tool (https://www.gnu.org/software/make/) is necessary to apply the automated unit tests.
For the subroutine 'fuzzifier', the test calculates the sum of of the fuzzified inputs (V, D and S)  giving a 'pass' if the sum equals 1.  For the subroutine 'rules', the test calculates the total probability of all observations (VxDxSxHS) giving a 'pass' if the sum of all probability observations equals 1.  
All other tests, apply given input values and assign a 'pass' when the output is the one expected by the test.

#### Windows users:
1. Install the GNU Make tool (preferably using the stand-alone 32- or 64-bit installers from http://www.equation.com/servlet/equation.cmd?fa=make)
2. Open the command prompt and navigate to the habfuzz/tests subfolder
3. Type 'make -f t_XXXX' (without the quotes) to run each test. For example, if you want to run the centroid unit test type 'make -f t_centroid'



To apply the tests:



If all asserts pass, your subroutine is ready to go!
