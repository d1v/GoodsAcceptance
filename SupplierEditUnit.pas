unit SupplierEditUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
	Data.DB, System.UITypes;

type
	TFormSupplierEdit = class(TForm)
		Label1: TLabel;
		ButtonEdit: TButton;
		LabelINN: TLabel;
		DBEditEh1: TDBEditEh;
		DBEditEh2: TDBEditEh;
		procedure ButtonEditClick(Sender: TObject);
		procedure DBEditEh2KeyPress(Sender: TObject; var Key: Char);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormSupplierEdit: TFormSupplierEdit;

implementation

{$R *.dfm}

uses SupplierUnit, DbMainModuleUnit;

procedure TFormSupplierEdit.ButtonEditClick(Sender: TObject);
begin
	if (DBEditEh1.Text = '') then
	begin
		MessageDlg('Check name.', mtInformation, [mbOK], 0);
		DBEditEh1.SetFocus;
	end
	else if (DBEditEh2.Text = '') then
	begin
		MessageDlg('Check INN.', mtInformation, [mbOK], 0);
		DBEditEh2.SetFocus;
	end
	else
	begin
		if (FormSuppliers.ADOQuerySuppliers.State in [dsEdit, dsInsert]) then
		begin
			FormSuppliers.ADOQuerySuppliers.Post;
		end;
	end;
end;

procedure TFormSupplierEdit.DBEditEh2KeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonEdit.Click;
	end;
end;

end.
