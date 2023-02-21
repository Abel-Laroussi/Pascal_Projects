program Find_The_Right_Number;                                  { Program's name }

var to_guess, user_guess : integer;                             { Variables declaration }

const                                                           { Constants declaration }
more = 'The number to find is greater than your proposition';
less = 'The number to find is less than your proposition';

begin                                                           { Main loop begin }
    Randomize;                                                  { New random number each sequence }
    to_guess := random(500);
    {writeLn(to_guess);}                                          { Display the number to guess }

    repeat
        write('Your proposition = ');
        readLn(user_guess);
        writeLn('====================');                        { Equivalent to \n }

    until (to_guess = user_guess);
    
end.