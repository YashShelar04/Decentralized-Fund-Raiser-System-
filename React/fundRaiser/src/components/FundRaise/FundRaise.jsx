import React, { useState } from "react";
import NavBar from "../NavBar/NavBar";
import DropDown from "../DropDown/DropDown";

function FundRaise() {
    const options_category = ["Health and Medical", "Education", "Human Services", "Environmental", "Arts and Culture", "Animal Welfare",
        "Senior Services", "Military Support", "Religious"
    ];
    const options_identify = ["Aadhar Card", "KYC"];

    const [title, setTitle] = useState("");
    const [description, setDescription] = useState("");
    const [category, setCategory] = useState(options_category[0]);
    const [identification, setIdentification] = useState(options_identify[0]);
    const [startDate, setStartDate] = useState("");
    const [endDate, setEndDate] = useState("");
    const [goalAmount, setGoalAmount] = useState("");
    const [notifyContributors, setNotifyContributors] = useState("");
    const [hashTags, setHashTags] = useState([]);
    const [currentHashTag, setCurrentHashTag] = useState("");
    const [image, setImage] = useState(null);
    const [dragActive, setDragActive] = useState(false);

    const handleImageChange = (event) => {
        const file = event.target.files[0];
        setImage(URL.createObjectURL(file));
    };

    const handleDrag = (event) => {
        event.preventDefault();
        event.stopPropagation();
        setDragActive(event.type === "dragenter" || event.type === "dragover");
    };

    const handleDrop = (event) => {
        event.preventDefault();
        event.stopPropagation();
        setDragActive(false);
        if (event.dataTransfer.files && event.dataTransfer.files[0]) {
            setImage(URL.createObjectURL(event.dataTransfer.files[0]));
        }
    };

    const handleDeleteImage = () => {
        setImage(null);
    };

    const handleSubmit = (event) => {
        event.preventDefault();

        // Validate title
        if (!title) {
            alert("Title is required");
            return;
        }

        // Validate identification
        if (!identification) {
            alert("Identification is required");
            return;
        }

        // Validate either date or goal amount
        if (!startDate && !endDate && !goalAmount) {
            alert("Either start date, end date, or goal amount must be provided");
            return;
        }

        // Validate end date > start date
        if (startDate && endDate && startDate >= endDate) {
            alert("End date must be greater than start date");
            return;
        }

        // If all validations pass, proceed with form submission
        alert("Form submitted successfully!");
    };

    const handleAddHashTag = (event) => {
        event.preventDefault();
        if (currentHashTag.trim() !== "" && !hashTags.includes(currentHashTag.trim())) {
            setHashTags([...hashTags, currentHashTag.trim()]);
            setCurrentHashTag("");
        }
    };

    const handleDeleteHashTag = (tag) => {
        setHashTags(hashTags.filter((hashTag) => hashTag !== tag));
    };

    return (
        <>
            <div className="w-72 mt-2 ml-2">
                <img src="/src/images/Glorious Purpose.svg" alt="" />
            </div>
            <NavBar username="USERNAME" />

            <div className="absolute left-[15%] w-[80%] top-[15%] h-[85%] overflow-y-auto shadow-2xl">
                <div className="flex-col justify-center items-center overflow-y-auto overflow-x-hidden w-[100%]">
                    <div className="text-center text-3xl text-green-600 mt-2 mb-10">
                        Create a Campaign
                    </div>
                    <div className="w-[100%] flex justify-center">
                        <div
                            className={`w-[80%] h-[300px] bg-[rgba(230,246,239,1)] ml-10 rounded-lg mb-10 flex items-center justify-center border-dashed border-2 ${dragActive ? "border-green-600" : "border-gray-300"}`}
                            onDragEnter={handleDrag}
                            onDragLeave={handleDrag}
                            onDragOver={handleDrag}
                            onDrop={handleDrop}
                        >
                            {image ? (
                                <div className="relative">
                                    <img src={image} alt="Campaign" className="h-[300px] w-auto rounded-lg" />
                                    <button
                                        className="absolute top-0 right-0 m-2 bg-red-600 text-white p-1 rounded-full"
                                        onClick={handleDeleteImage}
                                    >
                                        X
                                    </button>
                                </div>
                            ) : (
                                <div className="text-center">
                                    <p>Drag & Drop your image here or</p>
                                    <input type="file" className="hidden" id="fileUpload" onChange={handleImageChange} />
                                    <label htmlFor="fileUpload" className="cursor-pointer text-blue-500 underline">Choose a file</label>
                                </div>
                            )}
                        </div>
                    </div>
                    <form onSubmit={handleSubmit}>
                        <ul className="ml-10 w-full">
                            <li className="flex w-[70%] mb-10 items-center">
                                <div className="text-2xl">
                                    Title:
                                </div>
                                <div className="w-[100%]">
                                    <input
                                        type="text"
                                        className="ml-5 rounded-md bg-[rgba(230,246,239,1)] w-[60%] pl-2"
                                        placeholder="Enter the title"
                                        value={title}
                                        onChange={(e) => setTitle(e.target.value)}
                                    />
                                </div>
                            </li>
                            <li className="flex w-[70%] mb-10 items-center">
                                <div className="text-2xl">
                                    Description:
                                </div>
                                <div className="ml-5 w-[100%]">
                                    <textarea
                                        className="w-[65%] h-[100%] rounded-xl bg-[rgba(230,246,239,1)] p-2"
                                        placeholder="Enter the description"
                                        value={description}
                                        onChange={(e) => setDescription(e.target.value)}
                                    />
                                </div>
                            </li>

                            <li className="flex w-[70%] mb-10 items-center">
                                <div className="text-2xl">
                                    Category:
                                </div>
                                <div className="w-[100%] ml-5">
                                    <DropDown name="Choose" options={options_category} />
                                </div>
                            </li>
                            <li className="flex w-[70%] mb-10 items-center">
                                <div className="text-2xl">
                                    Identification:
                                </div>
                                <div className="w-[100%] ml-5">
                                    <DropDown name="Choose" options={options_identify} />
                                </div>
                            </li>

                            <li className="flex w-[90%] mb-10 items-center">
                                <div className="text-2xl">
                                    Start Date:
                                </div>
                                <div>
                                    <input
                                        type="date"
                                        className="ml-5 rounded-md bg-[rgba(230,246,239,1)] w-[90%] pl-2"
                                        value={startDate}
                                        onChange={(e) => setStartDate(e.target.value)}
                                    />
                                </div>
                            </li>
                            <li className="flex w-[90%] mb-10 items-center">
                                <div className="text-2xl">
                                    End Date:
                                </div>
                                <div>
                                    <input
                                        type="date"
                                        className="ml-5 rounded-md bg-[rgba(230,246,239,1)] w-[90%] pl-2"
                                        value={endDate}
                                        onChange={(e) => setEndDate(e.target.value)}
                                    />
                                </div>
                            </li>
                            <li className="flex w-[90%] mb-10 items-center">
                                <div className="text-2xl">
                                    Goal Amount:
                                </div>
                                <div>
                                    <input
                                        type="text"
                                        className="ml-5 rounded-md bg-[rgba(230,246,239,1)] w-[90%] pl-2"
                                        placeholder="Enter the ETH"
                                        value={goalAmount}
                                        onChange={(e) => setGoalAmount(e.target.value)}
                                    />
                                </div>
                            </li>
                            <li className="flex w-[100%] mb-10 items-center">
                                <div className="text-2xl">
                                    Notify Contributors:
                                </div>
                                <div>
                                    <input
                                        type="email"
                                        className="ml-5 rounded-md bg-[rgba(230,246,239,1)] w-[100%] pl-2"
                                        placeholder="Enter the email"
                                        value={notifyContributors}
                                        onChange={(e) => setNotifyContributors(e.target.value)}
                                    />
                                </div>
                            </li>
                            <li className="flex w-[100%] mb-10 items-center">
                                <div className="text-2xl">
                                    Hash Tags:
                                </div>
                                <div className="ml-5 w-[100%] flex flex-wrap items-center">
                                    
                                    <input
                                        type="text"
                                        className="ml-2 rounded-md bg-[rgba(230,246,239,1)] w-[10%] pl-2"
                                        placeholder="#"
                                        value={currentHashTag}
                                        onChange={(e) => setCurrentHashTag(e.target.value)}
                                    />
                                    <button
                                        type="button"
                                        className="ml-2 bg-green-500 text-white px-2 py-1 rounded h-[30px]"
                                        onClick={handleAddHashTag}
                                    >
                                        Add
                                    </button>
                                    {hashTags.map((tag, index) => (
                                        <div key={index} className="flex items-center bg-[rgba(230,246,239,1)] rounded-full px-3 py-1 m-1">
                                            <span>{"#"+tag}</span>
                                            <button
                                                type="button"
                                                className="ml-2 text-green-500"
                                                onClick={() => handleDeleteHashTag(tag)}
                                            >
                                                X
                                            </button>
                                        </div>
                                    ))}
                                </div>
                            </li>
                        </ul>
                        <div className="flex justify-center mb-10 text-green-500 w-[100%] text-lg">
                            <button type="submit" className="shadow-lg w-42 rounded-full h-[40px] pl-2 pr-2 hover:bg-black duration-200">
                                Create Campaign
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </>
    );
}

export default FundRaise;
