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
		p1st, p2nd, familyCount, person;

	readf(" %s %s", &nPeople, &mInscriptions);
	while (mInscriptions--)
	{
		readf(" %s %s", &p1st, &p2nd);
		inscriptions[p1st] ~= p2nd;
		inscriptions[p2nd] ~= p1st;
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
				foreach (ref relative; inscriptions[person])
					if (!people[relative]++)
						family ~= relative;
			}
		}
	}
	writeln(familyCount);
}
