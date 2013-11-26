
with Text_Io; use Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure practica_1V2 is
   numFilas: constant Integer:= 3;
   numElem: constant Integer:= 10;

   -- Ficheros
   ficheroDatos: Text_IO.File_Type;

   -- Declaracion de tipo de numero en coma fija
   type coma_fija is delta 0.0000001 digits 18;
   package coma_fija_IO is new decimal_IO (coma_fija);
   use coma_fija_IO;

   type arrayDeComplejidades is array (1..numElem) of String(1..5);
   complejidad: arrayDeComplejidades:=("n    ", "n^2  ", "n^3  ", "n^4  ", "n^5  ", "n^6  ","logN ", "2^n  ", "1    ", "Otras"); --, "     ","     ");

   -- Nodo
   type NODO is
   	RECORD
        Codigo: Integer;
	Complejidad: String(1..5);
	tiempo: coma_fija;
      end record;
   type arrayDeNodos is array (1..numFilas, 1..numElem) of NODO;
   nodos: arrayDeNodos;

-- En prueba ---
--   type Enlace is access all arrayDeNodos;

--

   type arrayDeDatos is array (1..numElem) of Float;
   dato: arrayDeDatos := (1.75, 5.0, 2.25, 50.21, 63.55, 34.34, 23.27, 32.444, 21.5, 68.3); --, 65.0, 13.2);

procedure inicializar(nodos: in out arrayDeNodos; complejidad:in arrayDeComplejidades) is
   i, j: integer;
   begin
      i:= 1;
      j:=1;
	while i<= numElem loop
           nodos(j,i).Codigo:= i;
           nodos(j,i).Complejidad:= Complejidad(i);
         i:= i+1;
        end loop;
end inicializar;

procedure imprimir(nodos:in arrayDeNodos) is
   j: integer;
   begin
      j:=1;
        new_line;
	for i in nodos'First..nodos'Last loop
         put (nodos(j,i).Codigo);
	 put ("   ");
         put (nodos(j,i).Complejidad);
         put (" ");
         put (nodos(j,i).tiempo);
         new_line;
	end loop;
end imprimir;


procedure leerFichero(ficheroDatos: in out File_Type;nodos: in out arrayDeNodos) is
   i, j: integer;
   begin
   i:= 1; j:= 1;
      Open(ficheroDatos, In_File, "Cons.txt");
      while i<= numElem and then not End_Of_File (FicheroDatos) loop
         get(FicheroDatos, nodos(j,i).tiempo);
         i:= i+1;
      end loop;
end leerFichero;

--Comparacion para dos numeros
function comparar(a:in Coma_Fija; b:in Coma_Fija) return boolean is
      resultado: boolean;
	begin
           resultado:= false;
	if abs (b-a)<abs(a*0.2) then
        	resultado := true;
        end if;
        return resultado;
 end comparar;
   ----------------------------

-- Procedimiento principal
begin
  inicializar(nodos, complejidad);
  leerFichero(ficheroDatos, nodos);
  imprimir(nodos);
--   put ("Numero de datos a sumar: 1-10 ");
--   get (respuesta);
--   while (respuesta /= 0) loop
--   	total:= 0.0;
--   	for i in 1..respuesta loop
--       		total:= total+ dato(i);
--	end loop;
--   	put ("El total es: ");
 --       put (total);
--        New_Line;
--        put ("Otra operacion?. Introducir numero de datos. 0 para salir");
--   	get (respuesta);
--   end loop;
   put ("fin de la ejecucion");
end practica_1V2;

-- Quiero hacer:
-- Declarar un array de String y acceder a él.
-- Declarar un tipo enumerado y acceder a él por el indice
