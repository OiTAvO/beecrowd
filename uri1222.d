import std.stdio;  // entrada e saida padrao
import std.string;  // strip, split, string, format

/**
 * Programa que calcula quantidade de paginas
 * de uma determinada sequencia de palavras
 * Authors: OiTAvO
 * Date: May 8, 2019
*/

void main ()
{
    string bff;  // buffer para resultado
    ulong n, l, c;  /// n = Palavra,  l = Linhas, c = Caracteres
    ulong ln, pg, chs;  /// contadores: ln = Linhas, pg = Paginas, chs = Caracteres  
    
    while(readf(" %s %s %s ", &n, &l, &c)) {  // leitura das restricoes
        auto mtz = split(strip(readln()), " ");  // slice de palavras

        pg = chs = 0;  // zera contador de paginas e de caracteres
        ln = 1;  // ja existe uma linha
        foreach(ref s; mtz) {  // loop p/ toda a slice
            if (chs + s.length + cast(bool)chs > c) {  // expr > c ?
                chs = s.length;  // atribui quantidade de caracteres
                ++ln;  // acresce uma linha
            } else chs += s.length + cast(bool)chs;  // atual. qtd chs
        }  // fim foreach
        pg = (ln / l) + cast(bool)(ln % l);  // atribui qtd paginas
        bff ~= format("%d\n", pg);  // concatena resultado no buffer
    }  // fim while
    writeln(bff);  // imprime buffer de resultados
}  // fim main()
