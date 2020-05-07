unit MainUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
	Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList, Vcl.ActnMan,
	Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Grids,
	Vcl.DBGrids, Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
	DynVarsEh, Data.DB, Data.Win.ADODB, GridsEh, DBAxisGridsEh, DBGridEh,
	Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, System.UITypes;

type
	TMainForm = class(TForm)
		ActionManager1: TActionManager;
		ActionExit: TAction;
		ActionShowTypes: TAction;
		ActionShowProducts: TAction;
		ActionShowSuppliers: TAction;
		ActionShowReport: TAction;
		ActionMainMenuBar1: TActionMainMenuBar;
		ActionShowAbout: TAction;
		PagesMain: TPageControl;
		TabSheetAcceptance: TTabSheet;
		TabSheetPrices: TTabSheet;
		Panel1: TPanel;
		DBNavigator1: TDBNavigator;
		BitBtnAdd: TBitBtn;
		BitBtnDelete: TBitBtn;
		BitBtnChange: TBitBtn;
		DBGridEhPrice: TDBGridEh;
		DataSourcePrices: TDataSource;
		ADOQueryPrices: TADOQuery;
		LabelH1: TLabel;
		LabelH1Acceptances: TLabel;
		DBGridEhAcs: TDBGridEh;
		Panel2: TPanel;
		DBNavigator2: TDBNavigator;
		BitBtnAcAdd: TBitBtn;
		BitBtnAcDel: TBitBtn;
		BitBtnAcEdit: TBitBtn;
		ADOQueryAcs: TADOQuery;
		DataSourceAcs: TDataSource;
		BitBtnOpen: TBitBtn;
		procedure ActionExitExecute(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure ActionShowAboutExecute(Sender: TObject);
		procedure ActionShowTypesExecute(Sender: TObject);
		procedure ActionShowSuppliersExecute(Sender: TObject);
		procedure ActionShowProductsExecute(Sender: TObject);
		procedure BitBtnAddClick(Sender: TObject);
		procedure BitBtnDeleteClick(Sender: TObject);
		procedure BitBtnChangeClick(Sender: TObject);
		procedure BitBtnAcAddClick(Sender: TObject);
		procedure BitBtnAcDelClick(Sender: TObject);
		procedure BitBtnAcEditClick(Sender: TObject);
		procedure BitBtnOpenClick(Sender: TObject);
		procedure ActionShowReportExecute(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	MainForm: TMainForm;
	iID: integer;

implementation

{$R *.dfm}

uses LoginUnit, AboutUnit, DbMainModuleUnit, TypeUnit, SupplierUnit,
	ProductsUnit, PriceAddUnit, PriceEditUnit, AcAddUnit, AcEditUnit, ItemsUnit,
	ReportTotalProductsUnit,
	ReportUnit;

procedure TMainForm.ActionExitExecute(Sender: TObject);
begin
	application.Terminate;
end;

procedure TMainForm.ActionShowAboutExecute(Sender: TObject);
begin
	if (not Assigned(FormAbout)) then
	begin
		FormAbout := TFormAbout.Create(Self);
	end;
	FormAbout.Show;
end;

procedure TMainForm.ActionShowProductsExecute(Sender: TObject);
begin
	if (not Assigned(FormProducts)) then
	begin
		FormProducts := TFormProducts.Create(Self);
	end;
	FormProducts.ShowModal;
end;

procedure TMainForm.ActionShowReportExecute(Sender: TObject);
begin
	if (not Assigned(FormReport)) then
	begin
		FormReport := TFormReport.Create(Self);
	end;
	FormReport.ShowModal;
end;

procedure TMainForm.ActionShowSuppliersExecute(Sender: TObject);
begin
	if (not Assigned(FormSuppliers)) then
	begin
		FormSuppliers := TFormSuppliers.Create(Self);
	end;
	FormSuppliers.ShowModal;
end;

procedure TMainForm.ActionShowTypesExecute(Sender: TObject);
begin
	if (not Assigned(FormTypes)) then
	begin
		FormTypes := TFormTypes.Create(Self);
	end;
	FormTypes.ShowModal;
end;

procedure TMainForm.BitBtnAcAddClick(Sender: TObject);
begin
	if (not Assigned(FormAcAdd)) then
	begin
		FormAcAdd := TFormAcAdd.Create(Self);
	end;
	FormAcAdd.ShowModal;
	ADOQueryAcs.Active := false;
	ADOQueryAcs.Active := true;
end;

procedure TMainForm.BitBtnAcDelClick(Sender: TObject);
begin
	if DBGridEhAcs.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select rows for delete.', mtInformation, [mbOK], 0)
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('DELETE FROM acceptances WHERE id = :id');
		DbMainModule.ADOQuery1.Parameters.ParamByName('id').Value :=
			ADOQueryAcs.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.ExecSQL;
		ADOQueryAcs.Active := false;
		ADOQueryAcs.Active := true;
	end;
end;

procedure TMainForm.BitBtnAcEditClick(Sender: TObject);
begin
	if DBGridEhAcs.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select row for edit.', mtInformation, [mbOK], 0)
	end
	else
	begin
		if (not Assigned(FormAcEdit)) then
		begin
			FormAcEdit := TFormAcEdit.Create(Self);
		end;
		FormAcEdit.ShowModal;
	end;
end;

procedure TMainForm.BitBtnAddClick(Sender: TObject);
begin
	if (not Assigned(FormPriceAdd)) then
	begin
		FormPriceAdd := TFormPriceAdd.Create(Self);
	end;
	FormPriceAdd.ShowModal;
	ADOQueryPrices.Active := false;
	ADOQueryPrices.Active := true;
end;

procedure TMainForm.BitBtnChangeClick(Sender: TObject);
begin
	if DBGridEhPrice.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select row for edit.', mtInformation, [mbOK], 0)
	end
	else
	begin
		if (not Assigned(FormPriceEdit)) then
		begin
			FormPriceEdit := TFormPriceEdit.Create(Self);
		end;
		FormPriceEdit.ShowModal;
	end;
end;

procedure TMainForm.BitBtnDeleteClick(Sender: TObject);
begin
	if DBGridEhPrice.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select rows for delete.', mtInformation, [mbOK], 0)
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('DELETE FROM prices WHERE id = :id');
		DbMainModule.ADOQuery1.Parameters.ParamByName('id').Value :=
			ADOQueryPrices.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.ExecSQL;
		ADOQueryPrices.Active := false;
		ADOQueryPrices.Active := true;
	end;
end;

procedure TMainForm.BitBtnOpenClick(Sender: TObject);
begin
	if DBGridEhAcs.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select row for open.', mtInformation, [mbOK], 0)
	end
	else
	begin
		iID := ADOQueryAcs.RecNo;
		if (not Assigned(FormItems)) then
		begin
			FormItems := TFormItems.Create(Self);
		end;
		FormItems.ShowModal;
		ADOQueryAcs.Active := false;
		ADOQueryAcs.Active := true;
		ADOQueryAcs.RecNo := iID;
		DBGridEhAcs.SelectedRows.CurrentRowSelected := true;
	end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
	application.CreateForm(TFormLogin, FormLogin);
	FormLogin.ShowModal;
	FormLogin.Free;
end;

end.
