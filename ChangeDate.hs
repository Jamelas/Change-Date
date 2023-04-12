-- 20019829    Jamie Douglas
-- Assignment 1

-- Function to change the date from a given input
adjust_date :: (Int, Int, Int) -> Int -> (Int, Int, Int)
adjust_date (d, m, y) offset

    -- Check for invalid input
    | offset > 25 || offset < (-25) = error "Error: The offset value must be in the range of -25 and 25"
    | y > 3000    || y < 1600       = error "Error: The year must be in the range of 1600 and 3000"
    | m > 12      || m < 1          = error "Error: The month must be in the range of 1 and 12"
    | d > 31      || d < 1          = error "The number of days for this month is invalid"
  
    
    -- Go to previous month
    | ((d + offset) < 1) = subtract_month (d, m, y) offset
    
    -- Advance to the next (30 day) month
    | ((d + offset) > 30) && (m == 4 || m == 6 ||m ==  9 || m == 11)  && d > 30 = error "The number of days for this month is invalid"
    | ((d + offset) > 30) && (m == 4 || m == 6 ||m ==  9 || m == 11)  = (d + offset - 30, m + 1, y)
    
    -- Advance to the next (31 day) month
    | ((d + offset) > 31) && (m == 1 || m == 3 || m == 5 || m == 7 || m == 10) = (d + offset - 31, m + 1, y)
    
    -- Advance to January (next year)
    | ((d + offset) > 31) && m == 12                  = (d + offset -31, 1, y + 1)
    
    -- Advance from February to March
    | ((d + offset) > is_leapyear y) && m == 2 && d > is_leapyear y = error "The number of days for this month is invalid"
    | ((d + offset) > is_leapyear y) && m == 2    = (d + offset - is_leapyear y, 3, y)
    
    -- The month and year does not change
    | otherwise = (d + offset, m, y)
    
  

--------------------------------------------------------------    
-- Determines the number of days in February (leapyear or not)   
 
is_leapyear :: Int -> Int
is_leapyear year 
    | mod year 400 == 0 = 29
    | mod year 100 == 0 = 28
    | mod year 4   == 0 = 29
    | otherwise         = 28
    

    
    
--------------------------------------------------------------  
-- The adjusted date falls on the previous month

subtract_month :: (Int, Int, Int) -> Int -> (Int, Int, Int)
subtract_month (d, m, y) x

    -- The new month has 31 days
    | (m == 2 || m == 4 || m == 6 || m == 8 || m == 9 || m == 11) = (d + x + 31, m - 1, y)
    
    -- The new month falls on December of the previous year
    | m == 1                    = (d + x + 31, 12, y -1)  
    
    -- The new month has 30 days
    | d > 30 = error "Error: The number of days for this month is too high"
    | (m == 5 || m == 7 || m == 10 || m == 12) = (d + x + 30, m - 1, y)
    
    -- The new month is February
    |  m == 3      = (d + x + (is_leapyear y), 2, y)
    
    |otherwise = error "ERROR"
    