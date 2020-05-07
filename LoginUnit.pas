unit LoginUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdHashMessageDigest;

type
	TFormLogin = class(TForm)
		EditPassword: TEdit;
		Label1: TLabel;
		ButtonPassword: TButton;
		procedure ButtonPasswordClick(Sender: TObject);
		procedure FormKeyPress(Sender: TObject; var Key: Char);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormCreate(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormLogin: TFormLogin;
	bLogin: Boolean = false;
	objMd5: TIdHashMessageDigest5;

implementation

{$R *.dfm}

uses DbMainModuleUnit, MainUnit;

procedure TFormLogin.ButtonPasswordClick(Sender: TObject);
var
	sPassword: String;
begin
	sPassword := AnsiLowerCase(objMd5.HashStringAsHex(EditPassword.Text));

	DbMainModule.ADOConnection1.Connected := true;
	DbMainModule.ADODataSetUser.Active := true;

	if (DbMainModule.ADODataSetUser.FieldByName('password').AsString = sPassword)
	then
	begin
		DbMainModule.ADODataSetUser.Active := false;
		bLogin := true;
		FormLogin.Close;
	end
	else
	begin
		showmessage('Wrong Password! Please try again.');
		EditPassword.SetFocus;
	end;
end;

procedure TFormLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if (bLogin = false) then
	begin
		Application.Terminate;
	end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
	objMd5 := TIdHashMessageDigest5.Create;
end;

procedure TFormLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
		ButtonPassword.Click
end;

end.
