codeunit 50102 "Drawing" implements "IShape"
{
    var
        Coordinate: Array[1] of Codeunit Coordinate;
        NextShape: Interface IShape;
        Output: Interface IWriter;
        NotImplementedErr: Label 'Object %1 is not implemented yet.', Comment = '%1 = Shape Enum.';

    procedure New(Writer: Enum Writer): Codeunit Drawing;
    var
        Drawing: Codeunit Drawing;
    begin
        Output := Drawing.NewWriter(Writer::Message);
        Drawing.GetCoordinate(1).Init();
        exit(Drawing)
    end;

    procedure NewWriter(Writer: Enum Writer): Interface IWriter;
    var
        MessageWriter: Codeunit MessageWriter;
    begin
        Case Writer of
            Writer::Message:
                Output := MessageWriter.New();
            else
                Error(NotImplementedErr, Writer);
        End;
        exit(Output);
    end;

    procedure NewShape(Shape: Enum Shape): Interface IShape;
    var
        Point: Codeunit Point;
        Line: Codeunit Line;
        Result: Interface IShape;
    begin
        case Shape of
            Shape::Point:
                Result := Point.New();
            Shape::Line:
                Result := Line.New();
            else
                Error(NotImplementedErr, Shape);
        end;
        AddShape(Result);
        exit(Result);
    end;

    procedure GetShape(): Enum Shape;
    begin
        exit(Shape::Drawing);
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

    procedure Write(var Writer: Interface IWriter);
    begin
        Writer.Write(GetShapeCaption());
        Writer.NewLine();

        if HasNextShape() then
            NextShape.Write(Writer);
    end;

    procedure Display()
    begin
        Write(Output);
        Output.Display();
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