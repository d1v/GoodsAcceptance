unit ProductEditUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.DBCtrls, Data.DB,
	Data.Win.ADODB, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, System.UITypes;

type
	TFormEditProduct = class(TForm)
		Label1: TLabel;
		ButtonEdit: TButton;
		LabelSort: TLabel;
		ADOQuery1: TADOQuery;
		DataSource1: TDataSource;
		DBLookupComboBoxType: TDBLookupComboBox;
		GoToTypes: TBitBtn;
		DBEditEhSort: TDBEditEh;
		procedure GoToTypesClick(Sender: TObject);
		procedure ButtonEditClick(Sender: TObject);
		procedure FormShow(Sender: TObject);
		procedure DBEditEhSortKeyPress(Sender: TObject; var Key: Char);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormEditProduct: TFormEditProduct;

implementation

{$R *.dfm}

uses DbMainModuleUnit, ProductsUnit, MainUnit;

procedure TFormEditProduct.ButtonEditClick(Sender: TObject);
begin
	if (DBLookupComboBoxType.Text = '') then
	begin
		MessageDlg('Check type.', mtInformation, [mbOK], 0);
		DBLookupComboBoxType.SetFocus;
	end

	else if (DBEditEhSort.Text = '') then
	begin
		MessageDlg('Check sort.', mtInformation, [mbOK], 0);
		DBEditEhSort.SetFocus;
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('UPDATE products');
		DbMainModule.ADOQuery1.SQL.Add('SET sort = :sort, idType = :idType');
		DbMainModule.ADOQuery1.SQL.Add('WHERE id = :id');
		DbMainModule.ADOQuery1.Parameters.ParamByName('sort').Value :=
			trim(DBEditEhSort.Text);
		DbMainModule.ADOQuery1.Parameters.ParamByName('idType').Value :=
			ADOQuery1.FieldByName('id').AsInteger;
		DbMainModule.ADOQuery1.Parameters.ParamByName('id').Value :=
			FormProducts.ADOQueryProducts.FieldByName('id').AsInteger;
		DbMainModule.ADOQuery1.ExecSQL;
	end;
end;

procedure TFormEditProduct.DBEditEhSortKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonEdit.Click;
	end;
end;

procedure TFormEditProduct.FormShow(Sender: TObject);
begin
	DBLookupComboBoxType.KeyValue := FormProducts.ADOQueryProducts.FieldByName
		('name').AsString;
end;

procedure TFormEditProduct.GoToTypesClick(Sender: TObject);
begin
	MainForm.ActionShowTypesExecute(Sender);
	ADOQuery1.Active := false;
	ADOQuery1.Active := true;
end;

end.
