import React from "react";
import NavBar_profile from "../NavBar/NavBar_profile";
import FundCard from "../FundCard/FundCard";

function ProfileCamp() {
    return (
        <>
            <div className="w-72 mt-2 ml-2">
                <img src="/src/images/Glorious Purpose.svg" alt="" />
            </div>
            <NavBar_profile username="USERNAME" /> 
            <div className="absolute top-[5%] left-[17%] h-[95%] overflow-y-auto">
                <FundCard title="FUND TITLE" eths="0.5"/>
                <FundCard title="FUND TITLE" eths="0.5"/>
                <FundCard title="FUND TITLE" eths="0.5"/>
                <FundCard title="FUND TITLE" eths="0.5"/>
            </div>
        </>
    )
}
export default ProfileCamp;