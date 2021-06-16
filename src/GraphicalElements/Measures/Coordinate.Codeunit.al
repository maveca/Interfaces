codeunit 50104 "Coordinate" implements IMeasure
{
    var
        CoordinateX: Integer;
        CoordinateY: Integer;
        WriteLbl: Label '[%1,%2]', Comment = '%1 = X coordinate ; %2 = Y coordinate', Locked = true;

    procedure New() Result: Codeunit Coordinate;
    begin
        Result.Init();
    end;

    procedure New(X: Integer; Y: Integer) Result: Codeunit Coordinate;
    begin
        Result.Init();
        Result.Set(X, Y);
    end;

    procedure Init()
    begin
        CoordinateX := 0;
        CoordinateY := 0;
    end;

    procedure GetMeasure(): Enum Measure;
    begin
        exit(Measure::Coordinate);
    end;

    procedure GetCaption(): Text;
    begin
        exit(Format(GetMeasure()));
    end;

    procedure Write(var Writer: Interface IWriter);
    begin
        Writer.Write(StrSubstNo(WriteLbl, CoordinateX, CoordinateY));
    end;

    procedure Set(X: Integer; Y: Integer)
    begin
        SetX(X);
        SetY(Y);
    end;

    procedure SetX(X: Integer)
    begin
        CoordinateX := X;
    end;

    procedure GetX(): Integer
    begin
        exit(CoordinateX);
    end;

    procedure SetY(Y: Integer)
    begin
        CoordinateY := Y;
    end;

    procedure GetY(): Integer
    begin
        exit(CoordinateY);
    end;
}