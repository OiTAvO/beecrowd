import std.stdio;  // entrada e saída padrão
import std.string;  // strip, split, string, format

/**
 * Programa que calcula quantidade de páginas
 * de uma determinada sequência de palavras
 * Authors: OiTAvO
 * Date: May 8, 2019
 * 
*/

void main ()
{
    string bff;  // buffer para resultado
    ulong n, l, c, ln, pg, chs;  // variaveis do programa
    
    while(readf(" %s %s %s ", &n, &l, &c)) {  // leitura das restrições
        auto mtz = split(strip(readln()), " ");  // slice de palavras

        pg = chs = 0;  // zera contador de páginas e de caracteres
        ln = 1;  // Já existe uma linha
        foreach(ref s; mtz) {  // loop p/ toda a slice
            if (chs + s.length + cast(bool)chs > c) {  // expr > c ?
                chs = s.length;  // atribui quantidade de caracteres
                ++ln;  // acresce uma linha
            } else chs += s.length + cast(bool)chs;  // atual. qtd chs
        }  // fim foreach
        pg = (ln / l) + cast(bool)(ln % l);  // atribui qtd páginas
        bff ~= format("%d\n", pg);  // concatena resultado no buffer
    }  // fim while
    writeln(bff);  // imprime buffer de resultados
}  // fim main()
