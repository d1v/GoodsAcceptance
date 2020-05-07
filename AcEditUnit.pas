unit AcEditUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
	Vcl.DBCtrls, Vcl.StdCtrls, System.UITypes;

type
	TFormAcEdit = class(TForm)
		LabelComment: TLabel;
		LabelDate: TLabel;
		LabelSupplier: TLabel;
		EditComment: TEdit;
		ButtonAdd: TButton;
		DBLookupComboBoxSupplier: TDBLookupComboBox;
		DateTimePickerBegin: TDateTimePicker;
		ADOQuerySupplier: TADOQuery;
		DataSourceSupplier: TDataSource;
		procedure EditCommentKeyPress(Sender: TObject; var Key: Char);
		procedure FormShow(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure ButtonAddClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormAcEdit: TFormAcEdit;
	iID: integer;

implementation

{$R *.dfm}

uses MainUnit, DbMainModuleUnit;

procedure TFormAcEdit.ButtonAddClick(Sender: TObject);
begin
	if (DBLookupComboBoxSupplier.Text = '') then
	begin
		MessageDlg('Check Supplier.', mtInformation, [mbOK], 0);
		DBLookupComboBoxSupplier.SetFocus;
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add('UPDATE acceptances');
		DbMainModule.ADOQuery1.SQL.Add
			('SET idSupplier = :idSupplier, comment = :comment, [date] = :date');
		DbMainModule.ADOQuery1.SQL.Add('WHERE id = :id');
		DbMainModule.ADOQuery1.Parameters.ParamByName('idSupplier').Value :=
			ADOQuerySupplier.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.Parameters.ParamByName('comment').Value :=
			trim(EditComment.Text);
		DbMainModule.ADOQuery1.Parameters.ParamByName('date').Value :=
			FormatDateTime('dd.mm.yyyy', DateTimePickerBegin.Date);
		DbMainModule.ADOQuery1.Parameters.ParamByName('id').Value := iID;
		DbMainModule.ADOQuery1.ExecSQL;
		MainForm.ADOQueryAcs.Active := false;
		MainForm.ADOQueryAcs.Active := true;
	end;
end;

procedure TFormAcEdit.EditCommentKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonAdd.Click;
	end;
end;

procedure TFormAcEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQuerySupplier.Active := false;
end;

procedure TFormAcEdit.FormCreate(Sender: TObject);
begin
	DateTimePickerBegin.Date := now;
end;

procedure TFormAcEdit.FormShow(Sender: TObject);
begin
	iID := MainForm.ADOQueryAcs.FieldByName('id').AsInteger;
	ADOQuerySupplier.Active := true;
	ADOQuerySupplier.FieldByName('name').DisplayWidth := 25;

	DateTimePickerBegin.Date := MainForm.ADOQueryAcs.FieldByName('date')
		.AsDateTime;
	DBLookupComboBoxSupplier.KeyValue := MainForm.ADOQueryAcs.FieldByName
		('name').AsString;
	EditComment.Text := MainForm.ADOQueryAcs.FieldByName('comment').AsString;
end;

end.
