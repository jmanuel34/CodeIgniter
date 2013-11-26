
with Text_Io; use Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure practica_1V3 is
   numElem: constant Integer:= 10;
   numCols: constant Integer:= 6;
   numeroDeFilas: integer;
   c: character;

-- Otras variables
   resultadoConstante: Boolean;

   -- Ficheros
   ficheroDatos: Text_IO.File_Type;
--   fichero: String(1..20);
   numeroDeDatos: Integer;


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
   type arrayDeNodos is array (1..numCols, 1..numElem) of NODO;
   nodos: arrayDeNodos;

-- En prueba ---
   type Enlace is access all arrayDeNodos;

--

   type arrayDeDatos is array (1..numElem) of Float;
   dato: arrayDeDatos := (1.75, 5.0, 2.25, 50.21, 63.55, 34.34, 23.27, 32.444, 21.5, 68.3); --, 65.0, 13.2);

procedure inicializar(nodos: in out arrayDeNodos; complejidad:in arrayDeComplejidades) is
   i,j: integer;
   begin
      j:= 1;
      while j< numCols loop
        i:= 1;
	while i<= numElem loop
           nodos(j, i).Codigo:= i;
           nodos(j, i).Complejidad:= Complejidad(i);
--           put ("inicializado:");
--           put ("Variable i: "); put (i); put ("Variable j:"); put (j);
           new_line;
            i:= i+1;
         end loop;
         j:= j+1;
        end loop;
end inicializar;

   procedure imprimir(nodos:in arrayDeNodos; numeroDeFilas: integer) is
   j:integer;
   begin
      j:= 1;
      new_line;
      -- put ("Variable i;"); put (i); new_line;
      for j in 1..numeroDeFilas loop
         put ("Variable j: "); put (j);
	for i in 1..numElem loop
          put (nodos(j, i).Codigo);
	  put ("   ");
          put (nodos(j, i).Complejidad);
          put (" ");
          put (nodos(j, i).tiempo);
          new_line;
        end loop;
        new_line;
      end loop;
      put ("Fin de imprimir nodos");
   end imprimir;




procedure leerFichero(ficheroDatos: in out Text_IO.File_Type; nodos: in out arrayDeNodos; numeroDeDatos: in out Integer) is
--   ficheroDatos: File_type;
      i, j: integer;
   begin
      j:= 1;
      Open(ficheroDatos, In_File, "./Pruebas/P6.txt");
      put_line("Despues de open");
      while j<=numCols loop
         i:= 1;
         while i<= numElem loop
            while not End_Of_File (ficheroDatos) loop
               get(ficheroDatos, nodos(j, i).tiempo);
               numeroDeDatos := numeroDeDatos +1;
            end loop;
            i:= i+1;
         end loop;
         j:= j+1;
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
   function compararConstante (nodos: in arrayDeNodos; j:in integer) return boolean is
      resultado: boolean;
      constante, media: coma_fija;
      i: integer;
      begin
      i:= 1;
      resultado:= true;
--  El primero es la media
      media:= nodos(j, i+1).tiempo - nodos(j, i).tiempo;
      --      Comparar el segundo con el anterior
      while resultado = true and then i<numElem-1 loop
         constante:= nodos(j, i+1).tiempo - nodos(j, i).tiempo;	-- Vamos desdel el 2º.al ultimo Restando del anterior
         resultado := comparar(constante, media);
         media:= (media+constante)/2;
      end loop;
      put ("Tiempo constante: ");
      put (constante);
      if resultado then
        put ("Tiempo constante: ");
        put (constante);
      end if;
      return resultado;
   end compararConstante;


-- Procedimiento principal
begin

  numeroDeDatos:= 0;
  inicializar(nodos, complejidad);
   leerFichero(ficheroDatos, nodos, numeroDeDatos);

   if (numeroDeDatos mod 20 = 0) then
      numeroDeFilas:= numeroDeDatos / 20;
       put ("Variable numero de datos: "); put (numeroDeDatos); new_line;
      put ("Variable numero de filas: "); put (numeroDeFilas); new_line;

      for n in 1..numeroDeFilas loop
         put ("Variable n de filas");  put (n); new_line;
         resultadoConstante:= compararConstante(nodos, n);
          if resultadoConstante then
             put ("Resultado verdadero ");
             imprimir(nodos, numeroDeFilas);
          end if;
      end loop;
   else
      put ("Numero de datos no corresponde a modulo 20 ");
      get (c);
      new_line;

   end if;

   put ("fin de la ejecucion");
end practica_1V3;
