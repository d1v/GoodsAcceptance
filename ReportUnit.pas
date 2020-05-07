unit ReportUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
	Vcl.ComCtrls, Vcl.ExtCtrls, System.UITypes;

type
	TFormReport = class(TForm)
		LabelDate: TLabel;
		DateTimePickerBegin: TDateTimePicker;
		ButtonPreview: TButton;
		ADOQueryReport: TADOQuery;
		DataSourceProduct: TDataSource;
		DateTimePickerEnd: TDateTimePicker;
		Panel1: TPanel;
		ButtonExport: TButton;
		procedure ButtonPreviewClick(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure ButtonExportClick(Sender: TObject);
		procedure FormShow(Sender: TObject);
		procedure FormCreate(Sender: TObject);

	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormReport: TFormReport;
	seccess: boolean;
function prepareReport(): boolean;

implementation

{$R *.dfm}

uses DbMainModuleUnit, MainUnit, ReportTotalProductsUnit;

function prepareReport(): boolean;
begin
	if (FormReport.DateTimePickerBegin.Date > FormReport.DateTimePickerEnd.Date)
	then
	begin
		MessageDlg('Check date interval.', mtInformation, [mbOK], 0);
		result := false;
	end
	else
	begin
		FormReport.ADOQueryReport.SQL.Clear;
		FormReport.ADOQueryReport.SQL.Add
			('SELECT Q1.types.name, Q1.sort, Q1.suppliers.name, Q1.INN, Sum(Q1.[Sum-weight]) AS [Sum-Sum-weight], Sum(Q1.[Total cost]) AS [Sum-Total cost]');
		FormReport.ADOQueryReport.SQL.Add
			('FROM (SELECT types.name, products.sort, suppliers.name, suppliers.INN, Sum(items.weight) AS [Sum-weight], ([prices]![price]*items.weight) AS [Total cost]');
		FormReport.ADOQueryReport.SQL.Add
			('FROM types INNER JOIN (suppliers INNER JOIN ((products INNER JOIN (acceptances INNER JOIN items ON acceptances.id = items.idAcceptance) ON products.id = items.idProduct)');
		FormReport.ADOQueryReport.SQL.Add
			('INNER JOIN prices ON products.id = prices.idProduct) ON (suppliers.id = prices.idSupplier) AND (suppliers.id = acceptances.idSupplier)) ON types.id = products.idType');
		FormReport.ADOQueryReport.SQL.Add
			('GROUP BY types.name, products.sort, suppliers.name, suppliers.INN, prices.price, ([prices]![price]*items.weight), acceptances.date, prices.dateBegin, prices.dateEnd');
		FormReport.ADOQueryReport.SQL.Add
			('HAVING (([acceptances]![date]>=:dateBegin And [acceptances]![date]<=:dateEnd) AND ((prices.dateBegin)<=[acceptances]![date]) AND ((prices.dateEnd)>=[acceptances]![date]))) AS Q1');
		FormReport.ADOQueryReport.SQL.Add
			('GROUP BY Q1.types.name, Q1.sort, Q1.suppliers.name, Q1.INN');
		FormReport.ADOQueryReport.SQL.Add
			('ORDER BY Q1.types.name, Q1.sort, Q1.suppliers.name;');
		FormReport.ADOQueryReport.Parameters.ParamByName('dateBegin').Value :=
			FormatDateTime('dd.mm.yyyy', FormReport.DateTimePickerBegin.Date);
		FormReport.ADOQueryReport.Parameters.ParamByName('dateEnd').Value :=
			FormatDateTime('dd.mm.yyyy', FormReport.DateTimePickerEnd.Date);
		FormReport.ADOQueryReport.Active := true;
		FormReportTotalProducts.frxReport1.Variables['DateBegin'] :=
			'''' + FormReport.ADOQueryReport.Parameters.ParamByName('dateBegin')
			.Value + '''';
		FormReportTotalProducts.frxReport1.Variables['DateEnd'] :=
			'''' + FormReport.ADOQueryReport.Parameters.ParamByName('dateEnd')
			.Value + '''';
		result := true;
	end;
end;

procedure TFormReport.ButtonExportClick(Sender: TObject);
begin
	if (prepareReport() = true) then
	begin
		FormReportTotalProducts.frxReport1.Export
			(FormReportTotalProducts.frxPDFExport1);
	end;
end;

procedure TFormReport.ButtonPreviewClick(Sender: TObject);
begin
	if (prepareReport() = true) then
	begin
		FormReportTotalProducts.ShowModal;
	end;
end;

procedure TFormReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ADOQueryReport.Active := false;
end;

procedure TFormReport.FormCreate(Sender: TObject);
begin
	DateTimePickerBegin.Date := now;
	DateTimePickerEnd.Date := now;
end;

procedure TFormReport.FormShow(Sender: TObject);
begin
	if (not Assigned(FormReportTotalProducts)) then
	begin
		FormReportTotalProducts := TFormReportTotalProducts.Create(Self);
	end;
end;

end.
