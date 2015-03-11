program QuickSort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  A: array of integer;
  n, i: longword;
  f: TextFile;
  T: TDateTime;
  name1,name2: string[20];
  THour, TMin, TSec, TMilli: word;
  TSum: double;

procedure sort(L, R: integer);
var
  i, j: integer;
  w, x: integer;
begin
  i := L;
  j := R;
  x := a[(L + R) div 2];
  repeat
    while a[i] < x do
      i := i + 1;
    while x < a[j] do
      j := j - 1;
    if i <= j then
      begin
        w := a[i];
        a[i] := a[j];
        a[j] := w;
        i := i + 1;
        j := j - 1;
      end;
  until i > j;
  if L < j then
    sort(L, j);
  if i < R then
    sort(i, R);
end;

begin
  {Writeln('Vvedite imya faila s ishodnym massivom');
  Readln(name1);
  Writeln('Vvedite imya vihodnogo faila');
  Readln(name2);}
  name1:=paramstr(1);
  name2:=paramstr(2);
  AssignFile(f, name1);
  Reset(f);
  Readln(f, n);
  setlength(a,n);
  for i:= 0 to n-1 do
    read(f, a[i]);
  Close(f);
  T:= Now;
  sort(0, N-1);
  T:= Now-T;
  DecodeTime(T, THour, TMin, TSec, TMilli);
  TSum:= TMilli/1000 + TSec + 60*TMin + 3600*THour;
  AssignFile(f, name2);
  rewrite(f);
  writeln(f, n);
  for i:= 0 to n-1 do
    write(f, a[i], ' ');
  writeln(f);
  Writeln(f, 'QuickSort');
  Writeln(f, floattostr(TSum));
  CloseFile(f);
end.
