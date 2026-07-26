library TourismWeb;

uses
  Web.WebBroker,
  Web.Win.ISAPIApp,
  WebModuleUnit in 'WebModuleUnit.pas';

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
