program Find_The_Right_Number;                                  { Program's name }

var to_guess, user_guess, nb_attempt : integer;                 { Variables declaration }

const                                                           { Constants declaration }
more = 'The number to find is greater than your proposition';
less = 'The number to find is less than your proposition';

begin                                                           { Main loop begin }
    Randomize;                                                  { New random number each sequence }
    to_guess := random(500);
    nb_attempt := 0;
    {writeLn(to_guess);}                                        { DEBUG : Display the number to guess }

    repeat
        nb_attempt := nb_attempt + 1;
        write('Your proposition = ');
        readLn(user_guess);

        if to_guess <> user_guess then                          { Check if user proposition is greater or less than the number to find}
        begin
            if to_guess > user_guess then
                writeLn(more)
            else
                writeLn(less);
        end;
            
        writeLn('====================');                        { Equivalent to \n }

    until (to_guess = user_guess);

    writeLn('Congratulations, you found the number (', to_guess,') in ', nb_attempt, ' attempt(s) !');
    
end.