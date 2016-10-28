/* This code is adopted from the solution given 
   @ http://effprog.blogspot.com/2011/01/spiral-printing-of-two-dimensional.html */
 
#include <stdio.h>
#include <conio.h>
#define R 4
#define C 4
 
void spiralPrint(int m, int n, int a[R][C])
{
    int i, k = 0, l = 0;
 
    /*  k - starting row index
        m - ending row index
        l - starting column index
        n - ending column index
        i - iterator
    */
 
    while (k < m && l < n)
    {
        /* Print the first row from the remaining rows */
        for (i = l; i < n; ++i)
        {
            printf("a[%d][%d] = %d \n", k, i, a[k][i]);
        }
        k++;
 
        /* Print the last column from the remaining columns */
        for (i = k; i < m; ++i)
        {
            printf("a[%d][%d] = %d \n", i, n-1, a[i][n-1]);
        }
        n--;
 
        /* Print the last row from the remaining rows */
        if ( k < m)
        {
            for (i = n-1; i >= l; --i)
            {
                printf("a[%d][%d] = %d \n", m-1, i, a[m-1][i]);
            }
            m--;
        }
 
        /* Print the first column from the remaining columns */
        if (l < n)
        {
            for (i = m-1; i >= k; --i)
            {
                printf("a[%d][%d] = %d \n", i, l, a[i][l]);
            }
            l++;    
        }        
    }
}
 
/* Driver program to test above functions */
int main()
{
    int a[R][C] = { 
		{1,  2,  3,  4},
        {5,  6,  7,  8},
        {9, 10,  11, 12},
        {13, 14, 15, 16}
    };
 
    spiralPrint(R, C, a);
    // return 0;
}