import React from "react";
const Card = ({ name, desc }) => {
  return (
    <dl className="grid rounded shadow p-4 bg-white mb-4 ">
      <div>
        <dt className="sr-only">Title</dt>
        <dd className="group-hover:text-white leading-6 font-medium text-black">
          {name}
        </dd>
      </div>
      <div>
        <dt className="sr-only">Category</dt>
        <dd className="text-gray-500 h-16 overflow-hidden leading-5">{desc}</dd>
      </div>
    </dl>
  );
};
export default Card;