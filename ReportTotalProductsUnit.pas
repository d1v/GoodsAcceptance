unit ReportTotalProductsUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxPreview, frxDBSet, Data.DB,
	Data.Win.ADODB, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
	GridsEh, DBAxisGridsEh, DBGridEh, frxExportPDF;

type
	TFormReportTotalProducts = class(TForm)
		frxReport1: TfrxReport;
		frxDBDataset1: TfrxDBDataset;
		frxPreview1: TfrxPreview;
		frxPDFExport1: TfrxPDFExport;
		procedure FormShow(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormReportTotalProducts: TFormReportTotalProducts;

implementation

{$R *.dfm}

uses DbMainModuleUnit, MainUnit, ReportUnit;

procedure TFormReportTotalProducts.FormShow(Sender: TObject);
begin
	frxReport1.ShowReport();
end;

end.
