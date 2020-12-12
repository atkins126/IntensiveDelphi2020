program HorseIntensiveDelphi2020_Annotation;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.GBSwagger,
  System.SysUtils,
  Model.Error in '..\model\Model.Error.pas',
  Model.User in '..\model\Model.User.pas',
  Annotation.Controller.User in 'Annotation.Controller.User.pas';

procedure SwaggerConfig;
begin
  Swagger
    .Info
      .Title('Horse Annotation')
      .Description('Horse Annotation Intensive Delphi 2020')
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
  THorseGBSwaggerRegister.RegisterPath(TControllerUser);

  THorse.Listen(9001);
end.
