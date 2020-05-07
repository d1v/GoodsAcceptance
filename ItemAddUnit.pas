unit ItemAddUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
	Vcl.DBCtrls, Vcl.StdCtrls, System.UITypes;

type
	TFormItemAdd = class(TForm)
		LabelProduct: TLabel;
		LabelPrice: TLabel;
		EditWeight: TEdit;
		ButtonAdd: TButton;
		DBLookupComboBoxType: TDBLookupComboBox;
		ADOQueryProduct: TADOQuery;
		DataSourceProduct: TDataSource;
		procedure EditWeightKeyPress(Sender: TObject; var Key: Char);
		procedure FormShow(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure ButtonAddClick(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormItemAdd: TFormItemAdd;

implementation

{$R *.dfm}

uses DbMainModuleUnit, MainUnit, ItemsUnit;

procedure TFormItemAdd.ButtonAddClick(Sender: TObject);
begin
	if (DBLookupComboBoxType.Text = '') then
	begin
		MessageDlg('Check product.', mtInformation, [mbOK], 0);
		DBLookupComboBoxType.SetFocus;
	end
	else if (EditWeight.Text = '') then
	begin
		MessageDlg('Check price.', mtInformation, [mbOK], 0);
		EditWeight.SetFocus;
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add
			('INSERT INTO items(idAcceptance, idProduct, weight)');
		DbMainModule.ADOQuery1.SQL.Add
			('VALUES (:idAcceptance, :idProduct, :weight);');
		DbMainModule.ADOQuery1.Parameters.ParamByName('idAcceptance').Value :=
			MainForm.ADOQueryAcs.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.Parameters.ParamByName('idProduct').Value :=
			ADOQueryProduct.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.Parameters.ParamByName('weight').Value :=
			trim(EditWeight.Text);
		DbMainModule.ADOQuery1.ExecSQL;
		EditWeight.Text := '';
		FormItems.ADOQueryItems.Active := false;
		FormItems.ADOQueryItems.Active := true;
	end;
end;

procedure TFormItemAdd.EditWeightKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonAdd.Click;
	end;
end;

procedure TFormItemAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQueryProduct.Active := false;
end;

procedure TFormItemAdd.FormShow(Sender: TObject);
begin
	ADOQueryProduct.Active := true;
	ADOQueryProduct.FieldByName('sort').DisplayWidth := 25;
end;

end.
