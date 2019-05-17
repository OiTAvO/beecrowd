import std.stdio;
import std.string;
import std.algorithm;

/**
 * Programa que calcula a quantidade
 * de familias em un determinado grupo
 * Authors: OiTAvO
 * Date: May 17, 2019
*/

void main()
{
	static int[50001] people;
	static int[][50001] coins;
	static int[] family;
	int n, m, head, tail, counter, person;

	readf(" %s %s", &n, &m);
	while (m--)
	{
		readf(" %s %s", &head, &tail);
		coins[head] ~= tail;
		coins[tail] ~= head;
	}

	for (int i = 1; i <= n; ++i)
	{
		if(!people[i])
		{
			family ~= i ;
			++counter;
			while (!family.empty())
			{
				person = family[0];
				family = family[1 .. $];
				foreach (p; coins[person])
					if (!people[p]++)
						family ~= p;
			}
		}
	}
	writeln(counter);
}
