//Importing all necessary node constants and custom data functions
const fs = require('fs');
const http = require('http');
const url = require('url');
const dataConvert = require('./data/dataConvert');
const hierarchy = require('./data/hierarchy');

//Importing all the necessary html files
const homepage = fs.readFileSync(
    `${__dirname}/pages/homepage.html`, 'utf-8');
const option = fs.readFileSync(
    `${__dirname}/pages/option.html`, 'utf-8');
const employee = fs.readFileSync(
    `${__dirname}/pages/employee.html`, 'utf-8');
const search = fs.readFileSync(
    `${__dirname}/pages/search.html`, 'utf-8');


//Importing all the necessary css files
const css = {
    homepage: fs.readFileSync(`${__dirname}/resources/homepage.css`, 'utf-8'),
    navbar: fs.readFileSync(`${__dirname}/resources/navbar.css`, 'utf-8'),
    search: fs.readFileSync(`${__dirname}/resources/search.css`, 'utf-8'),
    employee: fs.readFileSync(`${__dirname}/resources/employee.css`, 'utf-8'),
}

//Importing and parsing the json data
const data = fs.readFileSync(`${__dirname}/data/data.json`, 'utf-8');
const dataObj = JSON.parse(data);

//Creating the http server
const server = http.createServer((req, res) => {
    const {
        query,
        pathname
    } = url.parse(req.url, true);

    /* These if/else statements make sure all of the necessary pages, data and css are written to the server
       It also allows for all the json data to be included on the site instead of the placeholders, using my functions in the data folder */
    if (pathname === '/') {
        res.writeHead(308, {
            "Location": "http://" + req.headers['host'] + req.url + "homepage"
        });
        res.end();

    } else if (pathname === '/homepage') {
        res.writeHead(200, {
            'Content-type': 'text/html'
        });
        const options = dataObj.map(el => dataConvert(option, el)).join(''); //Uses the dataconvert method to display the json data on the page
        const output = homepage.replace('employeeOption', options);
        res.end(output);

    } else if (pathname === '/employee') {
        res.writeHead(200, {
            'Content-type': 'text/html'
        });
        const employeeData = dataObj[query.id]; //Getting the id of the employee as a query
        let output = dataConvert(employee, employeeData); //Uses the dataconvert method to display the json data on the page
        output = hierarchy(output, employeeData, dataObj); //Uses the hierarchy method to display the data on the employee page hierarchy section
        res.end(output);

    } else if (pathname === '/api') {
        res.writeHead(200, {
            'Content-type': 'application/json'
        });
        res.end(data);

    } else if (pathname === '/search') {
        res.writeHead(200, {
            'Content-type': 'text/html'
        });
        const output = search;
        res.end(output);

    } else if (pathname === '/homepage.css') {
        res.writeHead(200, {
            'Content-type': 'text/css'
        })
        res.end(css.homepage)

    } else if (pathname === '/employee.css') {
        res.writeHead(200, {
            'Content-type': 'text/css'
        })
        res.end(css.employee)
    } else if (pathname === '/search.css') {
        res.writeHead(200, {
            'Content-type': 'text/css'
        })
        res.end(css.search)
    } else if (pathname === '/navbar.css') {
        res.writeHead(200, {
            'Content-type': 'text/css'
        })
        res.end(css.navbar)
    }
});

//Allowing the server to listen on localhost and port 8000
server.listen(8000, '127.0.0.1', () => {
    console.log('Please type localhost:8000 in your browser, unless you are running test scripts');
});

module.exports = server //Ensures the server is run and closed correctly during testing