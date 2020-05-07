unit PriceEditUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
	Vcl.DBCtrls, Vcl.StdCtrls, System.UITypes;

type
	TFormPriceEdit = class(TForm)
		LabelProduct: TLabel;
		LabelPrice: TLabel;
		LabelDate: TLabel;
		LabelSupplier: TLabel;
		EditPrice: TEdit;
		ButtonEdit: TButton;
		DBLookupComboBoxType: TDBLookupComboBox;
		DBLookupComboBoxSupplier: TDBLookupComboBox;
		DateTimePickerBegin: TDateTimePicker;
		DateTimePickerEnd: TDateTimePicker;
		ADOQueryProduct: TADOQuery;
		DataSourceProduct: TDataSource;
		ADOQuerySupplier: TADOQuery;
		DataSourceSupplier: TDataSource;
		procedure FormShow(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure ButtonEditClick(Sender: TObject);
		procedure EditPriceKeyPress(Sender: TObject; var Key: Char);
		procedure FormCreate(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormPriceEdit: TFormPriceEdit;
	iID: integer;

implementation

{$R *.dfm}

uses MainUnit, DbMainModuleUnit;

procedure TFormPriceEdit.ButtonEditClick(Sender: TObject);
begin
	if (DateTimePickerBegin.Date > DateTimePickerEnd.Date) then
	begin
		MessageDlg('Check date interval.', mtInformation, [mbOK], 0);
	end
	else if (DBLookupComboBoxSupplier.Text = '') then
	begin
		MessageDlg('Check Supplier.', mtInformation, [mbOK], 0);
		DBLookupComboBoxSupplier.SetFocus;
	end
	else if (DBLookupComboBoxType.Text = '') then
	begin
		MessageDlg('Check product.', mtInformation, [mbOK], 0);
		DBLookupComboBoxType.SetFocus;
	end
	else if (EditPrice.Text = '') then
	begin
		MessageDlg('Check price.', mtInformation, [mbOK], 0);
		EditPrice.SetFocus;
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('UPDATE prices');
		DbMainModule.ADOQuery1.SQL.Add
			('SET idSupplier = :idSupplier, idProduct = :idProduct, price = :price, dateBegin = :dateBegin, dateEnd = :dateEnd');
		DbMainModule.ADOQuery1.SQL.Add('WHERE id = :id');
		DbMainModule.ADOQuery1.Parameters.ParamByName('idSupplier').Value :=
			ADOQuerySupplier.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.Parameters.ParamByName('idProduct').Value :=
			ADOQueryProduct.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.Parameters.ParamByName('price').Value :=
			trim(EditPrice.Text);
		DbMainModule.ADOQuery1.Parameters.ParamByName('dateBegin').Value :=
			FormatDateTime('dd.mm.yyyy', DateTimePickerBegin.Date);
		DbMainModule.ADOQuery1.Parameters.ParamByName('dateEnd').Value :=
			FormatDateTime('dd.mm.yyyy', DateTimePickerEnd.Date);
		DbMainModule.ADOQuery1.Parameters.ParamByName('id').Value := iID;
		DbMainModule.ADOQuery1.ExecSQL;
		MainForm.ADOQueryPrices.Active := false;
		MainForm.ADOQueryPrices.Active := true;
	end;
end;

procedure TFormPriceEdit.EditPriceKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonEdit.Click;
	end;
end;

procedure TFormPriceEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQueryProduct.Active := false;
	ADOQuerySupplier.Active := false;
end;

procedure TFormPriceEdit.FormCreate(Sender: TObject);
begin
	DateTimePickerBegin.Date := now;
	DateTimePickerEnd.Date := now;
end;

procedure TFormPriceEdit.FormShow(Sender: TObject);
begin
	iID := MainForm.ADOQueryPrices.FieldByName('id').AsInteger;
	ADOQueryProduct.Active := true;
	ADOQuerySupplier.Active := true;
	ADOQueryProduct.FieldByName('sort').DisplayWidth := 25;
	ADOQuerySupplier.FieldByName('name').DisplayWidth := 25;

	DateTimePickerBegin.Date := MainForm.ADOQueryPrices.FieldByName('dateBegin')
		.AsDateTime;
	DateTimePickerEnd.Date := MainForm.ADOQueryPrices.FieldByName('dateEnd')
		.AsDateTime;
	DBLookupComboBoxSupplier.KeyValue := MainForm.ADOQueryPrices.FieldByName
		('s.name').AsString;
	DBLookupComboBoxType.KeyValue := MainForm.ADOQueryPrices.FieldByName
		('sort').AsString;
	EditPrice.Text := MainForm.ADOQueryPrices.FieldByName('price').AsString;
end;

end.
