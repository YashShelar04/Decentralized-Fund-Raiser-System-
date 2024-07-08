import React from 'react';


const TransactionTable = ({data}) => {
  return (
    <div className="overflow-x-auto shadow-lg">
      <table className="w-[50vw] divide-y divide-black rounded-2xl ">
        <thead className="bg-black text-green-600">
          <tr>
            <th className="px-6 py-3 text-left text-xl font-lilita rounded-tl-2xl ">Date</th>
            <th className="px-6 py-3 text-left text-xl font-lilita  ">Receiver Wallet Address</th>
            <th className="px-6 py-3 text-left text-xl font-lilita  ">Fund</th>
            <th className="px-6 py-3 text-left text-xl font-lilita rounded-tr-2xl">Amount</th>
          </tr>
        </thead>
        <tbody className="bg-white divide-y divide-black">
          {data.map((row, index) => (
            <tr key={index}>
              <td className="px-6 py-4 whitespace-nowrap border border-black">{row.date}</td>
              <td className="px-6 py-4 whitespace-nowrap border border-black">{row.wallet}</td>
              <td className="px-6 py-4 whitespace-nowrap border border-black">{row.fund}</td>
              <td className="px-6 py-4 whitespace-nowrap border border-black">{row.amount}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default TransactionTable;
