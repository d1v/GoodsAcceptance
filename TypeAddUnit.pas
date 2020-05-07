unit TypeAddUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
	TFormTypeAdd = class(TForm)
		EditName: TEdit;
		Label1: TLabel;
		ButtonAdd: TButton;
		procedure EditNameKeyPress(Sender: TObject; var Key: Char);
		procedure ButtonAddClick(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormTypeAdd: TFormTypeAdd;

implementation

{$R *.dfm}

uses DbMainModuleUnit, TypeUnit;

procedure TFormTypeAdd.ButtonAddClick(Sender: TObject);
begin
	if (EditName.Text = '') then
	begin
		MessageDlg('Check name.', mtInformation, [mbOK], 0);
		EditName.SetFocus;
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('INSERT INTO types(name)');
		DbMainModule.ADOQuery1.SQL.Add('VALUES (:name);');
		DbMainModule.ADOQuery1.Parameters.ParamByName('name').Value :=
			trim(EditName.Text);
		DbMainModule.ADOQuery1.ExecSQL;
		EditName.Text := '';
		FormTypes.ADOQueryTypes.Active := false;
		FormTypes.ADOQueryTypes.Active := true;
	end;
end;

procedure TFormTypeAdd.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonAdd.Click;
	end;
end;

end.
