#undef _GLIBCXX_DEBUG
#pragma GCC optimize("Ofast,unroll-loops,no-stack-protector,fast-math")
#pragma GCC target("sse,sse2,sse3,ssse3,sse4,popcnt,abm,mmx,avx,avx2,tune=native")
//#pragma comment(linker, "/STACK:200000000")

#include <ext/pb_ds/assoc_container.hpp> 
#include <ext/pb_ds/tree_policy.hpp>
using namespace __gnu_pbds; 
  
using ordered_set = tree<int, null_type, less<int>, rb_tree_tag, tree_order_statistics_node_update>;
using ordered_map = tree<int, int, less<int>, rb_tree_tag, tree_order_statistics_node_update>;
const int RANDOM = chrono::high_resolution_clock::now().time_since_epoch().count();
struct chash {
    int operator()(int x) const { return x ^ RANDOM; }
};
gp_hash_table<int, int, chash> table;

mt19937 rng((unsigned int) chrono::steady_clock::now().time_since_epoch().count());

struct timeit {
	decltype(chrono::high_resolution_clock::now()) begin;
	const string _label;
	timeit(string label = "???") : _label(label) { begin = chrono::high_resolution_clock::now(); }
	~timeit() {
		auto end = chrono::high_resolution_clock::now();
		auto duration = chrono::duration_cast<chrono::milliseconds>(end - begin).count();
		ostringstream dur;
		dur << duration << "ms elapsed [" << _label << "]";
		debug(dur.str());
	}
};

Fast IO

int in() {
	char c=getchar_unlocked();
	while(c<'0'||c>'9')
		c=getchar_unlocked();
	int r=0;
	while(c>='0'&&c<='9') {
		r=r*10+c-'0';
		c=getchar_unlocked();
	}
	return r;
}

void out(int x) {
	int lz=0, r=0;
	while(x%10==0) {
		++lz;
		x/=10;
	}
	while(x) {
		r=r*10+x%10;
		x/=10;
	}
	while(r) {
		putchar_unlocked('0'+r%10);
		r/=10;
	}
	while(lz--)
		putchar_unlocked('0');
}

// TO forcefully inline a function
// __attribute__((always_inline)) <function definition>
//

//  Arithmetic operation performance is ordered roughly (SLOW to FAST): transcendental  functions, square root, modulo, divide, multiply, add/subtract/mutiply by  power of 2/divide by power of 2/modulo by a power of 2

/*
 * SPEED UP TRICKS
Use prefix(++i) instead of postfix(i++) increment/decrement, as postfix uses a temporary variable to save the initial state of the variable.
Use short hand assignment operators (+=, -=), they don’t create a temporary variable.
Use bit-wise operators where ever it is possible. Operations on bits is always more efficient than directly on decimal. Using x >> 1 instead of x / 2.
Use static memory allocation instead of dynamic memory allocation. Various data structures like Trees can be implemented by both array and pointers. Array implementation is far more efficient as compared to pointer implementation.
Make the number of arguments passed to a function as less as possible.
Make your functions inline.
Iteration is always better than recursion performance wise.
Passing variable by reference is more efficient, because no copying of variable takes place.
Use memoisation, if same value is calculated again and again.
Use ‘\n’ instead of `endl` operator. `endl` forces data stream to be flushed.
Use scanf()/prinf() instead of cin/cout objects.
Last one, adding unnecessary header files takes much compilation time. After all programmers time is also important. So, don’t use #include <bits/stdc++.h> everywhere apart from competitions.

Modular and divison are slow;

#pragma GCC optimize("unroll-loops")
#pragma GCC optimize("O3")
#pragma GCC target("sse4")

*/

// MyCompetitiveProgramming/zz-algorthmic-resources/tutorial-links.txt
// CompetitiveProgramming/Index_of_Cancerous_Codes.md
