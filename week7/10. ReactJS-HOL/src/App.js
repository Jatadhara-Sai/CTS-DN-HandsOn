import React from "react";

function App() {
  const officeList = [
    {
      name: "Prime Office Space",
      rent: 55000,
      address: "Banjara Hills, Hyderabad",
      image: "https://www.officespaceindelhi.com/wp-content/uploads/2022/01/IMG-20220120-WA0061-536x370.jpg"
    },
    {
      name: "EcoWork Hub",
      rent: 70000,
      address: "Gachibowli, Hyderabad",
      image: "https://tse1.mm.bing.net/th/id/OIP.I4VNndeP00hlMrVEG8mg_QHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3"
    },
    {
      name: "WorkDen",
      rent: 48000,
      address: "Hitech City, Hyderabad",
      image: "https://img1.wsimg.com/isteam/ip/691853b6-0861-462e-ac6d-bf9d1b602b34/DOM2%203.jpg/:/cr=t:0%25,l:0.12%25,w:99.75%25,h:100%25/rs=w:360,h:270.6766917293233,cg:true"
    }
  ];

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>Office Space Rental Listings</h1>
      {officeList.map((office, index) => (
        <div key={index} style={{ marginBottom: "30px" }}>
          <h2>{office.name}</h2>
          <img
            src={office.image}
            alt="Office"
            style={{
              width: "300px",
              height: "200px",
              objectFit: "cover",
              marginBottom: "8px"
            }}
          />
          <p><strong>Address:</strong> {office.address}</p>
          <p>
            <strong>Rent:</strong>{" "}
            <span style={{ color: office.rent > 60000 ? "green" : "red" }}>
              ₹{office.rent}
            </span>
          </p>
        </div>
      ))}
    </div>
  );
}

export default App;
