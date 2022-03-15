/* Function to replace the json data with a format useable by the interface */
module.exports = (temp, employee) => {
    let output = temp.replace(/{%EMPNAME%}/g, employee.empName);
    output = output.replace(/{%ID%}/g, employee.id);
    output = output.replace(/{%DIVISION%}/g, employee.division);
    output = output.replace(/{%JOINEDON%}/g, employee.joinedOn);
    output = output.replace(/{%EMAIL%}/g, employee.email);
    output = output.replace(/{%PHONE%}/g, employee.phone);
    output = output.replace(/{%DESCRIPTION%}/g, employee.description);
    return output;
}
