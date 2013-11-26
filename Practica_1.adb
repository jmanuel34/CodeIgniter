-- pag 49 de usando ...
-- package Float_InOut is new Float_IO(Float);
-- use Float_InOut;
-- package Math is new Generic_Elementary_Functions(Float);
-- use Math;
-- pag 103 sumar y restar complejos
-- with Ada.Strings.Fixed;
-- with Standard_Library; use Standard_Library;
-- Entrada salida estandar
with Text_Io; use Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure practica_1 is
   numElem: constant Integer:= 10;
-- Ficheros
ficheroDatos: Text_IO.File_Type;
--   respuesta: Integer;
--   total: Float;

 -- Probar
--   type arrayDeComplejidades is array (1..11) of String (1..7);
--   complejidad: arrayDeComplejidades:=("n    ", "n^2  ", "n^3  ", "n^4  ", "n^5  ", "n^6  ","logN  ", "2^n", "1", "Otras");
--a:array(Integer range 1..6) of String;
--type enumerado is (uno, dos, tres);
-- Declaracion de tipo de numero ------------------------
type coma_fija is delta 0.0000001 digits 18;
package coma_fija_IO is new decimal_IO (coma_fija);
use coma_fija_IO;
subtype s_Coma_Fija is coma_Fija;
---------------------------------------------------------
-- enumeracion : Complex;
type Complex is (N, N2, N3, N4, N5, N6, LOGN, DOSN, UNO, OTRAS);
subtype s_TipoComplejidad is Complex;
complejidad: s_TipoComplejidad;
type NODO is
   	RECORD
        Codigo: Integer;
        Complejidad: s_TipoComplejidad;
    end record;
type arrayDeNodos is array (1..numElem) of NODO;
nodos: arrayDeNodos;
--codigos: array (1..numElem) of NODO;

type arrayDeDatos is array (1..numElem) of Float;
dato: arrayDeDatos := (1.75, 5.0, 2.25, 50.21, 63.55, 34.34, 23.27, 32.444, 21.5, 68.3);
tiempo: s_Coma_Fija;


-- Pruebas
type tipoComplejidad is (N, N2, N3, N4, N5, N6, LOGN, DOSN, UNO, OTRAS);
--subtype s_TipoComplejidad is tipoComplejidad;
-- pruebaComplejidad: s_tipoComplejidad;
---
-- Inicializar
procedure inicializar(nodos: in out arrayDeNodos; pruebaComplejidad: in s_tipoComplejidad) is
   i: integer;
   begin
   	i:= 1;
        while i<= numElem loop
        	nodos(i).Codigo:= i;
                nodos(i).Complejidad:= s_tipoComplejidad'Val(i-1);
        i:= i+1;
        end loop;
end inicializar;
-- Fin de inicializar -------------------------------------------------------------
-- Imprimir ---
procedure imprimir(nodos:in arrayDeNodos) is
	begin
	for i in nodos'First..nodos'Last loop
        	put (nodos(i).Codigo);
                complejidad:= String (nodos(i).complejidad;
--                put (String (nodos(i).Complejidad));
                new_line;
	end loop;
end imprimir;
-- Fin de procedimeinto imprimir -----------------------------------------------

--procedure leerFichero(ficheroDatos: File_Type) is
--    begin
--    Open(ficheroDatos, In_File, "datos.txt");
--    end leerFichero;

-- Comparacion para dos numeros
function comparar(a:in s_Coma_Fija; b:in s_Coma_Fija) return boolean is
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
--  leerFichero(FicheroDatos);
   Open (ficheroDatos, in_File, "datos.txt");
   while not End_Of_File (FicheroDatos) loop
   	get(FicheroDatos, tiempo);
        put (tiempo);
   end loop;
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
end practica_1;

-- Quiero hacer:
-- Declarar un array de String y acceder a él.
-- Declarar un tipo enumerado y acceder a él por el indice
-- Paso de parametros para leer un fichero en otro procedimiento
