const
  MAX = 100;

type
  TStack = array[1..MAX] of Integer;
  TStackPointer = 1..MAX;

var
  stack: TStack;
  top: TStackPointer;

procedure initStack();
begin
  top := 0;
end;

function isEmpty(): Boolean;
begin
  isEmpty := (top = 0);
end;

function isFull(): Boolean;
begin
  isFull := (top = MAX);
end;

procedure push(value: Integer);
begin
  if isFull() then
    Writeln('Ошибка: стeк переполнен')
  else begin
    Inc(top);
    stack[top] := value;
  end;
end;

function pop(): Integer;
begin
  if isEmpty() then begin
    Writeln('Ошибка: стек пустой');
    pop := 0;
  end else begin
    pop := stack[top];
    Dec(top);
  end;
end;

procedure displayStack();
var
  i: TStackPointer;
begin
  Writeln('Ваш текущий стек:');
  if isEmpty() then
    Writeln('(тут пусто)')
  else
    for i := top downto 1 do
      Writeln(stack[i]);
end;

var
  value: Integer;
  choice: Char;
begin
  initStack();
  repeat
    Writeln('1 = Добавить элемент в стек');
    Writeln('2 = Удалить верхний элемент из стека');
    Writeln('3 = Показать все элементы стека');
    Writeln('0 = Выйти');
    Write('Сделайте выбор: ');
    Readln(choice);
    case choice of
      '1': begin
             Write('Введите значение: ');
             Readln(value);
             push(value);
           end;
      '2': begin
             value := pop();
             Writeln('Был удален элемент: ', value);
           end;
      '3': displayStack();
    end;
  until choice = '0';
end.