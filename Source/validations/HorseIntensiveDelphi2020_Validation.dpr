program HorseIntensiveDelphi2020_Validation;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.HandleException,
  Horse.Jhonson,
  Horse.GBSwagger,
  System.SysUtils,
  Model.Error in '..\model\Model.Error.pas',
  Model.User in '..\model\Model.User.pas',
  Controller.User in 'Controller.User.pas';

procedure SwaggerConfig;
begin
  Swagger
    .Info
      .Title('Horse Validation')
      .Description('Horse Validation Intensive Delphi 2020')
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
  THorse
    .Use(HorseSwagger)
    .Use(Jhonson)
    .Use(HandleException);

  SwaggerConfig;
  THorseGBSwaggerRegister.RegisterPath(TControllerUser);

  THorse.Listen(9002);
end.
