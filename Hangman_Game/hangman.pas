program Hangman;

type
    wordarray = array of string;

var
    f: text;
    nb_words, i: integer;
    words : wordarray;
    word_to_guess: string;
    keep_playing: boolean;

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

procedure displayHiddenWord(word_to_guess: string);
    var word_size : integer;
    begin
        word_size := Length(word_to_guess);

        for i:=0 to word_size-1 do
            write('_ ');
    end;

begin
    keep_playing := TRUE;
    initArray('word_list.txt', nb_words, words);
    Randomize();
{    for i:=0 to nb_words-1 do
        writeLn('Word in the array (index ', i, ') : ', words[i]);     DEBUG }

    i := random(nb_words);
    word_to_guess := words[i];
    writeLn('Word loaded');

    displayHiddenWord(word_to_guess);

    close(f);
end.