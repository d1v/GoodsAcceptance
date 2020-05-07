unit ProductsUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
	DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, Data.DB, Data.Win.ADODB, GridsEh,
	DBAxisGridsEh, DBGridEh, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls,
	System.UITypes;

type
	TFormProducts = class(TForm)
		Panel1: TPanel;
		DBNavigator1: TDBNavigator;
		BitBtnAdd: TBitBtn;
		BitBtnDelete: TBitBtn;
		BitBtnChange: TBitBtn;
		DBGridEh1: TDBGridEh;
		DataSource1: TDataSource;
		ADOQueryProducts: TADOQuery;
		LabelH1: TLabel;
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormShow(Sender: TObject);
		procedure BitBtnDeleteClick(Sender: TObject);
		procedure BitBtnAddClick(Sender: TObject);
		procedure BitBtnChangeClick(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormProducts: TFormProducts;

implementation

{$R *.dfm}

uses DbMainModuleUnit, ProductAddUnit, ProductEditUnit;

procedure TFormProducts.BitBtnAddClick(Sender: TObject);
begin
	if (not Assigned(FormProductAdd)) then
	begin
		FormProductAdd := TFormProductAdd.Create(Self);
	end;
	FormProductAdd.ShowModal;
	ADOQueryProducts.Active := false;
	ADOQueryProducts.Active := true;
end;

procedure TFormProducts.BitBtnChangeClick(Sender: TObject);
begin
	if DBGridEh1.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select row for edit.', mtInformation, [mbOK], 0)
	end
	else
	begin
		if (not Assigned(FormEditProduct)) then
		begin
			FormEditProduct := TFormEditProduct.Create(Self);
		end;
		FormEditProduct.ShowModal;
		FormProducts.ADOQueryProducts.Active := false;
		FormProducts.ADOQueryProducts.Active := true;
	end;
end;

procedure TFormProducts.BitBtnDeleteClick(Sender: TObject);
begin
	if DBGridEh1.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select rows for delete.', mtInformation, [mbOK], 0)
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('DELETE FROM products WHERE id = :id');
		DbMainModule.ADOQuery1.Parameters.ParamByName('id').Value :=
			ADOQueryProducts.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.ExecSQL;
		FormProducts.ADOQueryProducts.Active := false;
		FormProducts.ADOQueryProducts.Active := true;
	end;
end;

procedure TFormProducts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQueryProducts.Active := false;
end;

procedure TFormProducts.FormShow(Sender: TObject);
begin
	ADOQueryProducts.Active := true;
end;

end.
