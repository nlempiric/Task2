import abi from "./MyToken.json" assert { type: "json" };

const provider=new ethers.providers.Web3Provider(window.ethereum);
const signer=provider.getSigner();

export const contractAddress = "0x875afa7139B0860Ca78d5a5408F7d598DFd14565";

const contractAbi = abi.abi;

console.log('contractAbi-------',contractAbi)

export const contract = new ethers.Contract(contractAddress, contractAbi, signer);

export const claimtra=async(addre,t)=>
{
    try
    {
        const c=await contract.claim(addre,t);
        const a=await c.wait();
        console.log('----claimed-----');
        alert('claimed');
        
    }
    catch(error)
    {
        alert(error.data.message);
        console.log('error:',error.data.message)
    
    }
}

// let tbal;
// async function bal()
// {   
   
//     const balan = await contract.balanceOf(contractAddress);
//     // console.log("xdvcfvfvf",buycontract.address);    
//     // return tbalance;
//     tbal = Number(balan);
//     console.log('-------tb---',tbal);
//     // tbal=tbalance;

//     return tbal;
    
// }

// const d=bal();
// console.log('ddddddddddddddddddd',d)
// export {tbal};