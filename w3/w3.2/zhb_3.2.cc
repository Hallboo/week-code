#include <iostream>
#include <fstream>
#include <string>
#define INFILE "Untitled.m"
#define OUTFILE "Untitled-1.m" //output file
using namespace std;

int main()
{
    ifstream in(INFILE);
    ofstream out(OUTFILE);
    string line;
    int i = 0;
    if(in)
    {
        cout<<"Open a file: "<<INFILE<<endl;
        while(getline(in, line)) //there is no '\n' in line
        {
            cout <<"line: "<< i++ << " " << line << endl;
        }
    }else // 没有该文件
    {
        cout <<"No such file." << endl;
    }
    return 0;
}
