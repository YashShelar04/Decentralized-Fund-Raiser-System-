import React from "react";
import search_svg from "/src/images/search_bar.svg";

function SearchBar(props){
    return (
        <>
        <div className="rounded-xl relative">
            <input className="w-72 shadow-inner rounded-full pl-3 font-semibold text-base" type="text" placeholder={props.placeholder}/>
            <span className="absolute inset-y-0 right-0 pr-3 pt-1">
                <img src={search_svg} alt="" />
            </span>
        </div>
        </>
    );
}

export default SearchBar;