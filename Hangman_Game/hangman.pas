program Hangman;

type
    wordarray = array of string;

var
    f: text;
    nb_words, i: integer;
    words : wordarray;
    word_to_guess: string;
    word_in_game: string;
    keep_playing: boolean;
    character_proposition: char;
    lives: integer;

const 
    MAX_WORDS = 20;
    NB_TRY = 10;

procedure initArray(filename: string; var nbWords: integer; var wordsArray: wordarray);
    var one_word: string;
    begin
        Assign(f,filename);
        reset(f);
        nbWords := 0;
        setlength(wordsArray, MAX_WORDS);

        while not eof(f) do
        begin
            readLn(f, one_word);
            wordsArray[nbWords] := one_word;
            nbWords := nbWords + 1;
        end;
    end;

procedure displayHiddenWord(word_in_game: string);
    var word_size : integer;
    begin
        word_size := Length(word_in_game);

        for i:=1 to word_size do
        begin
            write(word_in_game[i]);
            write(' ');
        end;
        writeLn();
    end;

procedure checkLetter(c: char; word_to_guess: string; var lives: integer; var word_in_game: string);
    var 
        word_size : integer;
        found : boolean;
        character: char;

    begin
        character := LowerCase(c);
        if( (character < 'a') or (character > 'z')) then writeLn('This is not a letter !')
        else
            begin
                found := false;
                word_size := Length(word_to_guess);
                i := 1;
                while (i <= word_size) do
                begin
                    if word_to_guess[i] = character then
                    begin
                        word_in_game[i] := character;
                        found := true;
                    end;
                    i := i+1;
                end;

                if not found then lives := lives - 1;
            end;
    end;

function checkWin(word_in_game: string) : boolean;
    var win : boolean;
    begin
        win := TRUE;
        for i:=0 to (Length(word_in_game)) do
            if (word_in_game[i] = '_') then
                win := FALSE;
        checkWin := win;
    end;

{ MAIN LOOP }
begin
    keep_playing := TRUE;
    lives := NB_TRY;
    initArray('word_list.txt', nb_words, words);
    Randomize();
{    for i:=0 to nb_words-1 do
        writeLn('Word in the array (index ', i, ') : ', words[i]);     DEBUG }

    i := random(nb_words);
    word_to_guess := words[i];

    word_in_game := word_to_guess;
    for i:=1 to (Length(word_to_guess)) do
        word_in_game[i] := '_';

    writeLn('Word loaded');
    close(f);
    { DEBUG writeLn('Word to guess : ', word_to_guess); }
    while keep_playing do
    begin
        writeLn('============================');
        displayHiddenWord(word_in_game);
        write('Your proposition : ');
        readLn(character_proposition);
        checkLetter(character_proposition, word_to_guess, lives, word_in_game);
        writeLn();
        writeLn('You have ', lives, ' lives left.');
        keep_playing := (lives > 0) and (not checkWin(word_in_game));
    end;

    if lives = 0 then
        begin
            writeLn('Game Over. You lost.');
            writeLn('The word was "', word_to_guess, '".');
        end
    else
    begin
        writeLn('Congratulations !');
        writeLn('You found the word "', word_to_guess, '" !');
    end;

    readLn(); { PAUSE }
end.
