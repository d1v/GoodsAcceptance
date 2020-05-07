unit ProductAddUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, DBCtrlsEh, Vcl.StdCtrls,
	Data.DB, Data.Win.ADODB, Vcl.DBCtrls, Vcl.Buttons, System.UITypes;

type
	TFormProductAdd = class(TForm)
		Label1: TLabel;
		EditName: TEdit;
		ButtonAdd: TButton;
		LabelSort: TLabel;
		ADOQuery1: TADOQuery;
		DataSource1: TDataSource;
		DBLookupComboBoxType: TDBLookupComboBox;
		GoToTypes: TBitBtn;
		procedure ButtonAddClick(Sender: TObject);
		procedure EditNameKeyPress(Sender: TObject; var Key: Char);
		procedure GoToTypesClick(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormProductAdd: TFormProductAdd;

implementation

{$R *.dfm}

uses DbMainModuleUnit, ProductsUnit, MainUnit;

procedure TFormProductAdd.ButtonAddClick(Sender: TObject);
begin
	if (DBLookupComboBoxType.Text = '') then
	begin
		MessageDlg('Check type.', mtInformation, [mbOK], 0);
		DBLookupComboBoxType.SetFocus;
	end
	else if (EditName.Text = '') then
	begin
		MessageDlg('Check name.', mtInformation, [mbOK], 0);
		EditName.SetFocus;
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('INSERT INTO products(sort, idType)');
		DbMainModule.ADOQuery1.SQL.Add('VALUES (:sort, :idType);');
		DbMainModule.ADOQuery1.Parameters.ParamByName('sort').Value :=
			trim(EditName.Text);
		DbMainModule.ADOQuery1.Parameters.ParamByName('idType').Value :=
			ADOQuery1.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.ExecSQL;
		EditName.Text := '';
		FormProducts.ADOQueryProducts.Active := false;
		FormProducts.ADOQueryProducts.Active := true;
	end;
end;

procedure TFormProductAdd.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonAdd.Click;
	end;
end;

procedure TFormProductAdd.GoToTypesClick(Sender: TObject);
begin
	MainForm.ActionShowTypesExecute(Sender);
	ADOQuery1.Active := false;
	ADOQuery1.Active := true;
end;

end.
