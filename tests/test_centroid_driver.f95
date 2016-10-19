! Copyright (c) 2005-2010, 2012-2013, Andrew Hang Chen and contributors,
! All rights reserved.
! Licensed under the 3-clause BSD license.

program test_centroid_driver
  use fruit
  use test_centroid
  use fruit_util
  call init_fruit                  !in f95, subroutine name limited to 31 characters
  call centroid_test_based_on_known_values
  call fruit_summary
  call fruit_finalize
end program test_centroid_driver
