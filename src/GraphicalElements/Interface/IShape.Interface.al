interface "IShape"
{
    procedure GetShape(): Enum Shape;
    procedure GetShapeCaption(): Text;
    procedure GetBasePoint(): Codeunit Coordinate;
    procedure GetCoordinate(Index: Integer): Codeunit Coordinate;
    procedure Write(var Writer: Interface IWriter);
    procedure AddShape(var Shape: Interface IShape);

    procedure GetNext(): interface "IShape";
}