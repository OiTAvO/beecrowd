import std.stdio;
import std.string;
import std.algorithm;

/**
 * Programa que calcula a quantidade
 * de familias em um determinado grupo
 * Authors: OiTAvO
 * Date: May 17, 2019
*/

void main()
{
	static int[50001] people;
	static int[][50001] inscriptions;
	static int[] family;
	int nPeople, mInscriptions,
		head, tail, familyCount, person;

	readf(" %s %s", &nPeople, &mInscriptions);
	while (mInscriptions--)
	{
		readf(" %s %s", &head, &tail);
		inscriptions[head] ~= tail;
		inscriptions[tail] ~= head;
	}

	for (int i = 1; i <= nPeople; ++i)
	{
		if(!people[i])
		{
			family ~= i ;
			++familyCount;
			while (!family.empty())
			{
				person = family[0];
				family = family[1 .. $];
				foreach (p; inscriptions[person])
					if (!people[p]++)
						family ~= p;
			}
		}
	}
	writeln(familyCount);
}
