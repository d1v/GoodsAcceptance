unit TypeUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
	DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,
	Data.DB, Bde.DBTables, Data.Win.ADODB, MemTableDataEh, DataDriverEh,
	ADODataDriverEh, MemTableEh, Vcl.DBCtrls, Vcl.StdCtrls, EhLibADO, Vcl.Buttons,
	System.UITypes;

type
	TFormTypes = class(TForm)
		Panel1: TPanel;
		DBGridEh1: TDBGridEh;
		DataSource1: TDataSource;
		ADOQueryTypes: TADOQuery;
		DBNavigator1: TDBNavigator;
		BitBtnAdd: TBitBtn;
		BitBtnDelete: TBitBtn;
		BitBtnChange: TBitBtn;
		LabelH1: TLabel;
		procedure BitBtnAddClick(Sender: TObject);
		procedure BitBtnDeleteClick(Sender: TObject);
		procedure BitBtnChangeClick(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormShow(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormTypes: TFormTypes;

implementation

{$R *.dfm}

uses DbMainModuleUnit, TypeAddUnit, TypeEditUnit;

procedure TFormTypes.BitBtnAddClick(Sender: TObject);
begin
	if (not Assigned(FormTypeAdd)) then
	begin
		FormTypeAdd := TFormTypeAdd.Create(Self);
	end;
	FormTypeAdd.ShowModal;
end;

procedure TFormTypes.BitBtnChangeClick(Sender: TObject);
begin
	if DBGridEh1.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select row for edit.', mtInformation, [mbOK], 0)
	end
	else
	begin
		if (not Assigned(FormTypeEdit)) then
		begin
			FormTypeEdit := TFormTypeEdit.Create(Self);
		end;
		FormTypeEdit.ShowModal;
	end;
end;

procedure TFormTypes.BitBtnDeleteClick(Sender: TObject);
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

procedure TFormTypes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQueryTypes.Active := false;
end;

procedure TFormTypes.FormShow(Sender: TObject);
begin
	ADOQueryTypes.Active := true;
end;

end.
