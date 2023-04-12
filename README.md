# Change Date

This program was created as part of an assignment for a second year Computer Science paper at Massey University. 

## Synopsis

Write a Haskell function that takes a date and an offset as parameters and returns the date
that is a certain number of days before or after the input date. The number of days is given
by the offset parameter.


## Top-level function

The top-level function must have the following function declaration:
```bash
adjust_date :: (Int, Int, Int) -> Int -> (Int, Int, Int)
```
The first parameter is a tuple that specifies a day, month and year, e.g. (24, 4, 1959).
The date must be a valid date between (1, 1, 1600) and (31, 12, 3000). The
second parameter specifies an offset between -25 and 25. 

If the offset is negative, then
the resulting date is before the given date; if it is positive, the resulting date is after the
given date. For example, if the date is (24, 4, 1959) and the offset is 9, then the
resulting date is (3, 5, 1959). On the other hand, if the offset is -5, then the resulting
date is (19, 4, 1959).
The top-level function may call other Haskell functions to achieve the task.
