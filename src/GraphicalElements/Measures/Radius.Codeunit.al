codeunit 50105 "Radius" implements IMeasure
{
    var
        Radius: Integer;
        WriteLbl: Label 'R[%1]', Comment = '%1 = Radius', Locked = true;

    procedure New() Result: Codeunit Radius;
    begin
        Result.Init();
    end;

    procedure New(R: Integer) Result: Codeunit Radius;
    begin
        Result.Init();
        Result.Set(R);
    end;

    procedure Init()
    begin
        Radius := 0;
    end;

    procedure GetMeasure(): Enum Measure;
    begin
        exit(Measure::Radius);
    end;

    procedure GetCaption(): Text;
    begin
        exit(Format(GetMeasure()));
    end;

    procedure Write(var Writer: Interface IWriter);
    begin
        Writer.Write(StrSubstNo(WriteLbl, Radius));
    end;

    procedure Set(R: Integer)
    begin
        Radius := R;
    end;

    procedure Get(): Integer
    begin
        exit(Radius);
    end;
}