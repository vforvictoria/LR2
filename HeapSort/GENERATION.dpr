program GENERATION;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
a: array of integer;
n,i: longword;
f: TextFile;
name: string[20];

begin
  Writeln('Vvedite razmer massiva');
  Readln(N);
  name:=paramstr(1);
  setlength(a,n);
  randomize;
  for i:= 0 to n-1 do
    a[i]:=random(1000000)-500000;
  AssignFile(f, name);
  rewrite(f);
  Write(f, n);
  Writeln(f);
  for i:= 0 to n-1 do
    Write(f, a[i],' ');
  Close(f);
end.


