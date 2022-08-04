unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Nativexml,ShellApi, Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Button7: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FXML,Fxml2: TNativeXml;   //xml файлы
  ANode:TXMLNode;
  dir_app:String;
  fname:string;
  forchange:string;

implementation

{$R *.dfm}
{++++++ Создать пустой XML документ +++++++++++++++}
procedure Create_xml;
begin
 FXml := TNativeXml.Create(Form1);
 FXml.CreateName('Root');
end;

{++++++ Сохранить XML документ +++++++++++++++}
procedure Save_xml(namef:string);
begin
  Fxml.XmlFormat := xfReadable;
  Fxml.SaveToFile(namef);
end;

{++++++ Загрузить XML документ +++++++++++++++}
procedure Load_xml(XML:TNativeXML;namef:string);
 var
  i,n:integer;
begin
 if Fileexists(namef) then
  begin
   Fxml.LoadFromFile(namef);
   Fxml.XmlFormat := xfReadable;
   n:=xml.Root.NodeCount;
   i:=0;
   While (i < n )do
      begin
         Form1.ComboBox1.Items.Append(StringReplace(XML.Root.Nodes[i].Name, '_', ' ',
                          [rfReplaceAll, rfIgnoreCase]));
         inc(i);
      end;
  end;

end;

Function FindNodeXML (XML:TNativeXml;fname:string): TXMLNode;
  var
   i,n:integer;
   b:boolean;
   temp1:string;
Begin
 n:=xml.Root.NodeCount;
 i:=0;
 b:=false;
 with xml.Root do
  begin
         xml.XmlFormat := xfReadable;
         While (i < n ) and (not b) do
          begin
               temp1:=xml.Root.Nodes[i].Name;
               if (pos(AnsiLowerCase(fname),AnsiLowerCase(xml.Root.Nodes[i].Name))<>0) then
                 begin
                   Result:= xml.Root.Nodes[i];
                   b:=true;
                 end;
           inc(i);
         end;
         if not b then Result:=nil;
  end;
End;

Procedure Add_xml(XML:TNativeXml;s1,s2,s3:string);
Begin
    ANode:=Fxml.Root.NodeNew(StringReplace(s1, ' ', '_',[rfReplaceAll, rfIgnoreCase]));
    Anode.WriteString('Filename',s2,'');
    Anode.WriteString('About',s3,'');
End;

Procedure Change_xml(XML:TNativeXml;schange,s1,s2,s3:string);
 var
  i,n:integer;
  b:boolean;
  ANode:TXMLNode;
Begin
 n:=XML.Root.NodeCount;
 i:=0;
 b:=false;
 XML.XmlFormat := xfReadable;
 While (i < n) and (not b) do
     begin
       if (pos(AnsiLowerCase(schange),AnsiLowerCase(XML.Root.Nodes[i].Name))<>0) then
           begin
            Anode:= XML.Root.Nodes[i];
            b:=true;
           end;
        inc(i);
     end;
  if b then
    begin
        ANode.Name:=StringReplace(s1, ' ', '_',[rfReplaceAll, rfIgnoreCase]);
        Anode.WriteString('Filename',s2,'');
        Anode.WriteString('About',s3,'');
    end;
End;

procedure TForm1.FormShow(Sender: TObject);
begin
 dir_app:=ExtractFileDir(Application.ExeName);
 if not DirectoryExists(dir_app+'\psfiles\') then
   Mkdir(dir_app+'\psfiles\');
 Create_xml;
 Load_XML(FXML,dir_app+'\files.xml');

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Save_XML(dir_app+'\files.xml');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if Form1.Button5.Caption='Добавить' then
   begin
    if  (Form1.Edit1.Text<>'') and (Form1.Edit1.Text<>'')  then
      begin
        Add_xml(FXML,Form1.Edit1.Text,ExtractFileName(Form1.Edit2.text),Form1.Memo2.Text);
        CopyFile(PChar(Form1.Edit2.text),PChar(dir_app+'\psfiles\'+ExtractFileName(Form1.Edit2.text)),true);
        Form1.ComboBox1.Items.Append(Form1.Edit1.Text);
        ShowMessage('Добавлено!');
      end                                                     else
        ShowMessage('Не заполнены поля!');
        
    end
     else
    begin
      Change_xml(FXML,StringReplace(forchange, ' ', '_',[rfReplaceAll, rfIgnoreCase]),Form1.Edit1.Text,Form1.Edit2.Text,Form1.Memo2.Text);
      Form1.ComboBox1.Items[Form1.ComboBox1.ItemIndex]:=Form1.Edit1.Text;
      Form1.Memo1.Text:=Form1.Memo2.Text;
    end;
    Form1.GroupBox1.Visible:=false;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if Form1.OpenDialog1.Execute then
 Form1.Edit2.Text:=Form1.OpenDialog1.FileName;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
ANode:=FindNodeXML(FXML,StringReplace(Form1.ComboBox1.Text, ' ', '_',[rfReplaceAll, rfIgnoreCase]));
if ANode<>nil then
  begin
    Form1.Memo1.Text:=ANode.Nodes[1].Value;
    fname:=ANode.Nodes[0].Value;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellExecute(Handle, '', Pchar('powershell.exe'), Pchar('-file "'+dir_app+'\psfiles\'+fname+'"'), '%SystemRoot%\system32\WindowsPowerShell\v1.0\', SW_SHOWNORMAL);  //
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Form1.Button5.Caption:='Добавить';
Form1.GroupBox1.Caption:='Изменить скрипт PowerShel';
Form1.GroupBox1.Left:=2;
Form1.GroupBox1.Top:=2;
Form1.GroupBox1.Visible:=true;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Form1.GroupBox1.Visible:=false;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
ShellExecute(Handle, '', Pchar('powershell.exe'), Pchar('"Set-ExecutionPolicy UnRestricted"'), '%SystemRoot%\system32\WindowsPowerShell\v1.0\', SW_SHOWNORMAL);  //
end;

procedure TForm1.N3Click(Sender: TObject);
begin
ShellExecute(Handle, '', Pchar('powershell.exe'), Pchar('"Set-ExecutionPolicy RemoteSigned"'), '%SystemRoot%\system32\WindowsPowerShell\v1.0\', SW_SHOWNORMAL);  //
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
Form1.Button5.Caption:='Изменить';
Form1.GroupBox1.Caption:='Изменить скрипт PowerShel';
Form1.Edit2.Text:=dir_app+'\psfiles\'+fname;
Forchange:=Form1.ComboBox1.Text;
Form1.Edit1.Text:=Form1.ComboBox1.Text;
Form1.Memo2.Text:=Form1.Memo1.Text;
Form1.GroupBox1.Left:=2;
Form1.GroupBox1.Top:=2;
Form1.GroupBox1.Visible:=true;
end;

end.
