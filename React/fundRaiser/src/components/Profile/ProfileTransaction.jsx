import React from "react";
import TransactionTable from "../TransactionTable/TransactionTable";
import NavBar_profile from "../NavBar/NavBar_profile";


const data = [
    { date: '2024-06-29', wallet: '0xABC123', fund: 'Fund A', amount: '1' },
    { date: '2024-06-30', wallet: '0xDEF456', fund: 'Fund B', amount: '1' },
    { date: '2024-06-30', wallet: '0xDEF456', fund: 'Fund C', amount: '4.5' },
    { date: '2024-06-30', wallet: '0xDEF456', fund: 'Fund D', amount: '1' },
    { date: '2024-06-30', wallet: '0xDEF456', fund: 'Fund E', amount: '0.3' },
    { date: '2024-06-30', wallet: '0xDEF456', fund: 'Fund E', amount: '0.3' },
   
  ];

function ProfileTransaction() {
    return (
        <>
            <div className="w-72 mt-2 ml-2">
                <img src="/src/images/Glorious Purpose.svg" alt="" />
            </div>
            <NavBar_profile username="USERNAME"/>

            <div className="absolute top-[10%] left-[25%] h-[95%] overflow-y-auto">
                <TransactionTable data={data}/>
            </div>
        </>
    )
}

export default ProfileTransaction;