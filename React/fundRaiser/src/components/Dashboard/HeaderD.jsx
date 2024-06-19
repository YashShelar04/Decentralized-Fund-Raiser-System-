import React from "react";
import logo from '/src/images/Glorious Purpose.svg';
import SearchBar from "../SearchBar/SearchBar";
import DropDown from "../DropDown/DropDown";

function HeaderD(){

    const options = ["Health and Medical" , "Education" , "Human Services" , "Environmental" , "Arts and Culture" , "Animal Welfare",
        "Senior Services" , "Military Support" , "Religous"
    ];
    return(
        <>
        <div className="flex items-center justify-between">
            <div className="w-72 mt-2 ml-2">
                <img src={logo} alt="logo" />
            </div>
            <SearchBar placeholder = "Search for the campaign title"/>
            <div className="mr-12">
                <DropDown name="Categories" options={options}/>
            </div>
        </div>
        </>
    );
}

export default HeaderD;