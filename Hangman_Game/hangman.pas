program Hangman;

type
    wordarray = array of string;

var
    f: text;
    nb_words, i: integer;
    words : wordarray;

procedure initArray(filename: string; var nbWords: integer; var wordsArray: wordarray);
    var one_word: string;
    begin
        Assign(f,filename);
        reset(f);
        nbWords := 0;
        setlength(wordsArray, 20);

        while not eof(f) do
        begin
            readLn(f, one_word);
            wordsArray[nbWords] := one_word;
            nbWords := nbWords + 1;
        end;
    end;

begin
    initArray('word_list.txt', nb_words, words);
    writeLn(nb_words);

    for i:=0 to nb_words-1 do
        writeLn('Mot dans le tableau (index ', i, ') : ', words[i]);

    close(f);
end.