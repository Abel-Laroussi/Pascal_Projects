program Tic_Tac_Toe;

type
    rows = array of integer;

var
    table : array of rows;
    j1_turn, end_of_game : boolean;
    row, column : integer;

const
    j1_point = 'X';
    j2_point = 'O';
    empty = #177;

procedure displayTable(table : array of rows);
    var
        i, j : integer;
    begin
        for i:=0 to 2 do
        begin
            for j:=0 to 2 do
                case(table[i][j]) of
                    0 : write(empty, ' ');
                    1 : write(j1_point, ' ');
                    2 : write(j2_point, ' ');
                end;
            writeLn();
            writeLn();
            writeLn();
        end;
    end;

procedure init(var table : array of rows);
    begin
        for row:=0 to 3 do
            setlength(table[row], 3);
        for row:=0 to 3 do
            for column:=0 to 3 do
                table[row][column] := 0;
        displayTable(table);
    end;

procedure placePoint(var table : array of rows; j1_turn : boolean);
    var
        row, column : integer;
    begin

        row := 0;
        column := 0;

        repeat
            writeLn('In which row do you want to place your point ? (1 to 3)');
            write('=> ');
            readLn(row);
        until (row in [1..3]);

        writeLn();

        repeat
            writeLn('In which column do you want to place your point ? (1 to 3)');
            write('=> ');
            readLn(column);
        until (column in [1..3]);

        row := row - 1;
        column := column - 1;

        if(j1_turn) then table[row][column] := 1 else table[row][column] := 2;
    end;

{ MAIN LOOP }
begin
    setlength(table, 3);
    init(table);
    j1_turn := TRUE;
    end_of_game := FALSE;

    while(not end_of_game) do
        begin
            placePoint(table, j1_turn);
            j1_turn := not j1_turn;
            displayTable(table);
        end;


end.