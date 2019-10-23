page 50103 "Course List"
{
    PageType = List;

    SourceTable = Course;
    CardPageId = "Course Card";
    Editable = false;
    Caption = 'Course List';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
                field(Description; Description)
                {
                    ApplicationArea = All;

                }
                field(Level; Level)
                {
                    ApplicationArea = All;

                }
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;

                }
                field(SPA; SPA)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Insert Table")
            {

                trigger OnAction();
                begin
                    InsertNewRecord();

                end;
            }

        }
    }
    var
        Level: Text[30];


        Suggestion: Text[80];


        SPA: Boolean;

    procedure InsertNewRecord();
    var
        courseRec: Record Course;
    begin
        with courseRec do
            Init;
        "Code" := '80055';
        Name := 'C/SIDE Solution Development';
        Description := 'Advanced topics in programming';
        Type := Type::"Instructor Led";
        "Duration" := 5.0;
        Price := 2500.0;
        Active := true;
        Difficulty := 10;
        "Passing Rate" := 75;
        Insert;
        MESSAGE('Already insert');
    end;

    trigger OnAfterGetRecord();

    begin
        Level := '';
        Suggestion := '';
        SPA := false;
        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginer';
                    Suggestion := 'Take e-learn or remote training';

                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend Instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend Instructor-Led and self study';
                end;
        END;
        IF ("Passing Rate" >= 70) AND (Difficulty >= 6) THEN
            SPA := TRUE;
    end;


}