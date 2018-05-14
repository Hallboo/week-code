/*
Given a sorted positive integer array nums and an integer n,
add/patch elements to the array such that any number in range [1, n] inclusive
can be formed by the sum of some elements in the array.
Return the minimum number of patches required.
*/
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> nums{1,5,10};
    int n = 200;
//--------------------------------------------------
    vector<int> patch;
    int pos =1,i=0;
    while(pos <= n)
    {
        if(i<nums.size() && nums[i]<=pos)
        {
            pos += nums[i++];
        }
        else
        {
            patch.push_back(pos);
            pos += pos;
        }
    }
//------------------- print ------------------------
    cout << "nums:[";
    for(int j=0; j<nums.size(); j++)
    {
        cout << " " << nums[j];
    }
    cout <<"]"<< endl << "patch:[";
    for(int j=0; j<patch.size(); j++)
    {
        cout << " " << patch[j];
    }
    cout << "] size: " << patch.size() <<endl;;
    return 0;
}
