program HeapSort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  A: array of integer;
  n, i, x, l,r: longword;
  f: TextFile;
  T: TDateTime;
  name1,name2: string[20];
  THour, TMin, TSec, TMilli: word;
  TSum: double;

procedure sift(L, R: integer);
var
  i, j: integer;
  x: integer;
begin
  i := L;
  j := 2 * i;
  x := a[i];
  if (j < R) and (a[j] < a[j + 1]) then
    j := j + 1;
  while (j <= R) and (x < a[j]) do
    begin
      a[i] := a[j];
      i := j;
      j := 2 * j;
      if (j < R) and (a[j] < a[j + 1]) then
        j := j + 1;
    end;
  a[i] := x;
end;

begin
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
  L := (N div 2)+1;
  R := N;
  while L > 0 do
  begin
    L := L - 1;
    sift(L, R);
  end;
  while R > 0 do
  begin
    x := a[0];
    a[0] := a[R];
    a[R] := x;
    R := R - 1;
    sift(L, R);
  end;
  T:= Now-T;
  DecodeTime(T, THour, TMin, TSec, TMilli);
  TSum:= TMilli/1000 + TSec + 60*TMin + 3600*THour;
  AssignFile(f, name2);
  rewrite(f);
  writeln(f, n);
  for i:= 0 to n-1 do
    write(f, a[i], ' ');
  writeln(f);
  Writeln(f, 'HeapSort');
  Writeln(f, floattostr(TSum));
  CloseFile(f);
end.
