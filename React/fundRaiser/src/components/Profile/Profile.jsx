import React, { useState } from "react";
import NavBar_profile from "../NavBar/NavBar_profile";

function Profile() {
    const [profileImage, setProfileImage] = useState(null);

    const handleImageUpload = (event) => {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onloadend = () => {
                setProfileImage(reader.result);
            };
            reader.readAsDataURL(file);
        }
    };

    return (
        <>
            <div className="w-72 mt-2 ml-2">
                <img src="/src/images/Glorious Purpose.svg" alt="" />
            </div>
            <NavBar_profile username="USERNAME"/>

            <div className="absolute top-16 left-60 right-10">
                <div className="flex justify-evenly items-center h-[30vh]">
                    <div className="flex-col justify-between bg-[rgba(230,246,239,1)] rounded-3xl w-[17%] h-[45%] p-1">
                        <div className="text-center w-[100%] text-2xl text-[rgba(2,169,92,1)] font-lilita ">
                            Contributions
                        </div>
                        <div className="w-[100%] text-center pt-4 text-lg font-lilita">
                            0.5 ETH
                        </div>
                    </div>
                    <div className="flex justify-center items-center h-48 w-48 relative border-2 border-green-700 rounded-full">
                        <img 
                            src={profileImage || "/src/images/Person.svg"} 
                            alt="YourProfilePic" 
                            className="cursor-pointer rounded-full h-44 w-44 bg-center" 
                            onClick={() => document.getElementById('fileInput').click()}
                            style={{ zIndex: 1 }}
                        />
                        <input 
                            type="file" 
                            id="fileInput" 
                            accept="image/*" 
                            style={{ display: 'none' }} 
                            onChange={handleImageUpload} 
                        />

     
                    </div>
                    <div className="flex-col justify-between bg-[rgba(230,246,239,1)] rounded-3xl w-[17%] h-[45%] p-1">
                        <div className="text-center w-[100%] text-2xl text-[rgba(2,169,92,1)] font-lilita ">
                            Funds Raised
                        </div>
                        <div className="w-[100%] text-center pt-4 text-lg font-lilita">
                            2 ETH
                        </div>
                    </div>
                </div>

                <div className="flex-col justify-center items-center w-[100%]">
                    <form action="" className="w-[100%]">
                        <ul className="w-[100%]">
                            <ListItem item_name="Username:" item_type="text" />
                            <ListItem item_name="Email ID:" item_type="email" />
                            <ListItem item_name="Designation:" item_type="text" />
                            <ListItem item_name="Birth Date:" item_type="date" />
                            <ListItem item_name="Organisation:" item_type="text" />
                        </ul>

                        <div className="flex justify-center mt-10 text-green-500 w-[90%] text-lg">
                            <button type="submit" className="shadow-lg w-42 rounded-full h-[40px] pl-2 pr-2 hover:bg-black duration-200">
                                Save Changes
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </>
    );
}

function ListItem({ item_name, item_type }) {
    return (
        <div className="ml-44 m-5 w-[100%]">
            <li className="flex items-center w-[38%] justify-between">
                <div className="text-2xl">
                    {item_name}
                </div>
                <div>
                    <input type={item_type} className="bg-[rgba(230,246,239,1)] rounded-lg h-[35px] pl-1 pr-1 w-[300px]" />
                </div>
            </li>
        </div>
    );
}

export default Profile;
