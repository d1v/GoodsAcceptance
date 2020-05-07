unit DbMainModuleUnit;

interface

uses
	System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
	Data.Win.ADODB;

type
	TDbMainModule = class(TDataModule)
		ADOConnection1: TADOConnection;
		ADOQuery1: TADOQuery;
		ADODataSetUser: TADODataSet;
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	DbMainModule: TDbMainModule;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

end.
