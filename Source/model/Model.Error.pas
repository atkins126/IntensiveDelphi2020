unit Model.Error;

interface

type
  TAPIError = class
  private
    FerrorMessage: string;
  public
    property errorMessage: string read FerrorMessage write FerrorMessage;
  end;

implementation

end.
