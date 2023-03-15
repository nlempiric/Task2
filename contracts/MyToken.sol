// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20,Ownable
{
    uint ts;
    uint time;
    uint orderId=0;
    uint public amount_10;
    struct Order{
        uint256 tamt;                                                                                                                                                                              
    }
    address[5] a;
    mapping(address=>Order) public orderdata;
    event TransferEve(address addr,uint256 amount);

    constructor() ERC20("MyToken", "MTK") 
    {
        _mint(address(this),2000);
        a=[0x43927E5678077A0C6202A911614E4391adF31716,
        0x7a2B845C1fE4A037589a8e138861Fd6156320417,
        0x8d53cD027F5822c296c73d82365290818976c0F5,
        0x60037F0cC973e9d9b8808c9a88889a5E619fC088,
        0x3BD0A7b3E62D8C73B1debF1dad65366B17b52660];

        uint[5] memory amount;
        amount[0]=5;
        amount[1]=5;
        amount[2]=10;
        amount[3]=10;
        amount[4]=20;
        
        ts=balanceOf(address(this));
        amount_10=(ts*50/100)-(ts*40/100);
        for (uint i = 0; i < amount.length; i++) 
        {             
            amount[i]=amount[i]*ts/100;
        } 
        for (uint i = 0; i < a.length; i++) 
        {
                        
            _transfer(address(this),a[i],amount[i]);
        }
        time=block.timestamp+60;
    }
    function claim(address ad,uint amt) public
    {
       require(time<block.timestamp,"time shold be more than 1 minute");
        require(orderdata[ad].tamt+amt<=amount_10,"you can only purchase 10% of tokens");
       uint c=0;
       for(uint i = 0; i < a.length; i++)
       {
           if(ad==a[i])
           {       
               c=1;
               _transfer(address(this),ad,amt);
               orderdata[ad]=Order(orderdata[ad].tamt+amt);
               emit TransferEve(ad,orderdata[ad].tamt);         
           }
       }
       require(c==1,"no address matched");
    }
}