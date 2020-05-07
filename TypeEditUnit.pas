unit TypeEditUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
	Data.DB, System.UITypes;

type
	TFormTypeEdit = class(TForm)
		Label1: TLabel;
		ButtonEdit: TButton;
		DBEditEh1: TDBEditEh;
		procedure ButtonEditClick(Sender: TObject);
		procedure DBEditEh1KeyPress(Sender: TObject; var Key: Char);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormTypeEdit: TFormTypeEdit;

implementation

{$R *.dfm}

uses TypeUnit, DbMainModuleUnit;

procedure TFormTypeEdit.ButtonEditClick(Sender: TObject);
begin
	if (DBEditEh1.Text = '') then
	begin
		MessageDlg('Check name.', mtInformation, [mbOK], 0);
		DBEditEh1.SetFocus;
	end
	else
	begin
		if (FormTypes.ADOQueryTypes.State in [dsEdit, dsInsert]) then
		begin
			FormTypes.ADOQueryTypes.Post;
		end;
	end;
end;

procedure TFormTypeEdit.DBEditEh1KeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonEdit.Click;
	end;
end;

end.
