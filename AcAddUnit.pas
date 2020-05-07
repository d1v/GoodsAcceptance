unit AcAddUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
	Vcl.DBCtrls, Vcl.StdCtrls, System.UITypes;

type
	TFormAcAdd = class(TForm)
		LabelComment: TLabel;
		LabelDate: TLabel;
		LabelSupplier: TLabel;
		EditComment: TEdit;
		ButtonAdd: TButton;
		DBLookupComboBoxSupplier: TDBLookupComboBox;
		DateTimePickerBegin: TDateTimePicker;
		ADOQuerySupplier: TADOQuery;
		DataSourceSupplier: TDataSource;
		procedure FormShow(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure EditCommentKeyPress(Sender: TObject; var Key: Char);
		procedure ButtonAddClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormAcAdd: TFormAcAdd;

implementation

{$R *.dfm}

uses DbMainModuleUnit, MainUnit;

procedure TFormAcAdd.ButtonAddClick(Sender: TObject);
begin
	if (DBLookupComboBoxSupplier.Text = '') then
	begin
		MessageDlg('Check Supplier.', mtInformation, [mbOK], 0);
		DBLookupComboBoxSupplier.SetFocus;
	end
	else
	begin
		DbMainModule.ADOQuery1.SQL.Clear;
		DbMainModule.ADOQuery1.SQL.Add
			('INSERT INTO acceptances(idSupplier, [date], comment)');
		DbMainModule.ADOQuery1.SQL.Add('VALUES (:idSupplier, :date, :comment);');
		DbMainModule.ADOQuery1.Parameters.ParamByName('idSupplier').Value :=
			ADOQuerySupplier.FieldByName('id').AsString;
		DbMainModule.ADOQuery1.Parameters.ParamByName('comment').Value :=
			trim(EditComment.Text);
		DbMainModule.ADOQuery1.Parameters.ParamByName('date').Value :=
			FormatDateTime('dd.mm.yyyy', DateTimePickerBegin.Date);
		DbMainModule.ADOQuery1.ExecSQL;
		EditComment.Text := '';
		MainForm.ADOQueryAcs.Active := false;
		MainForm.ADOQueryAcs.Active := true;
	end;
end;

procedure TFormAcAdd.EditCommentKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
	begin
		ButtonAdd.Click;
	end;
end;

procedure TFormAcAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQuerySupplier.Active := false;
end;

procedure TFormAcAdd.FormCreate(Sender: TObject);
begin
	DateTimePickerBegin.Date := now;
end;

procedure TFormAcAdd.FormShow(Sender: TObject);
begin
	ADOQuerySupplier.Active := true;
	ADOQuerySupplier.FieldByName('name').DisplayWidth := 25;
end;

end.
