unit ItemEditUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
	Vcl.StdCtrls, System.UITypes;

type
	TFormItemEdit = class(TForm)
		LabelProduct: TLabel;
		LabelPrice: TLabel;
		EditWeight: TEdit;
		ButtonEdit: TButton;
		DBLookupComboBoxType: TDBLookupComboBox;
		ADOQueryProduct: TADOQuery;
		DataSourceProduct: TDataSource;
		procedure FormShow(Sender: TObject);
		procedure EditWeightKeyPress(Sender: TObject; var Key: Char);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure ButtonEditClick(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormItemEdit: TFormItemEdit;
	iiID: integer;

implementation

{$R *.dfm}

uses DbMainModuleUnit, MainUnit, ItemsUnit;

procedure TFormItemEdit.ButtonEditClick(Sender: TObject);
begin
	if (DBLookupComboBoxType.Text = '') then
	begin
		MessageDlg('Check product.', mtInformation, [mbOK], 0);
		DBLookupComboBoxType.SetFocus;
	end
	else if (EditWeight.Text = '') then
	begin
		MessageDlg('Check weight.', mtInformation, [mbOK], 0);
		EditWeight.SetFocus;
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('UPDATE items');
		DbMainModule.ADOQuery1.SQL.Add
			('SET idProduct = :idProduct, weight = :weight');
		DbMainModule.ADOQuery1.SQL.Add('WHERE id = :id');
		DbMainModule.ADOQuery1.Parameters.ParamByName('idProduct').Value :=
			ADOQueryProduct.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.Parameters.ParamByName('weight').Value :=
			trim(EditWeight.Text);
		DbMainModule.ADOQuery1.Parameters.ParamByName('id').Value := iiID;
		DbMainModule.ADOQuery1.ExecSQL;
		FormItems.ADOQueryItems.Active := false;
		FormItems.ADOQueryItems.Active := true;
	end;
end;

procedure TFormItemEdit.EditWeightKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonEdit.Click;
	end;
end;

procedure TFormItemEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQueryProduct.Active := false;
end;

procedure TFormItemEdit.FormShow(Sender: TObject);
begin
	iiID := FormItems.ADOQueryItems.FieldByName('id').AsInteger;
	ADOQueryProduct.Active := true;
	ADOQueryProduct.FieldByName('sort').DisplayWidth := 25;
	DBLookupComboBoxType.KeyValue := FormItems.ADOQueryItems.FieldByName
		('sort').AsString;
	EditWeight.Text := FormItems.ADOQueryItems.FieldByName('weight').AsString;
end;

end.
