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
