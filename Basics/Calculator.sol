pragma solidity ^0.8.11;

//SPDX-License-Identifier: MIT

//Very Simple cal using pure type to save gas
//Assignment - 3/2/22

contract AQcalculator{

    function Add(int x, int y) external pure returns(int){
        return x+y;
    }

    function Subtraction(int x,int y) external pure returns(int){
        return x-y;
    }

    function Multiplication(int x, int y) external pure returns(int){
        return x*y;
    }

    function Division(int x, int y) external pure returns(int){
        return x/y;
    }

    function Modulus(int x, int y) external pure returns(int){
        return x%y;
    }

}
