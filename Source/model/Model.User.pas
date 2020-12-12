unit Model.User;

interface

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
    property name: String read Fname write Fname;
    property lastName: string read FlastName write FlastName;
    property birthdayDate: TDateTime read FbirthdayDate write FbirthdayDate;
    property lastUpdate: TDateTime read FlastUpdate write FlastUpdate;
  end;

implementation

end.
