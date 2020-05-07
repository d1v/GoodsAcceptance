unit ItemsUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
	DBGridEhToolCtrls, DynVarsEh, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
	Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, GridsEh, DBAxisGridsEh, DBGridEh,
	System.UITypes;

type
	TFormItems = class(TForm)
		DBGridEhItems: TDBGridEh;
		LabelH1: TLabel;
		Panel1: TPanel;
		DBNavigator1: TDBNavigator;
		BitBtnAdd: TBitBtn;
		BitBtnDelete: TBitBtn;
		BitBtnChange: TBitBtn;
		ADOQueryItems: TADOQuery;
		DataSourceItems: TDataSource;
		procedure FormShow(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure BitBtnAddClick(Sender: TObject);
		procedure BitBtnDeleteClick(Sender: TObject);
		procedure BitBtnChangeClick(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormItems: TFormItems;

implementation

{$R *.dfm}

uses DbMainModuleUnit, MainUnit, ItemAddUnit, ItemEditUnit;

var
	iID: integer;

procedure TFormItems.BitBtnAddClick(Sender: TObject);
begin
	if (not Assigned(FormItemAdd)) then
	begin
		FormItemAdd := TFormItemAdd.Create(Self);
	end;
	FormItemAdd.ShowModal;
	ADOQueryItems.Active := false;
	ADOQueryItems.Active := true;
end;

procedure TFormItems.BitBtnChangeClick(Sender: TObject);
begin
	if DBGridEhItems.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select row for edit.', mtInformation, [mbOK], 0)
	end
	else
	begin
		if (not Assigned(FormItemEdit)) then
		begin
			FormItemEdit := TFormItemEdit.Create(Self);
		end;
		FormItemEdit.ShowModal;
	end;
end;

procedure TFormItems.BitBtnDeleteClick(Sender: TObject);
begin
	if DBGridEhItems.SelectedRows.Count = 0 then
	begin
		MessageDlg('Select rows for delete.', mtInformation, [mbOK], 0)
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('DELETE FROM items WHERE id = :id');
		DbMainModule.ADOQuery1.Parameters.ParamByName('id').Value :=
			ADOQueryItems.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.ExecSQL;
		ADOQueryItems.Active := false;
		ADOQueryItems.Active := true;
	end;
end;

procedure TFormItems.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQueryItems.Active := false;
end;

procedure TFormItems.FormShow(Sender: TObject);
begin
	iID := MainForm.ADOQueryAcs.FieldByName('id').AsInteger;
	LabelH1.Caption := 'Items for acceptance ' + MainForm.ADOQueryAcs.FieldByName
		('id').AsString + ' [ ' + MainForm.ADOQueryAcs.FieldByName('date')
		.AsString + ' ] ';
	ADOQueryItems.SQL.Clear;
	ADOQueryItems.SQL.Add('SELECT i.id, i.weight, t.name, p.sort');
	ADOQueryItems.SQL.Add('FROM ((items as i');
	ADOQueryItems.SQL.Add('INNER JOIN products AS p ON i.idProduct = p.id)');
	ADOQueryItems.SQL.Add('INNER JOIN  types AS t ON p.idType = t.id)');
	ADOQueryItems.SQL.Add('WHERE i.idAcceptance = :iID');
	ADOQueryItems.SQL.Add('ORDER BY i.id DESC;');
	ADOQueryItems.Parameters.ParamByName('iID').Value := iID;
	ADOQueryItems.Active := true;
end;

end.
