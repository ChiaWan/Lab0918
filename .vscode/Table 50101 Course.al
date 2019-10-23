table 50101 Course
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Code"; Code[10])
        {


        }
        field(20; Name; Text[30])
        {


        }
        field(30; Description; Text[80])
        {


        }
        field(40; Type; Option)
        {
            OptionMembers = "Instructor Led","e-Learning","Remote Training";

        }
        field(50; "Duration"; Decimal)
        {

        }
        field(60; Price; Decimal)
        {

        }
        field(70; Active; Boolean)
        {

        }
        field(80; Difficulty; Integer)
        {

        }
        field(90; "Passing Rate"; Integer)
        {

        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}