program Find_The_Right_Number;                                  { Program's name }

var to_guess, user_guess, nb_attempt : integer;                 { Variables declaration }

const                                                           { Constants declaration }
more = 'The number to find is greater than your proposition';
less = 'The number to find is less than your proposition';
max = 800;
min = 200;


{* Returns a random number between [min ; max[ *}
function randInt(minimum, maximum: integer): integer;
var result, temp : integer;
begin
    temp := maximum-minimum;
    result := random(temp) + minimum;
    randInt := result;
end;


begin                                                           { Main loop begin }
    Randomize;                                                  { New random number each sequence }
    to_guess := randInt(min, max);
    nb_attempt := 0;
    {writeLn(to_guess);}                                        { DEBUG : Display the number to guess }

    writeLn('Welcome ! Find the right number between ', min, ' and ', max, '. Good luck !');

    repeat
        nb_attempt := nb_attempt + 1;
        write('Your proposition = ');
        {$I-}                                                   { Check if the input is an integer }
        readLn(user_guess);
        {$I+}
        if ioresult <> 0 then
            writeLn('The input is not an integer !')
        else
        begin        
            if to_guess <> user_guess then                          { Check if user proposition is greater or less than the number to find }
            begin
                if to_guess > user_guess then
                    writeLn(more)
                else
                    writeLn(less);
            end;
        end;
        writeLn('====================');                        { Equivalent to \n }

    until (to_guess = user_guess);

    writeLn('Congratulations, you found the number (', to_guess,') in ', nb_attempt, ' attempt(s) !');
    
end.