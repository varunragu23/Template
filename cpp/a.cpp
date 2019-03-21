#include <bits/stdc++.h>
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <sstream>
#include <queue>
#include <deque>
#include <bitset>
#include <iterator>
#include <list>
#include <stack>
#include <map>
#include <set>
#include <functional>
#include <numeric>
#include <utility>
#include <limits>
#include <time.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

using namespace std;

#define MEM(a, b) memset(a, (b), sizeof(a))
#define all(cont) cont.begin(), cont.end()
#define rall(cont) cont.end(), cont.begin()
#define FOREACH(it, l) for (auto it = l.begin(); it != l.end(); it++)
#define IN(A, B, C) assert( B <= A && A <= C)
#define MP make_pair
#define PB push_back
#define INF (int)1e9
#define EPS 1e-9
#define PI 3.1415926535897932384626433832795
#define MOD 1000000007

const double pi=acos(-1.0);
typedef pair<int, int> PII;
typedef vector<int> VI;
typedef vector<string> VS;
typedef vector<PII> VII;
typedef vector<VI> VVI;
typedef map<int,int> MPII;
typedef set<int> SETI;
typedef multiset<int> MSETI;
typedef long int int32;
typedef unsigned long int uint32;
typedef long long int int64;
typedef unsigned long long int  uint64;


#define watch(x) cerr << (#x) << " is " << (x) << endl
#define printvii(v) cerr << (#v) << "=";for_each(v.begin(), v.end(), [](PII i) -> void {cerr << "(" << i.first << "," << i.second << "),";}); cerr << endl;
#define printvi(v) cerr << (#v) << "=";for_each(v.begin(), v.end(), [](int i) -> void {cerr << i << ",";}); cerr << endl;


int main(int argc, char const *argv[])
{

  freopen("task.in", "r", stdin);   // redirects standard input
  freopen("task.out", "w", stdout); // redirects standard output

  // To speed input/output
  cin.sync_with_stdio(0);
  cin.tie(0);

  // use cin and cout from this point onwards.

  int N, M;

  cin >> N >> M;

  cout << N << " " << M << endl;
  return 0;
}
