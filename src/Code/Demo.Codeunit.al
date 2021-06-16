codeunit 50100 "Demo"
{
    trigger OnRun()
    var
        Drawing: Codeunit Drawing;
        Element: Interface IShape;
    begin

        Drawing := Drawing.New(Writer::Message);

        Element := Drawing.NewShape(Shape::Point);
        Element.GetCoordinate(1).Set(1, 2);

        Element := Drawing.NewShape(Shape::Point);
        Element.GetCoordinate(1).Set(4, 2);

        Element := Drawing.NewShape(Shape::Line);
        Element.GetCoordinate(1).Set(1, 2);
        Element.GetCoordinate(2).Set(4, 2);

        Drawing.Display();
    end;
}