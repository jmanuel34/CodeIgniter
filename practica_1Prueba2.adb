with Ada.Text_IO;
use Ada.Text_IO;

procedure Practica_1Prueba2 is

   Line     : STRING(1..33);
   NAME     : constant STRING := ('J','o','h','n');
   JOB      : constant STRING := "Computer Programmer";
   Address  : STRING(1..13) := "Anywhere, USA";
   Letter   : CHARACTER;
   EXAMPLE1 : constant STRING := "A";     -- A string of length 1
   EXAMPLE2 : constant STRING := "";      -- An empty string

begin

   Line := "This is a test of STRINGS in Ada.";
   Put(Line);
   New_Line;
   Put(NAME);
   Put(" is a ");
   Put(JOB);
   Put(" and lives in ");
   Put(Address);
   New_Line(2);

   Address(3) := 'X';               -- Individual letters
   Address(4) := 'Y';               -- Individual letters
   Address(10..13) := NAME(1..4);   -- A slice
   Put(Address);
   New_Line;

end Practica_1Prueba2;




-- Result of execution

-- This is a test of STRINGS in Ada.
-- John is a Computer Programmer and lives in Anywhere, USA
--
-- AnXYhere,John
