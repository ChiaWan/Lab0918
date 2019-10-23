tableextension 50107 "Customer Extend" extends Customer
{
    fields
    {
        // Add changes to table fields here
    }
    procedure UpdateCreditLimit(NewCreditLimit: Decimal);
    begin
        NewCreditLimit := ROUND(NewCreditLimit, 10000);
        Rec.Validate("Credit Limit (LCY)", NewCreditLimit);
        Rec.MODIFY;
    end;

    procedure CalculateCreditLimit(): Decimal;
    var
        Cust: Record Customer;
    begin
        Cust := Rec;
        Cust.SetRange("Date Filter", CalcDate('<-12M>', WORKDATE), WORKDATE);
        Cust.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(round(Cust."Sales (LCY)" * 0.5));
    end;

    var
        myInt: Integer;
}