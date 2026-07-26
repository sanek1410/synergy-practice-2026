unit WebModuleUnit;

interface

uses
  System.SysUtils,
  System.Classes,
  Web.HTTPApp,
  FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL;

type
  TWebModule1 = class(TWebModule)
  private
    Connection: TFDConnection;
    procedure ShowTours(
      Sender: TObject;
      Request: TWebRequest;
      Response: TWebResponse;
      var Handled: Boolean
    );
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

constructor TWebModule1.CreateNew(AOwner: TComponent; Dummy: Integer);
var
  Action: TWebActionItem;
begin
  inherited CreateNew(AOwner, Dummy);

  Connection := TFDConnection.Create(Self);
  Connection.LoginPrompt := False;
  Connection.Params.Values['DriverID'] := 'MSSQL';
  Connection.Params.Values['Server'] := 'localhost';
  Connection.Params.Values['Database'] := 'TourismWeb';
  Connection.Params.Values['OSAuthent'] := 'Yes';
  Connection.Connected := True;

  Action := Actions.Add;
  Action.Default := True;
  Action.OnAction := ShowTours;
end;

procedure TWebModule1.ShowTours(
  Sender: TObject;
  Request: TWebRequest;
  Response: TWebResponse;
  var Handled: Boolean
);
var
  Query: TFDQuery;
  Html: string;
begin
  Handled := True;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Connection;
    Query.SQL.Text := 'SELECT TourName, Country, Price FROM Tours';
    Query.Open;

    Html := '<html><head><meta charset="utf-8"><title>Туры</title></head><body>';
    Html := Html + '<h1>Список туров</h1><table border="1">';

    while not Query.Eof do
    begin
      Html := Html + '<tr><td>' + Query.FieldByName('TourName').AsString + '</td>';
      Html := Html + '<td>' + Query.FieldByName('Country').AsString + '</td>';
      Html := Html + '<td>' + Query.FieldByName('Price').AsString + ' руб.</td></tr>';
      Query.Next;
    end;

    Html := Html + '</table></body></html>';
    Response.ContentType := 'text/html; charset=utf-8';
    Response.Content := Html;
  finally
    Query.Free;
  end;
end;

end.
