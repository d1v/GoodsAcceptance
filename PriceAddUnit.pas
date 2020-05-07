unit PriceAddUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Data.DB, Data.Win.ADODB,
	Vcl.StdCtrls, Vcl.ComCtrls, System.UITypes;

type
	TFormPriceAdd = class(TForm)
		LabelProduct: TLabel;
		EditPrice: TEdit;
		ButtonAdd: TButton;
		LabelPrice: TLabel;
		ADOQueryProduct: TADOQuery;
		DataSourceProduct: TDataSource;
		DBLookupComboBoxType: TDBLookupComboBox;
		DBLookupComboBoxSupplier: TDBLookupComboBox;
		LabelDate: TLabel;
		ADOQuerySupplier: TADOQuery;
		DataSourceSupplier: TDataSource;
		DateTimePickerBegin: TDateTimePicker;
		LabelSupplier: TLabel;
		DateTimePickerEnd: TDateTimePicker;
		procedure FormShow(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure ButtonAddClick(Sender: TObject);
		procedure EditPriceKeyPress(Sender: TObject; var Key: Char);
		procedure FormCreate(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormPriceAdd: TFormPriceAdd;

implementation

{$R *.dfm}

uses DbMainModuleUnit, MainUnit;

procedure TFormPriceAdd.ButtonAddClick(Sender: TObject);
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
		DbMainModule.ADOQuery1.SQL.Add
			('INSERT INTO prices(idSupplier, idProduct, price, dateBegin, dateEnd)');
		DbMainModule.ADOQuery1.SQL.Add
			('VALUES (:idSupplier, :idProduct, :price, :dateBegin, :dateEnd);');
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
		DbMainModule.ADOQuery1.ExecSQL;
		EditPrice.Text := '';
		MainForm.ADOQueryPrices.Active := false;
		MainForm.ADOQueryPrices.Active := true;
	end;
end;

procedure TFormPriceAdd.EditPriceKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonAdd.Click;
	end;
end;

procedure TFormPriceAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQueryProduct.Active := false;
	ADOQuerySupplier.Active := false;
end;

procedure TFormPriceAdd.FormCreate(Sender: TObject);
begin
	DateTimePickerBegin.Date := now;
	DateTimePickerEnd.Date := now;
end;

procedure TFormPriceAdd.FormShow(Sender: TObject);
begin
	ADOQueryProduct.Active := true;
	ADOQuerySupplier.Active := true;
	ADOQueryProduct.FieldByName('sort').DisplayWidth := 25;
	ADOQuerySupplier.FieldByName('name').DisplayWidth := 25;
end;

end.
