program GoodsAcceptance;

uses
  Vcl.Forms,
  LoginUnit in 'LoginUnit.pas' {FormLogin},
  MainUnit in 'MainUnit.pas' {MainForm},
  DbMainModuleUnit in 'DbMainModuleUnit.pas' {DbMainModule: TDataModule},
  AboutUnit in 'AboutUnit.pas' {FormAbout},
  TypeUnit in 'TypeUnit.pas' {FormTypes},
  TypeAddUnit in 'TypeAddUnit.pas' {FormTypeAdd},
  TypeEditUnit in 'TypeEditUnit.pas' {FormTypeEdit},
  SupplierUnit in 'SupplierUnit.pas' {FormSuppliers},
  SupplierAddUnit in 'SupplierAddUnit.pas' {FormSupplierAdd},
  SupplierEditUnit in 'SupplierEditUnit.pas' {FormSupplierEdit},
  ProductsUnit in 'ProductsUnit.pas' {FormProducts},
  ProductAddUnit in 'ProductAddUnit.pas' {FormProductAdd},
  ProductEditUnit in 'ProductEditUnit.pas' {FormEditProduct},
  PriceAddUnit in 'PriceAddUnit.pas' {FormPriceAdd},
  PriceEditUnit in 'PriceEditUnit.pas' {FormPriceEdit},
  AcAddUnit in 'AcAddUnit.pas' {FormAcAdd},
  AcEditUnit in 'AcEditUnit.pas' {FormAcEdit},
  ItemsUnit in 'ItemsUnit.pas' {FormItems},
  ItemAddUnit in 'ItemAddUnit.pas' {FormItemAdd},
  ItemEditUnit in 'ItemEditUnit.pas' {FormItemEdit},
  ReportTotalProductsUnit in 'ReportTotalProductsUnit.pas' {FormReportTotalProducts},
  ReportUnit in 'ReportUnit.pas' {FormReport};

{$R *.res}

begin
	Application.Initialize;
	Application.CreateForm(TDbMainModule, DbMainModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.MainFormOnTaskbar := True;
	Application.Run;

end.
