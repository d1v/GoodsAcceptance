unit AboutUnit;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ShellApi,
	ActiveX;

type
	TFormAbout = class(TForm)
		MemoAbout: TMemo;
		Image1: TImage;
		LabelLink: TLabel;
		LabelEmail: TLabel;
		Label1: TLabel;
		Label2: TLabel;
		Panel1: TPanel;
		procedure LabelLinkClick(Sender: TObject);
		procedure LabelLinkMouseMove(Sender: TObject; Shift: TShiftState;
			X, Y: Integer);
		procedure LabelLinkMouseLeave(Sender: TObject);
		procedure LabelEmailMouseMove(Sender: TObject; Shift: TShiftState;
			X, Y: Integer);
		procedure LabelEmailMouseLeave(Sender: TObject);
		procedure LabelEmailClick(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.LabelEmailClick(Sender: TObject);
begin
	ShellExecute(Handle, nil, 'mailto:div19-7@mail.ru', nil, nil,
		SW_SHOWNOACTIVATE);
end;

procedure TFormAbout.LabelEmailMouseLeave(Sender: TObject);
begin
	LabelEmail.Font.Color := clBlue;
end;

procedure TFormAbout.LabelEmailMouseMove(Sender: TObject; Shift: TShiftState;
	X, Y: Integer);
begin
	LabelEmail.Font.Color := clRed;
end;

procedure TFormAbout.LabelLinkClick(Sender: TObject);
begin
	ShellExecute(Application.Handle, nil, 'https://github.com/d1v/goodsacceptance', nil, nil,
		SW_SHOWNOACTIVATE);
end;

procedure TFormAbout.LabelLinkMouseLeave(Sender: TObject);
begin
	LabelLink.Font.Color := clBlue;
end;

procedure TFormAbout.LabelLinkMouseMove(Sender: TObject; Shift: TShiftState;
	X, Y: Integer);
begin
	LabelLink.Font.Color := clRed;
end;

end.
