## Automated unit tests

The tests work only with version 1. For testing the newer versions, a benchmark dataset will be soon provided.

The GNU Make tool (https://www.gnu.org/software/make/) is necessary to apply the automated unit tests.

For the subroutine 'fuzzifier', the test calculates the sum of the fuzzified inputs (V, D and S)  giving a 'pass' if the sum equals 1. For the subroutine 'rules', the test calculates the total probability of all observations (VxDxSxHS) giving a 'pass' if the sum of all probability observations equals 1.

All other tests, apply given input values and assign a 'pass' when the output is the one expected by the test.

#### Windows users:
1. Install the GNU Make tool (preferably using the stand-alone 32- or 64-bit installers from http://www.equation.com/servlet/equation.cmd?fa=make)
2. Open the command prompt and navigate to the habfuzz/tests subfolder
3. Type 'make -f t_xxxx' (without the quotes) to run each test. For example, if you want to run the centroid unit test type 'make -f t_centroid'

#### OS X users:
1. The GNU Make tool is already included in Xcode, so there is nothing more to do than
2. Open the terminal and navigate to the habfuzz/tests directory
3. Type 'make -f t_xxxx' (without the quotes) to run each test. For example, if you want to run the centroid unit test type 'make -f t_centroid'

#### Linux users:
1. If the GNU Make tool is not already included in your operating system, type 'sudo apt-get install make' to download and install it
2. Navigate to the habfuzz/tests directory
3. Type 'make -f t_xxxx' (without the quotes) to run each test. For example, if you want to run the centroid unit test type 'make -f t_centroid'

If all asserts pass, your subroutine is ready to go!  

WARNING! The test for the subroutine 'fuzzifier' uses the three input files located in the tests_input folder, so don't change anything in that folder 
