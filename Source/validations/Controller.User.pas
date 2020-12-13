unit Controller.User;

interface

uses
  Horse,
  Horse.GBSwagger,
  Model.User,
  GBSwagger.Path.Attributes,
  GBSwagger.Validator.Interfaces,
  REST.Json,
  System.JSON;

type
  [SwagPath('user', 'Users')]
  TControllerUser = class(THorseGBSwagger)

  public
    [SwagGET('List Users', True)]
    [SwagParamQuery('id', 'user id')]
    [SwagResponse(200, TUser, 'Users data', True)]
    procedure GetUsers;

    [SwagGET('{id}', 'Find User')]
    [SwagParamPath('id', 'user id')]
    [SwagResponse(200, TUser, 'User data')]
    [SwagResponse(404)]
    procedure FindUser;

    [SwagPOST('Insert a new user')]
    [SwagParamBody('UserData', TUser)]
    [SwagResponse(201, TUser)]
    [SwagResponse(400)]
    procedure InsertUser;

    [SwagPUT('{id}', 'Update user')]
    [SwagParamPath('id', 'user id')]
    [SwagParamBody('User Data', TUser)]
    [SwagResponse(204)]
    [SwagResponse(400)]
    [SwagResponse(404)]
    procedure UpdateUser;

    [SwagDELETE('{id}', 'Delete user')]
    [SwagParamPath('id', 'user id')]
    [SwagResponse(204)]
    [SwagResponse(400)]
    [SwagResponse(404)]
    procedure DeleteUser;
  end;

implementation

{ TControllerUser }

procedure TControllerUser.DeleteUser;
begin
  FResponse.Status(204);
end;

procedure TControllerUser.FindUser;
begin
  FResponse.Send('{"id": 1, "name": "user 1"}');
end;

procedure TControllerUser.GetUsers;
begin
  FResponse.Send('[{"id": 1, "name": "user 1"}]');
end;

procedure TControllerUser.InsertUser;
var
  user : TUser;
begin
  user := TJson.JsonToObject<TUser>(FRequest.Body);
  try
    SwaggerValidator.validate(user);
    FResponse.Send(FRequest.Body).Status(201);
  finally
    user.Free;
  end;
end;

procedure TControllerUser.UpdateUser;
begin
  FResponse.Status(204);
end;

end.
