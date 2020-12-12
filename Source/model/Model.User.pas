unit Model.User;

interface

uses
  GBSwagger.Model.Attributes;

type
  TUser = class
  private
    Fid: Double;
    Fname: String;
    FlastName: string;
    FbirthdayDate: TDateTime;
    FlastUpdate: TDateTime;
  public
    property id: Double read Fid write Fid;

    [SwagRequired]
    [SwagString(10, 2)]
    property name: String read Fname write Fname;

    [SwagRequired]
    property lastName: string read FlastName write FlastName;

    property birthdayDate: TDateTime read FbirthdayDate write FbirthdayDate;
    property lastUpdate: TDateTime read FlastUpdate write FlastUpdate;
  end;

implementation

end.
