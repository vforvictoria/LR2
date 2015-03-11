program ShellSort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  A: array of integer;
  n, i,j,k,b,x: integer;
  f: TextFile;
  T: TDateTime;
  name1,name2: string[20];
  THour, TMin, TSec, TMilli: word;
  TSum: double;
  l: word;
  h: array of LongWord;

begin
  name1:=paramstr(1);
  name2:=paramstr(2);
  AssignFile(f, name1);
  Reset(f);
  Readln(f, n);
  setlength(a,n);
  for i:= 0 to n-1 do
    read(f, A[i]);
  Close(f);
  T:= Now;
  l := 1;
  SetLength(h, l + 1);
  h[1] := 1;
  while h[l] < N div 2 do
  begin
    l := l + 1;
    SetLength(h, l + 1);
    h[l] := h[l - 1] * 2 + 1;
  end;
  l := l - 1;
  SetLength(h, l + 1);
  for b := l downto 1 do
  begin
    k := h[b];
    for i := k to N-1 do
    begin
      x := a[i];
      j := i - k;
      while (j > k) and (x < a[j]) do
      begin
        a[j + k] := a[j];
        j := j - k;
      end;
      if (j > k) or (x >= a[j]) then
        a[j + k] := x
      else
      begin
        a[j + k] := a[j];
        a[j] := x;
      end;
    end;
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
  Writeln(f, 'ShellSort');
  Writeln(f, floattostr(TSum));
  CloseFile(f);
end.
