program laba1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const N = 1000;
type
    TRec = record
       num:integer;
       str:string[12];
       F:boolean;
    end;
    TM = array[1..N] of TRec;

var
  A:TM;

procedure generateArray(const N:integer;var M:TM);
var
  i:integer;
begin
  for i:=1 to N do
  begin
    with M[i] do
    begin
      num:=Random(201);
      str:='My_Test_' + IntToStr(i);
      f:=false;
    end;
  end;
end;


  procedure qSortStr(var A: TM; min, max: Integer);
var i, j: Integer;
supp, tmp: string;
begin
supp:=A[max-((max-min) div 2)].str;
i:=min; j:=max;
while i<j do
  begin
    while A[i].str<supp do i:=i+1;
    while A[j].str>supp do j:=j-1;
    if i<=j then
      begin
        tmp:=A[i].str; A[i].str:=A[j].str; A[j].str:=tmp;
        i:=i+1; j:=j-1;
      end;
  end;
if min<j then qSortStr(A, min, j);
if i<max then qSortStr(A, i, max);
end;

 procedure qSortNum(var A: TM; min, max: Integer);
var i, j, supp, tmp: Integer;
begin
supp:=A[max-((max-min) div 2)].Num;
i:=min; j:=max;
while i<j do
  begin
    while A[i].Num<supp do i:=i+1;
    while A[j].Num>supp do j:=j-1;
    if i<=j then
      begin
        tmp:=A[i].Num; A[i].Num:=A[j].Num; A[j].Num:=tmp;
        i:=i+1; j:=j-1;
      end;
  end;
if min<j then qSortNum(A, min, j);
if i<max then qSortNum(A, i, max);
end;

procedure BinPoiskStr(const N:Integer;var M:TM; const element:string);
var
  left, right, middle:integer;
  search:integer;
begin
  left:=1;
  right:=N;
  search:=-1;
  while (left <= right) do
  begin
    middle := (left + right) div 2;
    M[middle].f := true;
    if ((M[middle].str) = element) then
    begin
      search:= middle;
      left := right + 1;
    end
    else
    begin
      if (M[middle].str > element) then
        right := middle - 1
      else
        left := middle +1;
    end;
  end;
  if (search = -1) then
    writeln('Not found')
  else
    Writeln('Element index: ' + IntToStr(search))
end;

procedure BinPoiskNum(const N:Integer;var M:TM; const element:Integer);
var
  left, right, middle:integer;
  search:integer;
  tmpind:integer;
begin
  left:=1;
  right:=N;
  search:=-1;
  while (left <= right) do
  begin
    middle := (left + right) div 2;
    M[middle].f := true;
    if ((M[middle].num) = element) then
    begin
      search:= middle;
      left := right + 1; // Exit of cycle
    end
    else
    begin
      if (M[middle].num > element) then
        right := middle - 1
      else
        left := middle +1;
    end;
  end;
  if (search = -1) then
    writeln('Not found')
  else
  begin
    tmpind := search;
    while(M[tmpind].num = element) do
    begin
      Dec(tmpind);
    end;
    M[tmpind].f := true;
    inc(tmpind);
    while(M[tmpind].num = element) do
    begin
      M[tmpind].f := true;
      Write(m[tmpind].num: 10);
      Write(m[tmpind].str: 16);
      writeln(m[tmpind].f: 12);
      inc(tmpind);
    end;
  end;
end;

function KolvoTrue(const N:integer; var M:TM):Integer;
var
  i:integer;
begin
  Result:=0;
  for i:= 1 to N do
  begin
    if(M[i].F = True) then
      Inc(Result);
  end;
end;

procedure ObnulenieBoolean(const N:integer; var M:TM);
var
  i:Integer;
begin
  for i:=1 to N do
  begin
    M[i].F := false;
  end;
end;

procedure writearray(const n: integer; m: TM ) ;
var i: integer;
begin
   for i:=1 to N do
  begin
    with M[i] do
    begin
      write( num: 10);
      write( str: 16);
      writeln( f: 12);
    end;
  end;
end;

procedure Main(const n: integer; a: tm);
 var //max, min: integer;
     NumStr: String[14];
     Num: integer;
 begin
   //randomize;
   generateArray(n,A);
   writearray(n,a);
   writeln;
//-----------------------------------------------------------------------------------
   qSortStr(a,1,n);
   writearray(n,a);
   writeln;
//-----------------------------------------------------------------------------------
   Writeln('Vvedite stroky, kotyryu nado naiti v formate My_Test_(nomer stroki):');
   readln(NumStr);
   writeln;
   BinPoiskStr(n,a,numstr);
   //writearray(n,a);
   writeln;
//-----------------------------------------------------------------------------------
   writeln('Kolvo true:',KolvoTrue(n,a));
   ObnulenieBoolean(n,a);
   qSortNum(a,1,n);
  // writearray(n,a);
//-----------------------------------------------------------------------------------
   writeln;
   writeln('Vvedite chislo dlya poiska:');
   readln(num);
   BinPoiskNum(n,a,num);
  // writearray(n,a);
   writeln;
//-----------------------------------------------------------------------------------
    writeln('kolvo true:', KolvoTrue(n,a));
    readln;
 end;


begin
  Main(n,a);
end.
