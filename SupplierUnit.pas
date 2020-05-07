unit SupplierUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
	DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, Data.DB, Data.Win.ADODB, GridsEh,
	DBAxisGridsEh, DBGridEh, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls,
	System.UITypes;

type
	TFormSuppliers = class(TForm)
		Panel1: TPanel;
		DBNavigator1: TDBNavigator;
		BitBtnAdd: TBitBtn;
		BitBtnDelete: TBitBtn;
		BitBtnChange: TBitBtn;
		DBGridEh1: TDBGridEh;
		DataSource1: TDataSource;
		ADOQuerySuppliers: TADOQuery;
		LabelH1: TLabel;
		procedure BitBtnAddClick(Sender: TObject);
		procedure BitBtnChangeClick(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormShow(Sender: TObject);
		procedure BitBtnDeleteClick(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormSuppliers: TFormSuppliers;

implementation

{$R *.dfm}

uses SupplierAddUnit, SupplierEditUnit;

procedure TFormSuppliers.BitBtnAddClick(Sender: TObject);
begin
	if (not Assigned(FormSupplierAdd)) then
	begin
		FormSupplierAdd := TFormSupplierAdd.Create(Self);
	end;
	FormSupplierAdd.ShowModal;
end;

procedure TFormSuppliers.BitBtnChangeClick(Sender: TObject);
begin
	if DBGridEh1.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select row for edit.', mtInformation, [mbOK], 0)
	end
	else
	begin
		if (not Assigned(FormSupplierEdit)) then
		begin
			FormSupplierEdit := TFormSupplierEdit.Create(Self);
		end;
		FormSupplierEdit.ShowModal;
	end;
end;

procedure TFormSuppliers.BitBtnDeleteClick(Sender: TObject);
begin
	if DBGridEh1.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select rows for delete.', mtInformation, [mbOK], 0)
	end
	else
	begin
		DBGridEh1.SelectedRows.Delete;
	end;
end;

procedure TFormSuppliers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQuerySuppliers.Active := false;
end;

procedure TFormSuppliers.FormShow(Sender: TObject);
begin
	ADOQuerySuppliers.Active := true;
end;

end.
