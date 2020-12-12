program HorseIntensiveDelphi2020_Basic;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.GBSwagger,
  System.SysUtils,
  Model.User in '..\model\Model.User.pas',
  Model.Error in '..\model\Model.Error.pas';

procedure SwaggerConfig;
begin
  Swagger
    .Info
      .Title('Horse Sample')
      .Description('API Horse')
      .Contact
        .Name('Contact Name')
        .Email('contact@email.com.br')
        .URL('http://www.mypage.com.br')
      .&End
    .&End
    .Register
      .SchemaOnError(TAPIError)
    .&End
    .BasePath('v1');
end;

begin
  SwaggerConfig;

  THorse.Use(HorseSwagger);

  THorse.Get ('v1/user',
    procedure (Req: THorseRequest; Resp: THorseResponse; Next: TProc)
    begin
      // buscar no banco
      Resp.Send('[{"id": 1, "name":"user 1", "lastName": "user 1"}]').Status(200);
      THorseHackResponse(Resp).GetWebResponse.ContentType := 'application/json';
    end);

  THorse.Post('v1/user',
    procedure (Req: THorseRequest; Resp: THorseResponse; Next: TProc)
    begin
      // inserir no banco
      Resp.Send('{"id": 1, "name":"user 1", "lastName": "user 1"}').Status(201);
      THorseHackResponse(Resp).GetWebResponse.ContentType := 'application/json';
    end);

  THorse.Get ('v1/user/:id',
    procedure (Req: THorseRequest; Resp: THorseResponse; Next: TProc)
    begin
      // buscar no banco
      Resp.Send('{"id": 1, "name":"user 1", "lastName": "user 1"}').Status(200);
      THorseHackResponse(Resp).GetWebResponse.ContentType := 'application/json';
    end);

  THorse.Put ('v1/user/:id',
    procedure (Req: THorseRequest; Resp: THorseResponse; Next: TProc)
    begin
      // alterar no banco
      Resp.Status(204);
    end);

  THorse.Delete('v1/user/:id',
    procedure (Req: THorseRequest; Resp: THorseResponse; Next: TProc)
    begin
      // excluir no banco
      Resp.Status(204);
    end);

  Swagger
    .Path('user')
      .Tag('User')
      .GET('List all', 'List all users')
        .AddResponse(200, 'successful operation')
          .Schema(TUser)
          .IsArray(True)
        .&End
        .AddResponse(400).&End
        .AddResponse(500).&End
      .&End
      .POST('Add user', 'Add a new user')
        .AddParamBody('User data', 'User data')
          .Required(True)
          .Schema(TUser)
        .&End
        .AddResponse(201)
          .Schema(TUser)
        .&End
        .AddResponse(400).&End
        .AddResponse(500).&End
      .&End
    .&End
    .Path('user/{id}')
    .Tag('User')
      .GET('Find user by id')
        .AddParamPath('id', 'user id')
          .Schema(SWAG_INTEGER)
        .&End
        .AddResponse(200, 'user')
          .Schema(TUser)
        .&End
        .AddResponse(404).&End
      .&End
      .PUT('Update user')
        .AddParamPath('id', 'user id')
          .Schema(SWAG_INTEGER)
        .&End
        .AddParamBody('User')
          .Schema(TUser)
        .&End
        .AddResponse(204).&End
        .AddResponse(404).&End
        .AddResponse(400).&End
      .&End
      .DELETE('Delete user')
        .AddParamPath('id', 'user id')
          .Schema(SWAG_INTEGER)
        .&End
        .AddResponse(204).&End
        .AddResponse(400).&End
        .AddResponse(404).&End
      .&End
    .&End
  .&End;

  THorse.Listen(9000);
end.
