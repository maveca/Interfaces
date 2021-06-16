codeunit 50103 "Line" implements "IShape"
{
    var
        Coordinate: Array[2] of Codeunit Coordinate;
        NextShape: Interface IShape;

    procedure New(): Interface IShape;
    var
        Line: Codeunit Line;
    begin
        Line.GetCoordinate(1).Init();
        Line.GetCoordinate(2).Init();
        exit(Line)
    end;

    procedure GetShape(): Enum Shape;
    begin
        exit(Shape::Line);
    end;

    procedure GetShapeCaption(): Text;
    begin
        exit(Format(GetShape()));
    end;

    procedure GetBasePoint(): Codeunit Coordinate;
    begin
        exit(GetCoordinate(1));
    end;

    procedure GetCoordinate(Index: Integer): Codeunit Coordinate;
    begin
        exit(Coordinate[Index]);
    end;

    procedure AddShape(var Shape: Interface IShape)
    begin
        if (HasNextShape()) then
            NextShape.AddShape(Shape)
        else
            NextShape := Shape;
    end;

    procedure Write(var Output: Interface IWriter);
    begin
        case Output.GetWriter() of
            Writer::Message, Writer::FileWriter:
                WriteToFile(Output);
            else
                Output.Unsupported();
        end;
    end;

    local procedure WriteToFile(var Writer: Interface IWriter)
    begin
        Writer.Write(GetShapeCaption());
        Writer.Write('(');
        Coordinate[1].Write(Writer);
        Writer.Write('-');
        Coordinate[2].Write(Writer);
        Writer.Write(')');
        Writer.NewLine();

        if HasNextShape() then
            NextShape.Write(Writer);
    end;

    procedure GetNext(): Interface IShape
    begin
        exit(NextShape);
    end;

    [TryFunction]
    local procedure HasNextShape()
    var
        Result: Text;
    begin
        Result := Format(NextShape);
    end;
}