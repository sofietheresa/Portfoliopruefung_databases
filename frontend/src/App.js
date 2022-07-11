import React, { Fragment, useState, useEffect } from "react";
import "./App.css";

const App = () => {
  useEffect(() => {
    const getAPI = () => {
      //connect to local PostgreSQL Database
      const API = "http://localhost:5001/";

      fetch(API)
        .then((response) => {
          console.log(response);
          return response.json();
        })
        .then((data) => {
          console.log(data);
          setLoading(false);
          setApiData(data);
        });
    };
    getAPI();
  }, []);
  const [apiData, setApiData] = useState([]);
  const [loading, setLoading] = useState(true);
  return (
    <Fragment>
      <header>
        <h1> Employee overview </h1>
      </header>

      {/* Form for adding employee */}
      <div className="form-container">
        <h2>Add Employee</h2>
        <form method="POST" action="http://localhost:5001/add-employee">
          <div>
            <label>First Name</label>
            <input type="text" name="employeeFName" required />
          </div>
          <div>
            <label>Last Name</label>
            <input type="text" name="employeeLName" required />
          </div>
          <div>
            <label>Location</label>
            <input type="number" name="location" required />
          </div>
          <div>
            <button type="submit">Add Employee</button>
          </div>
        </form>
      </div>

      {/* Form for deleting employee */}
      <div className="form-container">
        <h2>Delete Employee</h2>
        <form method="POST" action="http://localhost:5001/delete-employee">
          <div>
            <label>ID</label>
            <input type="number" name="ID" required />
          </div>
          <div>
            <button type="submit" value="delete">
              Delete Employee
            </button>
          </div>
        </form>
      </div>

      {/* Form for updating employee */}
      <div className="form-container">
        <h2>Update Employee</h2>
        <form method="POST" action="http://localhost:5001/update-employee">
          <div>
            <label>ID</label>
            <input type="number" name="ID" required />
          </div>
          <div>
            <label>Updated First Name</label>
            <input type="text" name="employeeFName" required />
          </div>
          <div>
            <label>Updated Last Name</label>
            <input type="text" name="employeeLName" required />
          </div>
          <div>
            <label>Updated Location</label>
            <input type="number" name="location" required />
          </div>
          <div>
            <button type="submit"> Update Employee </button>
          </div>
        </form>
      </div>

      <main>
        {loading === true ? (
          <div>
            <h1>Loading...</h1>
          </div>
        ) : (
          <section>
            {apiData.map((employee) => {
              const employeeId = employee[0];
              const employeeFName = employee[1];
              const employeeLName = employee[2];
              const employeeLocation = employee[3];

              return (
                <div className="employee-container" key={String(employeeId)}>
                  <h1>
                    {employeeFName} {employeeLName}
                  </h1>
                  <p>
                    <strong>ID:</strong> {employeeId}
                  </p>
                  <p>
                    <strong>Location:</strong> {employeeLocation}
                  </p>
                </div>
              );
            })}
          </section>
        )}
      </main>
    </Fragment>
  );
};

export default App;
