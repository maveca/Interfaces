pageextension 50100 "Customer List Ext" extends "Customer List"
{
    actions
    {
        addbefore(CustomerLedgerEntries)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Caption = 'Test';
                Image = TestFile;
                Promoted = true;
                PromotedCategory = Category7;
                ShortCutKey = 'Ctrl+1';
                ToolTip = 'For executing demo codeunit.';

                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Demo");
                end;
            }
        }

    }
}
