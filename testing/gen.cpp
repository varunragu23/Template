// generating a random sequence of distinct elements
#include <bits/stdc++.h>
#include <sys/time.h>
using namespace std;

int rand(int a, int b) {
    return a + rand() % (b - a + 1);
}

int main(int argc, char* argv[]) {
    if (argv[1] != NULL) srand(atoi(argv[1])); // atoi(s) converts an array of chars to int
    else {
      struct timeval time; gettimeofday(&time, NULL);
      // microsecond has 1 000 000
      srand((time.tv_sec * 1000) + (time.tv_usec / 1000));
    }
    int n = rand(2, 10);
    printf("%d\n", n);
    set<int> used;
    for(int i = 0; i < n; ++i) {
        int x;
        do {
            x = rand(1, 10);
        } while(used.count(x));
        printf("%d ", x);
        used.insert(x);
    }
    puts("");
}

