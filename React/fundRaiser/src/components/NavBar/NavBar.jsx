import React from "react";
import { Link,NavLink } from 'react-router-dom';

function NavBar(props) {
    return (
        <>
            <div className="left-0 top-14 bottom-0 bg-green-600 w-48 rounded-e-3xl p-4 mt-5">
                <div className="flex justify-center w-full">
                    <img src="/src/images/Person.svg" alt="YourProfilePic" />
                </div>
                <div className="text-center text-white text-base">
                    {props.username}
                </div>

                <div>
                    <ul>
                        <li>
                            <NavLink
                                to="/dashboard"
                                className={({ isActive }) =>
                                    `flex items-center  py-2 pr-4 pl-3 text-3xl mb-8 mt-5 font-lilita
                                    ${isActive ? "text-white" : "text-green-500/75"}
                                    duration-200 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 hover:text-white lg:p-0`
                                }
                            >
                                {({ isActive }) => (
                                    <>
                                        {isActive && <img src="src/images/right-arrow.svg" className="w-5 h-5 mr-2" alt="" />}
                                        Dashboard
                                    </>
                                )}
                            </NavLink>
                        </li>
                        <li>
                            <NavLink
                                to="/profile"
                                className={({ isActive }) =>
                                    `flex items-center  py-2 pr-4 pl-3 text-3xl mb-8 font-lilita
                                    ${isActive ? "text-white" : "text-green-500/75"}
                                    duration-200 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 hover:text-white lg:p-0`
                                }
                            >
                                {({ isActive }) => (
                                    <>
                                        {isActive && <img src="src/images/right-arrow.svg" className="w-5 h-5 mr-2" alt="" />}
                                        Profile
                                    </>
                                )}
                            </NavLink>
                        </li>
                        <li>
                            <NavLink
                                to="/raisefund"
                                className={({ isActive }) =>
                                    `flex items-center  py-2 pr-4 pl-3 text-3xl mb-8 font-lilita
                                     ${isActive ? "text-white" : "text-green-500/75"}
                                    duration-200 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 hover:text-white lg:p-0`
                                }
                            >
                                {({ isActive }) => (
                                    <>
                                        {isActive && <img src="src/images/right-arrow.svg" className="w-5 h-5 mr-2" alt="" />}
                                        Raise a fund
                                    </>
                                )}
                            </NavLink>
                        </li>
                        <li>
                            <NavLink
                                to="/blogs"
                                className={({ isActive }) =>
                                    `flex items-center  py-2 pr-4 pl-3 text-3xl mb-8 font-lilita
                                     ${isActive ? "text-white" : "text-green-500/75"}
                                    duration-200 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 hover:text-white lg:p-0`
                                }
                            >
                                {({ isActive }) => (
                                    <>
                                        {isActive && <img src="src/images/right-arrow.svg" className="w-5 h-5 mr-2" alt="" />}
                                        Blogs
                                    </>
                                )}
                            </NavLink>
                        </li>

                        <li>
                            <Link to="/">
                            <div className="flex items-center text-white text-3xl hover:text-red-600 duration-200 font-lilita">
                                <img src="/src/images/logout.svg" alt="" className="w-5 h-5 mr-2" />
                                Log Out
                            </div>
                            </Link>
                        </li>
                    </ul>
                </div>
            </div>
        </>
    );
}

export default NavBar;
