unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
    procedure MarkTaskAsDone(Sender: TObject);
    //procedure FormCreate(Sender: TObject);
  private
    procedure AddToDoItem;
  public
    //pinjem:integer;
  end;

var
  Form1: TForm1;
  ScrollBox1: TScrollBox;


implementation

{$R *.lfm}

{ TForm1 }
{Pprocedure TForm1.FormCreate(sender: TObject);
begin
     pinjem:=1;
end; }

procedure TForm1.AddToDoItem;
var
  NewPanel: TPanel;
  NewEdit: TEdit;
  DoneButton: TButton;
begin
  NewPanel := TPanel.Create(Self);
  NewPanel.Parent := ScrollBox1;
  NewPanel.Caption := '';
  NewPanel.Height := 50;
  NewPanel.Width := ScrollBox1.ClientWidth - 50;
  {if pinjem=1 then
  begin
       NewPanel.Top := ScrollBox1.ControlCount * 1;
       pinjem:=0;
  end}
  //else
  NewPanel.Top := ScrollBox1.ControlCount * 55;
  NewPanel.Left := 10;

  NewEdit := TEdit.Create(NewPanel);
  NewEdit.Parent := NewPanel;
  NewEdit.Text := 'New Task';
  NewEdit.Left := 10;
  NewEdit.Top := 0;
  NewEdit.Width := NewPanel.Width - 120;

  DoneButton := TButton.Create(NewPanel);
  DoneButton.Parent := NewPanel;
  DoneButton.Caption := 'Done';
  DoneButton.Left := NewPanel.Width - 100;
  DoneButton.Top := 10;
  DoneButton.Width := 90;

  DoneButton.Tag := Integer(NewPanel.Handle);

  DoneButton.OnClick := @MarkTaskAsDone;
end;

procedure TForm1.MarkTaskAsDone(Sender: TObject);
var
  AssociatedPanel: TPanel;
  i: Integer;
  TaskPanel: TPanel;
begin
  //pinjem:=1;
  AssociatedPanel := TPanel((Sender as TButton).Parent);
  AssociatedPanel.Free;

  for i := 0 to ScrollBox1.ControlCount - 1 do
  begin
    if ScrollBox1.Controls[i] is TPanel then
    begin
      TaskPanel := TPanel(ScrollBox1.Controls[i]);
      TaskPanel.Top := (i+1) * 55;
    end;
  end;
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  AddToDoItem;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin

end;


procedure TForm1.Panel2Click(Sender: TObject);
begin

end;

procedure TForm1.ScrollBox1Click(Sender: TObject);
begin

end;


end.

