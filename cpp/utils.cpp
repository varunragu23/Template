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
