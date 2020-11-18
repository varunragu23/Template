/* USACO codes
Key:
* = Correct
x = Wrong Answer (including possibly empty or missing output file)
t = Timeout
c = Didn't Compile
! = Run-time error or exceeded memory limits
*/
// Brute Force Method
// Run this on directory where a.cpp is there
cp ~/SNIPPETS/Template/testing/* .
// gen.cpp and build with IORun
// create brute.cpp and build with IORun
// this runs 5 random tests against a with checkts against brute
./test.sh 5 a
// any failed tests will be saved under data/failed*{inp,out,oac} pattern.   .oac is output of brute, .out is output of program, .inp is output of gen


#undef _GLIBCXX_DEBUG
#pragma GCC optimize("Ofast,unroll-loops,no-stack-protector,fast-math")
#pragma GCC target("sse,sse2,sse3,ssse3,sse4,popcnt,abm,mmx,avx,avx2,tune=native")
//#pragma comment(linker, "/STACK:200000000")
//
// ulimit -s 65000
// g++ option: -Wl,-stack_size -Wl,1000000

#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>
using namespace __gnu_pbds;

using ordered_set_less = tree<int, null_type, less<int>, rb_tree_tag, tree_order_statistics_node_update>;
using ordered_set_equal = tree<int, null_type, less_equal<int>, rb_tree_tag, tree_order_statistics_node_update>;
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
	timeit(string label = "???") : _label(label) { start(label); }
	void start(string label = "???") { _label = label; begin = chrono::high_resolution_clock::now(); }
	~timeit() {
    stop();
  }
	void stop() {
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
Mustafa
	MyCompetitiveProgramming/zz-algorthmic-resources/tutorial-links.txt
WilliamLin
	CompetitiveProgramming/Index_of_Cancerous_Codes.md
Erricto
	https://github.com/Errichto/youtube/wiki/Learning-resources

DP states from CSES
https://codeforces.com/blog/entry/70018#comment-545687


// My old implementation of binary search.

// 1) Looking for 'target' in a sorted array.
int f() {
    int left = 0, right = n - 1;
    while(left <= right) {
        int mid = left + (right - left) / 2;
        if(a[mid] == target) {
            return mid;
        }
        else if(a[mid] > target) {
            right = mid - 1;
        }
        else {
            left = mid + 1;
        }
    }
    return -1;
}

// 2) Looking for the index of the first element that satisfies some property.
// F F T T T T <- find first index that has TRUE
int f() {
    int left = 0, right = n - 1; // add +1 to 'right' if the answer can be outside [left, right]
    while(left < right) {
        int mid = left + (right - left) / 2;
        if(property(mid)) {
            right = mid;
        }
        else {
            left = mid + 1;
        }
    }
    return left;
}

// Forward declaration of isBadVersion API.
bool isBadVersion(int version);

class Solution {
public:
    int firstBadVersion(int n) {
        int left = 1, right = n;
        int ans = -1; // returned if there is no bad version (impossible in this problem though)
        while(left <= right) {
            int mid = left + (right - left) / 2;
            if(isBadVersion(mid)) {
                ans = mid;
                right = mid - 1; // maybe there is even ealier bad version on the left
            }
            else {
                left = mid + 1;
            }
        }
        return ans;
    }
};

-ve array index
const int MAX_N = 2e5 + 20;
const int ZERO = 1e5 + 5;
int dp_ [MAX_N];

int& dp (int idx) { // the '&' is very important!
  return dp_[ZERO + idx];
}

struct custom_hash {
    static uint64_t splitmix64(uint64_t x) {
        // http://xorshift.di.unimi.it/splitmix64.c
        x += 0x9e3779b97f4a7c15;
        x = (x ^ (x >> 30)) * 0xbf58476d1ce4e5b9;
        x = (x ^ (x >> 27)) * 0x94d049bb133111eb;
        return x ^ (x >> 31);
    }

    size_t operator()(uint64_t x) const {
        static const uint64_t FIXED_RANDOM = chrono::steady_clock::now().time_since_epoch().count();
        return splitmix64(x + FIXED_RANDOM);
    }
};
unordered_map<long long, int, custom_hash> safe_map;
gp_hash_table<long long, int, custom_hash> safe_hash_table;

Speed up techniques
https://www.quora.com/What-are-some-optimization-techniques-to-reduce-space-and-time-complexity-of-DP-solution-used-in-competitive-programming
gp_hash_table
getchar_unlocked

#pragma GCC optimize("Ofast")
#pragma GCC target("avx,avx2,fma")

#include <ext/rope> //header with rope
using namespace std;
using namespace __gnu_cxx; //namespace with rope and some additional stuff
rope<int> v;               // use as usual STL container
rope<int> cur = v.substr(l, r - l + 1);
v.erase(l, r - l + 1);
v.insert(v.mutable_begin(), cur);

Barret Reduction
typedef unsigned long long ull;
typedef __uint128_t L;
struct FastMod {
	ull b, m;
	FastMod(ull b) : b(b), m(ull((L(1) << 64) / b)) {}
	ull reduce(ull a) {
		ull q = (ull)((L(m) * a) >> 64);
		ull r = a - q * b; // can be proven that 0 <= r < 2*b
		return r >= b ? r - b : r;
	}
};
FastMod F(2);
int main() {
	int M = 1000000007; F = FastMod(M);
	ull x = 10ULL*M+3;
	cout << x << " " << F.reduce(x) << "\n"; // 10000000073 3
}

array<int, 3> b = {3, 4, 7};
debug_arr(a, 3);

// util functions

// heap-use-after-free
int main1(int argc, char **argv) {
  int *array = new int[100];
  delete [] array;
  return array[argc];  // BOOM
}
// heap-buffer-overflow
int main2(int argc, char **argv) {
  int *array = new int[100];
  array[0] = 0;
  int res = array[argc + 100];  // BOOM
  delete [] array;
  return res;
}
// stack-over-flow
int main3(int argc, char **argv) {
  int stack_array[100];
  stack_array[1] = 0;
  return stack_array[argc + 100];  // BOOM
}
// global-over-flow
int global_array[100] = {-1};
int main4(int argc, char **argv) {
  return global_array[argc + 100];  // BOOM
}
// RUN: clang -O -g -fsanitize=address %t && ./a.out
// By default, AddressSanitizer does not try to detect
// stack-use-after-return bugs.
// It may still find such bugs occasionally
// and report them as a hard-to-explain stack-buffer-overflow.

// You need to run the test with ASAN_OPTIONS=detect_stack_use_after_return=1

int *ptr;
__attribute__((noinline))
void FunctionThatEscapesLocalObject() {
  int local[100];
  ptr = &local[0];
}

int main5(int argc, char **argv) {
  FunctionThatEscapesLocalObject();
  return ptr[argc];
}

int random_main(int argc, char **argv) {
std::vector<int> v(2);
int* p = v.data();
v.pop_back();
return v[1];  // Error
}

int main() {
#ifndef ONLINE_JUDGE
  freopen("a.in", "r", stdin);
  freopen("a.out", "w", stdout);
#endif
  cin.sync_with_stdio(0); cin.tie(0);

  // main1(5, nullptr);
  // main2(5, nullptr);
  // main3(5, nullptr);
  // main4(5, nullptr);
  // main5(5, nullptr);
  // random_main(5, nullptr);

  return 0;
}
