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

const MAX_WORDS = 20;

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

procedure checkLetter(c: char; word_to_guess: string; var keep_playing: boolean; var lives: integer; var word_in_game: string);
    var word_size : integer;
    var found : boolean;
    begin
        found := false;
        word_size := Length(word_to_guess);
        i := 1;
        while (i <= word_size) do
        begin
            if word_to_guess[i] = c then
            begin
                word_in_game[i] := c;
                found := true;
            end;
            i := i+1;
        end;

        if not found then lives := lives - 1;

        keep_playing := (lives > 0);
    end;

begin
    keep_playing := TRUE;
    lives := 10;
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
    { DEBUG writeLn('Word to guess : ', word_to_guess); }
    while keep_playing do
    begin
        displayHiddenWord(word_in_game);
        write('Your proposition : ');
        readLn(character_proposition);
        checkLetter(character_proposition, word_to_guess, keep_playing, lives, word_in_game);
    end;

    close(f);
end.

// Faire 2 arrays, 1 qui contient le mot, 1 qui est son équivalent en '_' et keep_playing se met à false s'il n'y a plus aucun '_' dans le deuxième array