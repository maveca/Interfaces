codeunit 50106 "MessageWriter" implements IWriter
{
    var
        MessageBody: Text;
        UnsupportedErr: Label '%1 is currently unsupported.', Comment = '%1 = Writer Enum.';

    procedure New(): Interface IWriter;
    var
        MessageWriter: Codeunit MessageWriter;
    begin
        exit(MessageWriter);
    end;

    procedure GetWriter(): Enum Writer;
    begin
        exit(Writer::Message);
    end;

    procedure GetCaption(): Text;
    begin
        exit(Format(GetWriter()));
    end;

    procedure Write(Text: Text)
    begin
        MessageBody += Text;
    end;

    procedure NewLine()
    begin
        MessageBody += '\';
    end;

    procedure Display()
    begin
        Message(MessageBody);
    end;

    procedure Unsupported()
    begin
        Error(UnsupportedErr, GetCaption());
    end;
}