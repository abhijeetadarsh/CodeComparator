#include <bits/stdc++.h>
using namespace std;
#define f(i, n) for (int i = 0; i < n; i++)
int myrand(int lo, int hi)
{
    return lo + rand() % (hi-lo+1);
}
int main()
{
    // #ifndef ONLINE_JUDGE
    //    freopen("input.txt",  "r",  stdin);
    //    freopen("output.txt", "w", stdout);
    // #endif
    int t = 100;
    printf("%d\n", t);
    while (t--)
    {
        printf("%d %d\n",myrand(1,10000),myrand(1,10000));
    }
    return 0;
}