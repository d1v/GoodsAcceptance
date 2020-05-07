unit SupplierAddUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
	TFormSupplierAdd = class(TForm)
		Label1: TLabel;
		EditName: TEdit;
		ButtonAdd: TButton;
		EditINN: TEdit;
		LabelINN: TLabel;
		procedure ButtonAddClick(Sender: TObject);
		procedure EditINNKeyPress(Sender: TObject; var Key: Char);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormSupplierAdd: TFormSupplierAdd;

implementation

{$R *.dfm}

uses DbMainModuleUnit, SupplierUnit;

procedure TFormSupplierAdd.ButtonAddClick(Sender: TObject);
begin
	if (EditName.Text = '') then
	begin
		MessageDlg('Check name.', mtInformation, [mbOK], 0);
		EditName.SetFocus;
	end
	else if (EditINN.Text = '') then
	begin
		MessageDlg('Check INN.', mtInformation, [mbOK], 0);
		EditINN.SetFocus;
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('INSERT INTO suppliers(name, INN)');
		DbMainModule.ADOQuery1.SQL.Add('VALUES (:name, :INN);');
		DbMainModule.ADOQuery1.Parameters.ParamByName('name').Value :=
			trim(EditName.Text);
		DbMainModule.ADOQuery1.Parameters.ParamByName('INN').Value :=
			trim(EditINN.Text);
		DbMainModule.ADOQuery1.ExecSQL;
		EditName.Text := '';
		EditINN.Text := '';
		FormSuppliers.ADOQuerySuppliers.Active := false;
		FormSuppliers.ADOQuerySuppliers.Active := true;
	end;
end;

procedure TFormSupplierAdd.EditINNKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonAdd.Click;
	end;
end;

end.
