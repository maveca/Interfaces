interface IWriter
{
    procedure New(): Interface IWriter;
    procedure GetWriter(): Enum Writer;
    procedure GetCaption(): Text;
    procedure Write(Text: Text);
    procedure NewLine();
    procedure Display();
    procedure Unsupported();
}