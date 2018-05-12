#include<iostream>
using namespace std;
int strStr(string haystr,string nedstr);

int main(void)
{
    string haystr,nedstr;
    cout<<"haystack: ";
    getline(cin,haystr);
    cout<<"needle: ";
    getline(cin,nedstr);
    cout<<"index: "<<strStr(haystr,nedstr)<<endl;
    return 0;
}

int strStr(string haystr,string nedstr)
{
    return haystr.find(nedstr,0);
}
