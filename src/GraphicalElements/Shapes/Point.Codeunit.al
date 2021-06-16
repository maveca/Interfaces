codeunit 50101 "Point" implements "IShape"
{
    var
        Coordinate: Array[1] of Codeunit Coordinate;
        NextShape: Interface IShape;

    procedure New(): Interface IShape;
    var
        Point: Codeunit Point;
    begin
        Point.GetCoordinate(1).Init();
        exit(Point)
    end;

    procedure GetShape(): Enum Shape;
    begin
        exit(Shape::Point);
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