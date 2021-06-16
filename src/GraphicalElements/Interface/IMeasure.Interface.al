interface IMeasure
{
    procedure Init();
    procedure GetMeasure(): Enum Measure;
    procedure GetCaption(): Text;
    procedure Write(var Writer: Interface IWriter);
}