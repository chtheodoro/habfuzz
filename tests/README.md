Each test has been named according to the relevant subroutine, which is to be tested.  
For the 'fuzzifier' subroutine, the test calculates the sum of of the fuzzified inputs (separately for V, D and S) and giving a 'pass' if the sum equals 1.  
For the 'rules' subroutine, the test calculates the total probability of all observations (VxDxSxHS) and giving a 'pass' if the sum of all probability observations equals 1.  
All other tests, apply given input values and give a 'pass' when the output is the one expected by the test.

To apply the tests:

1. Put the test (e.g. test_centroid.f95), along with its relevant driver file (test_centroid_driver.f95) in a separate folder of your choice  
2. Copy the files fdeclarations.f95 and the relevant subroutine (e.g. centroid.f95) from the 'habfuzz' subfolder and paste them to the previous folder  
3. Copy and paste fruit.f95 from the 'tests' subfolder to the previous folder  

You should have all the files in the same folder (e.g. fdeclarations.f95, centroid.f95, fruit.f95, test_centroid.f95, test_centroid_driver.f95)

Compile the files IN THE FOLLOWING ORDER (using gfortran and naming your executable e.g. test_centroid):
gfortran -o test_centroid fdeclarations.f95 fruit.f95 test_centroid.f95 test_centroid_driver.f95 centroid.f95

Or in a more general style
gfortran -o filename fdeclarations.f95 fruit.f95 test_XXXX.f95 test_XXXX_driver.f95 XXXX.f95

ONLY for 'fuzzifier' subroutine, you additionally need to copy the files 'velocities.txt', 'substrates.txt' and 'depths.txt' from the 'tests_input_10' subfolder and paste them into your folder together with the other files.

If all asserts pass, your subroutine is ready to go!
