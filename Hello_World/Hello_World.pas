program Hello_World;                                { Name of the Program }

const msg = 'Hello ! I hope you are doing fine ';   { Constants declarations }

var username: string;                               { Variable declarations }

begin
    writeLn('What is your name ?');
    write('=> ');
    readLn(username);                               { Assign username variable a value }
    writeLn();                                      { Similar to \n }
    writeLn(msg, username, ' ! :)')                 { Display msg & username variables and ' ! :)' message }
end.