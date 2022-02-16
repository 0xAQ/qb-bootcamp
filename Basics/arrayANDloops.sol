pragma solidity ^0.8.11;
//SPDX-License-Identifier: MIT

contract ARRAYandLOOPS{

    uint[] Arr;
    function Arrcountdown(uint num) external returns(uint[] memory){
        for(uint i = num; i>0; i--){
            Arr.push(i);
        }
        return Arr;
    }
    function deleteArrVal(uint num) external returns(uint[] memory){
        delete Arr[Arr.length-num];
        return Arr;
    }
    function deleteOddVals() external returns(uint[] memory){
        uint i = 0;
        while(i < Arr.length){
            if (Arr[i]%2==1) {
                delete Arr[i];
            }
            i++;
        }
        return Arr;
    }
    function deleteEvenVals() external returns(uint[] memory){
        uint i = 0;
        do{
            if (Arr[i]%2==0) {
                delete Arr[i];
            }
            i++;
        }while(i < Arr.length);
        return Arr;
    }
}
