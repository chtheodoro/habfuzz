Test application instructions:

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
