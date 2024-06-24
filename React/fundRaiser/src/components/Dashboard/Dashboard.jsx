import React from "react";
import HeaderD from "./HeaderD";
import NavBar from "../NavBar/NavBar";
import FundCard from "../FundCard/FundCard";

function Dashboard (){
    return (
    <>
    <HeaderD/>
    <NavBar username = "USERNAME"/>
  <div className="fixed top-5 left-[30%] md:left-[17%]">
  <div className="flex w-full justify-center mt-10">
        <div className="flex-col overflow-y-auto h-[85vh] w-[100%] scroll-m-0">
            <FundCard title="FUND TITLE" eths="3.4"/>
            <FundCard title="FUND TITLE" eths="5"/>
            <FundCard title="FUND TITLE" eths="1.2"/>
            <FundCard title="FUND TITLE" eths="0.6"/>
        </div>
    </div>
  </div>
    </>
    );
}

export default Dashboard;