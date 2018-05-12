/*Given a string containing only digits '0'-'9', write a function to determine if it's an additive number.*/
#include<iostream>
#include<string>
#include<cstdlib>
using namespace std;
int main(void)
{
    string sequence;
//---------------------- input && verification -------------------------
    cout << "input a sequence: ";
    cin >> sequence;
    int seqsize = sequence.size();
    for(int i = 0; i<seqsize;i++)
    {
        if(sequence[i]<'0' || sequence[i]>'9')
        {//Additive number is a string whose digits can form additive sequence.
            cout << "error, invalid sequence!" <<endl;
            return 1;
        }

    }
    long long seqIntArray[seqsize];//save additive sequence to integer array.
    if(seqsize<3)
    {//A valid additive sequence should contain at least three numbers.
        cout << "error, at least three numbers. "<<endl;
        return 1;
    }
//----------------------------------------------------------------------
    for(int a=1; a<seqsize; a++)
        for(int b=a+1; b<seqsize; b++)
        {
            string str1 = sequence.substr(0,a);
            string str2 = sequence.substr(a,b-a);
            //cout<<"str1:"<<str1[0]<<" str2:"<<str2[0]<<endl;
            if((str1.size()>1 && str1[0]=='0') || (str2.size()>1 && str2[0]=='0'))
            {
                continue;/*Note: Numbers in the additive sequence cannot have
                   leading zeros,so sequence 1, 2, 03 or 1, 02, 3 is invalid.*/
            }
            long long in1 = seqIntArray[0] = atoll(str1.c_str());
            long long in2 = seqIntArray[1] = atoll(str2.c_str());
            long long pr3 = seqIntArray[2] = in1 + in2;
            int index = 3;
            //cout <<"a:"<<a<<" b:"<<b<< " in1:"<<in1<<" in2:"<<in2<<" pr3:"<<pr3<<endl;
            string pr3str = to_string(pr3);//C++11 library functions.
            string psequence = str1 + str2 + pr3str;
            while (psequence.size() < sequence.size())
            {
                in1 = in2;
                in2 = pr3;
                pr3 = seqIntArray[index++] = in1 + in2;
                pr3str = to_string(pr3);
                psequence += pr3str;
            }
            if (psequence == sequence)
            {
                cout << "the additive sequence:";
                for(int i=0; i<index; i++)
                    cout<<" "<< seqIntArray[i];
                cout<<endl;
                return 0;
            }
        }
    cout<<"this sequence is not a additive sequence."<<endl;
    return 1;
}
