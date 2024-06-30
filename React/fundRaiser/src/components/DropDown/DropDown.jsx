import React, { useState } from "react";

function DropDown(props) {
    const [isOpen, setIsOpen] = useState(false);
    const [selectedOption, setSelectedOption] = useState(props.name);

    const toggleDropdown = () => {
        setIsOpen(!isOpen);
    };

    const handleOptionClick = (option) => {
        setSelectedOption(option);
        setIsOpen(false);
    };

    return (
        <>
            <div
                className="shadow-lg h-10 flex justify-between w-40 rounded-full items-center pl-3 pr-3 cursor-pointer"
                onClick={toggleDropdown}
            >
                <div className="font-bold">{selectedOption}</div>
                <div className="w-4 h-4">
                    <img src="/src/images/down-arrow.svg" alt="select" />
                </div>
            </div>
            {isOpen && (
                <div className="absolute mt-2 w-32 rounded-md shadow-lg bg-white z-10">
                    <ul className="py-1">
                        {props.options.map((option, index) => (
                            <li
                                key={index}
                                className="cursor-pointer px-4 py-2 hover:bg-gray-200"
                                onClick={() => handleOptionClick(option)}
                            >
                                {option}
                            </li>
                        ))}
                    </ul>
                </div>
            )}
        </>
    );
}

export default DropDown;
